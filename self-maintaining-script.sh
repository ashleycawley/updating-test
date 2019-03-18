#!/bin/bash

# Variables

CURDIR=`/bin/pwd`
BASEDIR=$(dirname $0)
ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
echo "========== DIAG =========="
echo "CURDIR is $CURDIR"
echo "BASEDIR is $BASEDIR"
echo "ABSPATH is $ABSPATH"
echo "ABSDIR is $ABSDIR"
echo "========== DIAG =========="

# URL to Source Repo which is checked (where the raw script code is hosted)
UPDATE_SOURCE="https://raw.githubusercontent.com/ashleycawley/updating-test/master/self-maintaining-script.sh"

# URL to check to see if update should proceed
UPDATE_AUTH_CHECK_URL="http://status.ashleycawley.co.uk/update-updating-test.txt"

source `pwd`/update.lib