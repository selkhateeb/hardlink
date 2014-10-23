DESTDIR = $(PREFIX)
ifeq ($(DESTDIR),)
DESTDIR=/usr/local
endif
BINDIR = $(addprefix $(DESTDIR)/,bin)
NAME = hardlink-osx
README  = README.md
SOURCE =  hardlink.c
OUTPUT = $(addprefix $(PWD)/, $(NAME))
COMPILER = $(GCC)
ifeq ($(COMPILER),)
COMPILER=gcc
endif

all: 
	-mkdir $(BINDIR) &>/dev/null
	$(COMPILER) $(SOURCE) -o $(OUTPUT)

install:  $(NAME)
	install -v $(OUTPUT) $(BINDIR)

install-homebrew:  $(NAME)
	install -v $(README) $(OUTPUT) $(DESTDIR)

.PHONY: clean

clean:
	-rm -f $(OUTPUT)