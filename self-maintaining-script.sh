#!/bin/bash

# Variables

# URL to Source Repo which is checked (where the raw script code is hosted)
UPDATE_SOURCE="https://raw.githubusercontent.com/ashleycawley/updating-test/master/self-maintaining-script.sh"

# URL to check to see if update should proceed
UPDATE_AUTH_CHECK_URL="http://status.ashleycawley.co.uk/update-updating-test.txt"

source ./update.lib