
OUTPUT=hardlink
C_FILES=hardlink.c

all:
	gcc ${C_FILES} -o ${OUTPUT}

clean:
	rm ${OUTPUT}

install:
	cp ${OUTPUT} /usr/local/bin/