#!/bin/bash
set -e

# Modification du fichier config.txt pour que start.elf charge U-Boot au lieu du noyau Linux
sed -i 's/^kernel=.*/kernel=u-boot.bin/' $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/rpi-firmware/config.txt

# Copie le noyau dans le système de fichiers racine
cp $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/Image $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/target/

# Copie le noyau "recovery" et le fichier extlinux.conf correspondant dans le répertoire de sortie du projet
cp $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/../recovery/output/images/Image $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/RecoveryImage
mkdir -p $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/extlinux
cp $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/board/extlinux_recovery.conf $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/extlinux/extlinux.conf

