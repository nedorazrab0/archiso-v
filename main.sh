#!/usr/bin/env bash
#
# Build an archiso
set -e
readonly conf='/baseline'
readonly path='/docker'

pacman -Sy archiso --noconfirm --disable-sandbox
name="ARCHISO-v$(date '+%d%m%y')"

cd /
cp -R "/usr/share/archiso/configs${conf}" .
mkdir -p "${conf}/airootfs/etc/"{sysctl.d,xdg/reflector,udev/rules.d}
mkdir -p "${conf}/airootfs/etc/systemd/timesyncd.conf.d"

cp "${path}/packages.x86_64" "${conf}"
cp "${path}/25-wireless.network" "${conf}/airootfs/etc/systemd/network"
cp "${path}/60-io.rules" "${conf}/airootfs/etc/udev/rules.d"
cp "${path}/99-sysctl.conf" "${conf}/airootfs/etc/sysctl.d"
cp "${path}/ntp.conf" "${conf}/airootfs/etc/systemd/timesyncd.conf.d"
cp "${path}/reflector.conf" "${conf}/airootfs/etc/xdg/reflector"

sed "s/NAME/${name}/" "${path}/profiledef.sh" > "${conf}/profiledef.sh"
cat "${path}/20-wired.network" > "${conf}/airootfs/etc/systemd/network/20-ethernet.network"
cat "${path}/arch-lts.conf" > "${conf}/efiboot/loader/entries/01-archiso-x86_64-linux.conf"
cat "${path}/linux.preset" > "${conf}/airootfs/etc/mkinitcpio.d/linux.preset"

echo "$name" \
  > "${conf}/airootfs/etc/hostname"
echo 'root:x:0:0:root:/root:/usr/bin/bash' \
  > "${conf}/airootfs/etc/passwd"
echo 'root::1::::::' \
  > "${conf}/airootfs/etc/shadow"

echo '- Building archiso...'
mkarchiso -v -w ./build "${conf}"
