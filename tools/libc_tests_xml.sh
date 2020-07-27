#!/bin/bash

echo "Running libc tests."
export CMOCKA_XML_FILE="$MESON_BUILD_ROOT/test/%g.xml"
echo "CMOCKA_XML_FILE=$CMOCKA_XML_FILE"
$MESON_BUILD_ROOT/test/libc_test

