SRCS+= protocol.c
SRCS+= engine.c
SRCS+= bootimg.c
SRCS+= fastboot.c
SRCS+= usb_linux.c
SRCS+= util_linux.c

VPATH+= ./libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c

VPATH+= ./zlib/src
SRCS+= adler32.c
SRCS+= compress.c
SRCS+= crc32.c
SRCS+= deflate.c
SRCS+= gzclose.c
SRCS+= gzlib.c
SRCS+= gzread.c
SRCS+= gzwrite.c
SRCS+= infback.c
SRCS+= inffast.c
SRCS+= inflate.c
SRCS+= inftrees.c
SRCS+= trees.c
SRCS+= uncompr.c
SRCS+= zutil.c

VPATH+= ./ext4_utils
SRCS+= make_ext4fs.c
SRCS+= ext4fixup.c
SRCS+= ext4_utils.c
SRCS+= allocate.c
SRCS+= contents.c
SRCS+= extent.c
SRCS+= indirect.c
SRCS+= uuid.c
SRCS+= sha1.c
SRCS+= wipe.c
SRCS+= crc16.c

VPATH+= ./libsparse
SRCS+= backed_block.c
SRCS+= output_file.c
SRCS+= sparse.c
SRCS+= sparse_crc32.c
SRCS+= sparse_err.c
SRCS+= sparse_read.c

VPATH+= ./libselinux/src
SRCS+= callbacks.c
SRCS+= check_context.c
SRCS+= freecon.c
SRCS+= init.c
SRCS+= label.c
SRCS+= label_file.c
SRCS+= label_android_property.c

CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -I .
CPPFLAGS+= -I ./include
CPPFLAGS+= -I ./mkbootimg
CPPFLAGS+= -I ./zlib
CPPFLAGS+= -I ./ext4_utils
CPPFLAGS+= -I ./libsparse/include
CPPFLAGS+= -I ./libselinux/include

CFLAGS+= -O2 -g -Wall -Wno-unused-parameter -fPIC
LDFLAGS= -static
 
TOOLCHAIN= arm-linux-
#TOOLCHAIN= 
CC= $(TOOLCHAIN)gcc
LD= $(TOOLCHAIN)gcc

#CC= gcc
#LD= gcc

OBJS= $(SRCS:.c=.o)
 
all: fastboot
 
fastboot: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)