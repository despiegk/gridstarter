set +ex
cd /root
export VM="win"
virsh destroy $VM
# virsh destroy --domain $VM
virsh undefine --domain $VM
set -ex
rm -f $VM.qcow2
qemu-img create -f qcow2 $VM.qcow2 15G
qemu-img create -f raw ${VM}_swap.qcow2 10G
virt-install --connect qemu:///system \
  --name $VM --ram 4000 --vcpus 8 \
  --network network=default,model=virtio \
  --disk path=$VM.qcow2,device=disk,bus=virtio \
  --disk path=${VM}_swap.qcow2,device=disk,bus=virtio \
  --cdrom /root/win_64.iso \
  --disk path=/root/virtio-win-0.1.225.iso,device=cdrom \
  --graphics vnc,listen=0.0.0.0 --noautoconsole \
  --check path_in_use=off \
  --os-variant win10

virsh vncdisplay $VM

virsh start $VM


virsh list --all
virsh dumpxml $VM > ${VM}3.xml

export VM="win"
virsh destroy $VM
virsh undefine --domain $VM
virsh define --file ${VM}.xml
virsh start $VM

qemu-img convert -C -O qcow2 win.qcow2 win_template2.qcow2

export VM="win"
export WINIMG=/root/win_64.iso
export VIRTIMG=/root/virtio-win-0.1.225.iso
qemu-system-x86_64 --enable-kvm -drive driver=qcow2,file=~/${VM}.qcow2,if=virtio -m 6144 \
-name kds \
-net nic,model=virtio -net user -cdrom ${WINIMG} \
-drive file=${VIRTIMG},index=3,media=cdrom \
-rtc base=localtime,clock=host -smp cores=4,threads=8 \
-usb -device usb-tablet \
-net user,smb=$HOME \
-vga qxl -device virtio-serial-pci -spice port=5900,password=Kds007kds -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent

export VM="win"
export WINIMG=/root/win_64.iso
export VIRTIMG=/root/virtio-win-0.1.225.iso
qemu-system-x86_64 --enable-kvm -drive driver=qcow2,file=${VM}.qcow2,if=virtio -m 6144 \
-net nic,model=virtio -net user \
-cdrom ${WINIMG} \
-drive file=${VIRTIMG},index=3,media=cdrom \
-rtc base=localtime,clock=host -smp cores=8 \
-usb -device usb-tablet \
-vga qxl \
-spice port=5924,disable-ticketing=on \
-device virtio-serial \
-chardev spicevmc,id=vdagent,name=vdagent \
-device virtserialport,chardev=vdagent,name=com.redhat.spice.0


-vga qxl -device virtio-serial-pci -spice port=5900 -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent


# virt-install --os-variant list
# virsh destroy --domain $VM
# virsh undefine --domain $VM


  
  
#   --disk size=20 \


#   --os-distro windows --os-version 2012

#1010 is the pin


ssh -A root@192.168.88.35