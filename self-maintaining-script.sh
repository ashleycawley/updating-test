#!/bin/bash

# Variables

### Automatic Updater ###

# The two variables below need configuring appropriately if you want this application to be
# self-updating in the future. It can check a central repository for code updates, and checks
# a third-party server to confirm if it should proceed with an update.

# URL to Source Repo which is checked (where the raw script code is hosted)
UPDATE_SOURCE="https://raw.githubusercontent.com/ashleycawley/updating-test/master/self-maintaining-script.sh"

# URL to check to see if update should proceed
UPDATE_AUTH_CHECK_URL="http://status.ashleycawley.co.uk/update-updating-test.txt"

# Includes code from the automatic updater library
source `dirname $0`/update.lib