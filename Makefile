#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/italian-schools-data-fetcher
DATA_DIR=$(DESTDIR)$(PREFIX)/share/italian-schools-data-fetcher
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard italian-schools-data-fetcher/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-italian-schools-data-fetcher install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-italian-schools-data-fetcher:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 italian-schools-data-fetcher/italian-schools-data-fetcher "$(BIN_DIR)"

.PHONY: check install install-doc install-italian-schools-data-fetcher shellcheck
