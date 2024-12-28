iso_name='archiso'
iso_label='NAME'
iso_publisher='Arch Linux <https://archlinux.org>'
iso_application='Arch Linux baseline'
iso_version='v'
install_dir='arch'
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp')
arch='x86_64'
pacman_conf='pacman.conf'
airootfs_image_type='erofs'
#-zzstd,level=20,dictsize=1048576 '-C262144'
airootfs_image_tool_options=(
  '-zlz4'
  '-Efragments,dedupe,force-inode-compact,ztailpacking'
  '--workers=4'
  '-T0'
)
bootstrap_tarball_compression=('zstd' '-T0' '--ultra' '-20zc')
file_permissions=(
  ['/etc/shadow']='0:0:400'
  ['/usr/local/bin/arch-install']='0:0:555'
)
