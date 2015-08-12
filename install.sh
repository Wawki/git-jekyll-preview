#!/bin/bash -ex
#
# Install the chef ruby gem if chef-solo is not in the path.
# This script is safe to run multiple times.
#
if [ ! `which chef-solo` ]; then
    apt-get install -y ruby2.0 ruby2.0-dev build-essential
    gem2.0 install chef ohai --no-rdoc --no-ri
fi

BASE=`dirname $0`
PREFIX="${BASE:0:1}"

if [ $PREFIX != '/' ]; then
    BASE="`pwd`/${BASE}"
fi

chef-solo -c $BASE/chef/solo.rb \
          -j $BASE/chef/roles.json
