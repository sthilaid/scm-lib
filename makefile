PREFIX=.
INCLUDE_PATH=$(PREFIX)/include
SRC_PATH=$(PREFIX)/src
LIB_PATH=$(PREFIX)/lib

all: prefix include src lib

prefix:
ifneq "$(PREFIX)" ""
	mkdir -p $(PREFIX)
endif

include: $(INCLUDE_PATH)/scm-lib-macro.scm
$(INCLUDE_PATH)/scm-lib-macro.scm : scm-lib-macro.scm
	mkdir -p $(INCLUDE_PATH)
	cp $< $@

src: $(SRC_PATH)/scm-lib.scm
$(SRC_PATH)/%.scm : %.scm
	mkdir -p $(SRC_PATH)
	cp $< $@

lib: $(LIB_PATH)/scm-lib.o1
$(LIB_PATH)/scm-lib.o1: scm-lib.scm
	mkdir -p $(LIB_PATH)
	gsc -o $@ scm-lib.scm