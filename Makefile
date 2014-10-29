# Makefile
# hardlink-osx 
# output: hln
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
ifeq ($(PREFIX),)
PREFIX=./
endif

all: 
	$(COMPILER) "$(SOURCE)" -o "$(OUTPUT)"

install:  $(NAME)
	install -v "$(NAME)" "$(BINDIR)"

install-homebrew:  $(NAME)
	-mkdir -p "$(BINDIR)" &>/dev/null
	install -v "$(README)" "$(PREFIX)"
	install -v "$(NAME)" "$(BINDIR)"

.PHONY: clean

clean:
	-rm -f "$(OUTPUT)"