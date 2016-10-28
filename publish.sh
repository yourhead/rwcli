#!/bin/sh

#  publish.sh
#  cli
#
#  Created by Isaiah Carew on 10/28/16.
#  Copyright © 2016 Isaiah Carew. All rights reserved.




set -v


# tools
RW="/Applications/Rapidweaver 7.app/Contents/MacOS/RapidWeaver 7"
MKDIR="/bin/mkdir"
RM="/bin/rm -f"


# files
TEST_FILE="cli-test.rw"
TEST_PATH="${PROJECT_DIR}/${TEST_FILE}"
PUBLISH_DIR="/Users/`whoami`/Desktop/publish"


echo "${TEST_FILE}"
echo "${TEST_PATH}"
echo "${PUBLISH_DIR}"


# clear and create a fresh publish directory
rm -rf "${PUBLISH_DIR}"
mkdir "${PUBLISH_DIR}"


# run rw publish
"${RW}" "${TEST_PATH}" --publish all


exit 0
