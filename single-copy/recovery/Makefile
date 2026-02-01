PWD := $(shell pwd)
DL_DIR := $(if $(BR2_DL_DIR),$(BR2_DL_DIR),$(PWD)/../../dl)
BR_DIR := $(PWD)/../../buildroot

all:
%:
	BR2_DL_DIR=$(DL_DIR) $(MAKE) BR2_EXTERNAL="$(PWD)" O="$(PWD)/output" -C "$(BR_DIR)" $(MAKEOVERRIDES) $@

