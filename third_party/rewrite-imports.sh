#!/bin/sh

#TODO(mpl): patch github.com/cznic/zappy on the fly to make it pure Go.
if [ "$1" = "-l" ]
then
	find . -type f -name '*.go' -exec grep -E -l '"code.google.com/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"launchpad.net/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"github.com/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"labix.org/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"bazil.org/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"golang.org/' {} \;
	find . -type f -name '*.go' -exec grep -E -l '"google.golang.org/' {} \;
elif [ "$1" = "-w" ]
then
	find . -type f -name '*.go' -exec perl -pi -e 's!"code.google.com/!"camlistore.org/third_party/code.google.com/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"launchpad.net/!"camlistore.org/third_party/launchpad.net/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"github.com/!"camlistore.org/third_party/github.com/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"labix.org/!"camlistore.org/third_party/labix.org/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"bazil.org/!"camlistore.org/third_party/bazil.org/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"golang.org/!"camlistore.org/third_party/golang.org/!' {} \;
	find . -type f -name '*.go' -exec perl -pi -e 's!"google.golang.org/!"camlistore.org/third_party/google.golang.org/!' {} \;
else
	cat << heredoc
usage: rewrite-imports.sh -l|-w"
	-l: list files where a rewrite is needed"
	-w: actually performs the rewrite"
heredoc
fi
