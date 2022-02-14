obj-m   := simp.o
 
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)
BUILD_DIR_MAKEFILE ?= $(PWD)/Makefile
 
all: default
 
default:
        $(MAKE) -C $(KERNELDIR) M=$(PWD) src=$(PWD) modules

$(BUILD_DIR):
        mkdir -p "$@"

$(BUILD_DIR_MAKEFILE): $(PWD)
        touch "$@"
 
clean:
        make -C $(KDIR) M=$(BUILD_DIR) src=$(PWD) clean
