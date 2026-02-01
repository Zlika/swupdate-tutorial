#!/bin/bash
set -e

# Copie des fichiers à mettre dans l'archive swupdate dans le répertoire de sortie
cp $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/board/sw-description $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/
cp $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/board/update_boot.sh $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/

# Calcul des hashs des images
RECOVERY_IMAGE_HASH=$(sha256sum $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/recovery.vfat | cut -d ' ' -f 1)
sed -i "s/.*RECOVERY_IMAGE_HASH.*/\t\t\tsha256sum = \"$RECOVERY_IMAGE_HASH\";/" $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/sw-description
MAIN_IMAGE_HASH=$(sha256sum $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/rootfs.ext2.gz | cut -d ' ' -f 1)
sed -i "s/.*MAIN_IMAGE_HASH.*/\t\t\tsha256sum = \"$MAIN_IMAGE_HASH\";/" $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/sw-description

# Signature du fichier sw-description avec la clef secrète
openssl dgst -sha256 -sign $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/board/swupdate-priv.pem $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/sw-description > $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images/sw-description.sig

# Génération de l'archive swupdate
cd $BR2_EXTERNAL_SINGLE_COPY_MAIN_PATH/output/images
SWU_FILES="sw-description sw-description.sig update_boot.sh recovery.vfat rootfs.ext2.gz"
for i in $SWU_FILES; do
	echo $i; done | cpio -ov -H crc > sdcard.swu

