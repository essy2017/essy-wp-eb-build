#!/bin/bash

# Set this to your local WordPress development installation.
wordpress_local=/path/to/wordpress/directory

# Exit on error.
set -e

# Create build directory.
echo Creating build directory...
rm -rf build
mkdir -p build

# Copy local WordPress installation.
echo Copying WordPress...
cp -r $wordpress_local/* build

# If you need to clean up plugins or themes you can do so here. For instance, 
# the theme essycode includes a scripts directory used for its own build process 
# that does not need to make it to production:
# 
# rm -rf build/wp-content/themes/essycode/scripts

# Copy visible and hidden server files.
echo Copying server files...

for filename in assets/server-files/*; do
  file=$(basename $filename)
  cp $filename build/$file
done

for filename in assets/server-files/.*; do
  if [ -f $filename ]; then
    file=$(basename $filename)
    cp $filename build/$file
  fi
done

# Copy elastic beanstalk extensions and remove sample configurations.
echo Copying .ebextensions...
cp -r assets/.ebextensions build

# Create artifact.
echo Creating artifact...
cd build
zip -rq ../artifact.zip .
