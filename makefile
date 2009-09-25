PREFIX=.
INCLUDE_PATH=$(PREFIX)/include
SRC_PATH=$(PREFIX)/src
LIB_PATH=$(PREFIX)/lib

all: prefix include lib

prefix:
ifneq "$(PREFIX)" ""
	mkdir -p $(PREFIX)
endif

include: $(INCLUDE_PATH)/scm-lib_.scm
$(INCLUDE_PATH)/%.scm: $(SRC_PATH)/%.scm
	mkdir -p $(INCLUDE_PATH)
	cp -f $< $@

lib: $(LIB_PATH)/scm-lib.o1
$(LIB_PATH)/%.o1: $(SRC_PATH)/%.scm
	mkdir -p $(LIB_PATH)
	gsc -o $@ $<