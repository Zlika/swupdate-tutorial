#!/bin/bash
set -e

# Génération de la clef publique RSA pour swupdate à partir de la clef privée
openssl rsa -in "$BR2_EXTERNAL_SINGLE_COPY_RECOVERY_PATH/board/swupdate-priv.pem" -out "$TARGET_DIR/etc/swupdate/swupdate-public.pem" -outform PEM -pubout

