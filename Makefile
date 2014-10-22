
DESTDIR ?=
PREFIX  ?= /usr
BINDIR  ?= $(PREFIX)/bin
MYCC     = $(GCC
OUTPUT   = hardlink
C_FILES =  hardlink.c

all:
	gcc ${C_FILES} -o ${OUTPUT}

clean:
	rm ${OUTPUT}

install: hardlink-osx
	install -d  $(DESTDIR)$(BINDIR)
