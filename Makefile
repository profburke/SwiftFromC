#
# @file Makefile (toplevel)
# @project SwiftFromC
# @author Matthew M. Burke <matthew.burke@captialone.com>
# @version 1.0 (2016-07-15)
#

CP=/bin/cp
RM=/bin/rm

demo: swiftFromC
	@echo "\nThe demo program is all built.\nHere's the output from the program:\n"
	@./csrc/swiftFromC

swiftFromC: library
	$(CP) -f libswiftfromc.so csrc
	$(MAKE) -C csrc

library: Sources/library.swift
	swift build -Xswiftc -emit-library

clean:
	$(RM) -f libswiftfromc.so
	$(RM) -f *~
	$(RM) -f Sources/*~
	$(MAKE) -C csrc clean

distclean: clean
	$(RM) -rf .build
	$(MAKE) -C csrc distclean

.PHONY: all clean realclean

