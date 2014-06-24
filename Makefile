
OUTPUT=hardlink
C_FILES=hardlink.c

all:
	gcc ${C_FILES} -o ${OUTPUT}

clean:
	rm ${OUTPUT}

install: all

	# Create directory & set permissions if doesn't exist
	mkdir -pv -m 755 /usr/local/bin/

	# Copy hardlink output executable 
	cp ${OUTPUT} /usr/local/bin/
