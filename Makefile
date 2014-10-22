
CURDIR  = $(PWD)
DESTDIR = $(PREFIX)
BINDIR  = $(PREFIX)/bin
MYGCC   = $(GCC)
OUTPUT  = hardlink
README  = README.md
C_FILES =  hardlink.c

all:
	gcc ${C_FILES} -o ${OUTPUT}

clean:
	rm ${OUTPUT}

install: hardlink-osx
	install -t ${DESTDIR} ${README} 
	install -d ${DESTDIR} ${BINDIR}
