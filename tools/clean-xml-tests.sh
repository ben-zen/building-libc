#!/bin/bash
# Pulled this command from the Wikipedia page on `rm`.

find $MESON_BUILD_ROOT -name '*.xml' -exec rm {} +
