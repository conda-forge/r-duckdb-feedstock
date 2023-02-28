#!/bin/bash

export DISABLE_AUTOBREW=1

# R refuses to build packages that mark themselves as Priority: Recommended
mv DESCRIPTION DESCRIPTION.old
grep -va '^Priority: ' DESCRIPTION.old > DESCRIPTION

export MACOSX_VERSION_MIN="10.13"
sed -ie 's/PKG_CPPFLAGS =/PKG_CPPFLAGS = -D_LIBCPP_DISABLE_AVAILABILITY/' src/Makevars

${R} CMD INSTALL --build . ${R_ARGS}

