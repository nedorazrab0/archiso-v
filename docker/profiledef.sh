iso_name='archiso'
iso_label='NAME'
iso_publisher='<https://github.com/nedorazrab0/archiso-v>'
iso_application='Arch Linux baseline'
iso_version='v'
install_dir='arch'
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp')
arch='x86_64'
pacman_conf='pacman.conf'
airootfs_image_type='erofs'
airootfs_image_tool_options=(
  '-zlzma,level=109,dictsize=8388608'
  '-Efragments,dedupe,force-inode-compact,ztailpacking'
  '-C1048576'
  '-T0'
  '--workers=4'
)
file_permissions=(
  ['/etc/shadow']='0:0:400'
  ['/usr/local/bin/arch-install']='0:0:555'
  ['/usr/local/bin/mkfs.service.zram']='0:0:555'
)
