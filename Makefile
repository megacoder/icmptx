CFLAGS	=-g3 -ansi -pedantic -D_GNU_SOURCE -pedantic -Wall -Werror
LDFLAGS	=
BASKET=$(shell [ -f .gitignore ] && cat .gitignore)

CFILES	=$(wildcard *.c)
HFILES	=$(wildcard *.h)

OBS	=${CFILES:*.c=*.o}

all::	icmptx
all::	tags

tags::	${HFILES} ${CFILES}
	ctags ${HFILES} ${CFILES}

vars::
	@echo 'BASKET=${BASKET}'

icmptx:	${OBS}

clean::
	${RM} *.o tags

distclean clobber:: clean
	${RM} icmptx
