# Makefile
# hardlink-osx
# Oct. 22, 2014

DESTDIR = $(PREFIX)
ifeq ($(DESTDIR),)
DESTDIR=/usr/local
endif
BINDIR = $(addprefix $(DESTDIR)/,bin)
NAME = hln
README  = README.md
SOURCE =  hln.c
OUTPUT = $(addprefix $(PWD)/, $(NAME))
COMPILER = $(GCC)
ifeq ($(COMPILER),)
COMPILER=gcc
endif

all: 
	$(COMPILER) "$(SOURCE)" -o "$(OUTPUT)"

install:  $(NAME)
	install -vb "$(OUTPUT)" "$(BINDIR)"

install-homebrew:  $(NAME)
	install -vb "$(README)" "$(OUTPUT)" "$(BINDIR)"

.PHONY: clean

clean:
	-rm -f "$(OUTPUT)"