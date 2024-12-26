iso_name='archiso'
iso_label='NAME'
iso_publisher='Arch Linux <https://archlinux.org>'
iso_application='Arch Linux baseline'
iso_version='v'
install_dir='arch'
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp')
arch='x86_64'
pacman_conf="pacman.conf"
airootfs_image_type='erofs'
#-zlzma,level=109,dictsize=8388608
airootfs_image_tool_options=(
  '-zlz4hc,level=12'
  '-Efragments-all,dedupe,force-inode-compact,ztailpacking'
  '-C1048576'
  '--workers=0'
)
bootstrap_tarball_compression=('zstd' '-T0' '--ultra' '-20zc')
file_permissions=(
  ['/etc/shadow']='0:0:400'
)
