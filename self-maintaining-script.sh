#!/bin/bash

# Variables

# URL to Source Repo which is checked (where the raw script code is hosted)
UPDATE_SOURCE="https://raw.githubusercontent.com/ashleycawley/updating-test/master/self-maintaining-script.sh"

# URL to check to see if update should proceed
TWOFA="http://status.ashleycawley.co.uk/update-updating-test.txt"

# Location of 2FA Temp file
TWOFA_TEMP_FILE="/tmp/update-2fa.txt"

# Scripts current md5sum hash
MD5_OF_LOCAL_SCRIPT=(`md5sum $0`)

# Downloads script from source URL, extracts md5sum and then deletes the temporary file
ONLINE_MD5=(`wget -q -O /tmp/testing.md5 $UPDATE_SOURCE; md5sum /tmp/testing.md5 | awk '{print $1}'; rm -f /tmp/testing.md5`)

# Functions
function MD5_COMPARISON {
    echo "Local  : $MD5_OF_LOCAL_SCRIPT"
    echo "Remote : $ONLINE_MD5"
    echo
}

# Script
echo "Self Update Initiated: `date`"
MD5_COMPARISON

echo -e "Comparison check: \c"

if [ $MD5_OF_LOCAL_SCRIPT != $ONLINE_MD5 ]
then
    echo "Version Mismatch!
    "
    
    # Checks third-party server to see if an update cycle has been acknowledged
    if [ `wget -q -O $TWOFA_TEMP_FILE $TWOFA; cat $TWOFA_TEMP_FILE` == "UPDATE" ]
    then
        echo "Update server acknowledges update cycle."
        echo "Downloading newer version from $UPDATE_SOURCE"

        # Downloads new version and makes it executable
        wget -q -O $0 $UPDATE_SOURCE
        chmod +x $0

        # Clean up temporary 2FA file
        rm -f $TWOFA_TEMP_FILE
    else
        echo "Update server has not acknowledged that an updated version has been released - No update will be performed."
        
        # Clean up temporary 2FA file
        rm -f $TWOFA_TEMP_FILE
    fi

    echo "Performing another md5sum check local vs remote..."

    # Scripts current md5sum hash
    MD5_OF_LOCAL_SCRIPT=(`md5sum $0`)
    
    # Downloads script from source URL, extracts md5sum and then deletes the temporary file
    ONLINE_MD5=(`wget -q -O /tmp/testing.md5 $UPDATE_SOURCE; md5sum /tmp/testing.md5 | awk '{print $1}'; rm -f /tmp/testing.md5`)

    MD5_COMPARISON
else
    echo "Local & Remote md5sum are equal - This script is up to date."
fi

echo "================================================================="

exit 0
