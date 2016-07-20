#
# @file Makefile (toplevel)
# @project SwiftFromC
# @author Matthew M. Burke <matthew.burke@captialone.com>
# @version 1.0 (2016-07-15)
#

export CP=/bin/cp
export RM=/bin/rm
export LIBSUFFIX=so

export UNAME_S = $(shell uname -s)
ifeq ($(UNAME_S), Darwin)
  export LIBSUFFIX=dylib
endif


demo: swiftFromC
	@echo "\nThe demo program is all built.\nHere's the output from the program:\n"
	@LD_LIBRARY_PATH=./csrc ./csrc/swiftFromC

swiftFromC: library
	$(CP) -f libswiftfromc.$(LIBSUFFIX) csrc
	$(MAKE) -C csrc

library: Sources/library.swift
	swift build -Xswiftc -emit-library

clean:
	$(RM) -f libswiftfromc.$(LIBSUFFIX)
	-$(RM) -rf libswiftfromc.dylib.dSYM
	$(RM) -f *~
	$(RM) -f Sources/*~
	$(MAKE) -C csrc clean

distclean: clean
	$(RM) -rf .build
	$(MAKE) -C csrc distclean

.PHONY: demo clean distclean
