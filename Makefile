# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = src/drw.c src/dmenu.c src/stest.c src/util.c
OBJ = $(patsubst src/%.c,lib/%.o,$(SRC))

all: dmenu stest

lib/%.o: src/%.c lib
	$(CC) $(CFLAGS) -o $@ -c $<

lib:
	mkdir lib

$(OBJ): include/arg.h include/config.h include/drw.h config.mk

dmenu: lib/dmenu.o lib/drw.o lib/util.o
	$(CC) -o $@ $^ $(LDFLAGS)

stest: lib/stest.o
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -rf dmenu stest lib

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dmenu dmenu_path dmenu_run stest $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/stest

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu_path\
		$(DESTDIR)$(PREFIX)/bin/dmenu_run\
		$(DESTDIR)$(PREFIX)/bin/stest

.PHONY: all clean dist install uninstall
