#!/bin/sh

# cleandir.sh
# AddiKT1ve <the.addikt1ve@gmail.com>

# usage example:
# $ cleandir.sh jpg
# will remove all jpg from $DIRTYDIR

DIRTYDIR=$HOME/Musique/
TMPDIR=$HOME/tmp/

# Check arguments
if [ -z "$@" ]; then
	echo "Usage: $0 extension"
	exit 1
fi

# Change default delimiter
IFS='
'

# Move files to a tmp directory
for i in `find $DIRTYDIR -name *.$1`; do mv $i $TMPDIR; done
