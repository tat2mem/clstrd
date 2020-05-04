REM echo off

vboxmanage createvm --name "Alpine Parent" --register --ostype Debian_64
vboxmanage modifyvm "Alpine Parent" --memory 4096 --boot1 dvd --boot2 disk --boot3 none --boot4 none --audio none --usb on
vboxmanage modifyvm "Alpine Parent" --nic1 bridged --bridgeadapter1 "Intel(R) Dual Band Wireless-AC 3165"
vboxmanage modifyvm "Alpine Parent" --nic2 intnet --intnet2 cluster

vboxmanage createmedium disk --size 8192 --filename "%HOMEPATH%/VirtualBox VMs/Alpine Parent/Alpine Parent"

vboxmanage storagectl "Alpine Parent" --name "SATA Controller" --add sata --portcount 1
vboxmanage storageattach "Alpine Parent" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "%HOMEPATH%/VirtualBox VMs/Alpine Parent/Alpine Parent.vdi"

vboxmanage storagectl "Alpine Parent" --name "IDE Controller" --add ide
vboxmanage storageattach "Alpine Parent" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "%HOMEPATH%/VirtualBox VMs/alpine-standard-3.11.3-x86_64.iso"

vboxmanage startvm "Alpine Parent"