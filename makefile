PREFIX=.
INCLUDE_PATH=$(PREFIX)/include
LIB_PATH=$(PREFIX)/lib

all: prefix include lib

prefix:
ifneq "$(PREFIX)" ""
	mkdir -p $(PREFIX)
endif

include: $(INCLUDE_PATH)/scm-lib-macro.scm
$(INCLUDE_PATH)/scm-lib-macro.scm : scm-lib-macro.scm
	mkdir -p $(INCLUDE_PATH)
	cp $< $@

lib: $(LIB_PATH)/scm-lib.o1
$(LIB_PATH)/scm-lib.o1: scm-lib.scm
	mkdir -p $(LIB_PATH)
	gsc -o $@ scm-lib.scm