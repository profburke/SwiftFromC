#
# @file Makefile (csrc)
# @project SwiftFromC
# @author Matthew M. Burke <matthew.burke@captialone.com>
# @version 1.0 (2016-07-15)
#

RM=/bin/rm

main: main.c
	cc -o swiftFromC main.c -L . -lswiftfromc

clean:
	$(RM) -f *~
	$(RM) -f libswiftfromc.so

distclean: clean
	$(RM) -f swiftFromC

.PHONY: all clean realclean
