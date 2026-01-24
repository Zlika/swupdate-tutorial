#!/bin/bash
# Génération de la clef publique RSA pour swupdate à partir de la clef privée
openssl rsa -in "$BR2_EXTERNAL_DOUBLE_COPY_PATH/board/swupdate-priv.pem" -out "$TARGET_DIR/etc/swupdate/swupdate-public.pem" -outform PEM -pubout

