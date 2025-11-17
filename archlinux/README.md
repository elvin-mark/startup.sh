# Installation

I follow the steps from the [archlinux wiki](https://wiki.archlinux.org/title/Installation_guide)

## Presettings

List the available layouts and look for the one corresponding to your keyboard
```sh
localectl list-keymaps
```

Set the proper layout
```sh
loadkeys jp106
```

Set the font to your preference
```sh
setfont ter-132b
```

Sync the date and time
```sh
timedatectl
```

## Steps

### 1. Boot into Arch ISO

```sh
fdisk -l
```
or 

```sh
lsblk
```

### 2. Wipe the disk

```sh
wipefs -a /dev/<partition>
```

### 3. Partition the disk
```sh
cgdisk /dev/<partition>
```

**EFI system partition:**
```txt
Size: +512M
Type: EF00 (EFI System)
```
**Swap:**
```txt
Size: +4G (or your preferred size)
Type: 8200 (Linux swap)
```

**Root /:**
```txt
Use the remaining space
Type: 8300 (Linux filesystem)
```

### 4. Format Partitions
```sh
# Format EFI
mkfs.fat -F32 /dev/<partition-1>

# Format root
mkfs.ext4 /dev/<partition-3>

# Setup swap
mkswap /dev/<partition-2>
swapon /dev/<partition-2>
```

### 5. Mount Partitions

```sh
mount /dev/<partition-3> /mnt
mkdir -p /mnt/boot
mount /dev/<partition-1> /mnt/boot
```

### 6. Install Arch Linux base
```sh
pacstrap /mnt base linux linux-firmware nano
```

### 7. Generate `fstab`
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

### 8. Chroot into system

```sh
arch-chroot /mnt
```

### 9. Set Time Zone and Locale

```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

### 10. Set Hostname and Hosts file
```sh
echo archlinux > /etc/hostname

cat <<EOF > /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinux.localdomain archlinux
EOF
```

### 11. Set Root password
```sh
passwd
```

### 12. Install Bootloader (GRUB)

```sh
pacman-key --init
pacman-key --populate archlinux
```

Install `iwctl`
```sh
pacman -Syu iwd
```

```sh
pacman -S grub efibootmgr
```

```sh
pacman -S intel-ucode
```

```sh
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

### 13. Exit and reboot

```sh
exit
umount -R /mnt
reboot
```

## Post installation
```sh
pacman -S hyprland \
  xdg-desktop-portal-hyprland \
  waybar \
  rofi \
  wofi \
  thunar \
  alacritty \
  kitty \
  pipewire pipewire-pulse wireplumber \
  networkmanager network-manager-applet \
  mako \
  grim slurp wl-clipboard \
  swaybg \
  ttf-font-awesome ttf-jetbrains-mono
```

```sh
systemctl enable NetworkManager
systemctl start NetworkManager
```

```sh
sudo pacman -S iwd
```

```sh
sudo systemctl enable iwd
sudo systemctl start iwd
```

### Bluetoot
```sh
pacman -S bluez bluez-utils blueman
systemctl enable bluetooth
```

### Create User

```sh
useradd -m -G wheel -s /bin/bash yourusername
```

```sh
passwd yourusername
```

```sh
pacman -S sudo
```