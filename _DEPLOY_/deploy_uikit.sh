#!/bin/zsh

# Ensure the script is executed with an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-target-project-root>"
    exit 1
fi

TARGET_ROOT=$1
UIKIT_REPO=$(dirname "$PWD")  # This will set UIKIT_REPO to the parent directory, which is the root of the uikit repository

# Create the 'ui' folder in the target project's root directory
mkdir -p "$TARGET_ROOT/ui"

# Copy the dist, src, and tests directories to the ui folder
cp -R "$UIKIT_REPO/dist" "$TARGET_ROOT/ui/"
cp -R "$UIKIT_REPO/src" "$TARGET_ROOT/ui/"
cp -R "$UIKIT_REPO/tests" "$TARGET_ROOT/ui/"

# Remove content of the ui/dist/css directory and place there only the uikit.css, and add specific.css inside the ui/dist/css folder
rm -r "$TARGET_ROOT/ui/dist/css"
mkdir "$TARGET_ROOT/ui/dist/css"
cp "$UIKIT_REPO/dist/css/uikit.css" "$TARGET_ROOT/ui/dist/css"
cp "$PWD/css/specific.css" "$TARGET_ROOT/ui/dist/css"

# Create the 'brand' folder and its subfolders inside the ui/dist directory
mkdir -p "$TARGET_ROOT/ui/dist/brand/fonts"
mkdir -p "$TARGET_ROOT/ui/dist/brand/elements"
mkdir -p "$TARGET_ROOT/ui/dist/brand/icons"
mkdir -p "$TARGET_ROOT/ui/dist/brand/social"

# Copy the test.js from the _DEPLOY_/tests/js directory
cp "$PWD/tests/js/test.js" "$TARGET_ROOT/ui/tests/js/"

# Create the 'site' folder and other required subfolders inside the ui directory
mkdir -p "$TARGET_ROOT/ui/site"
ln -s "$TARGET_ROOT/ui/src/images" "$TARGET_ROOT/ui/site/images"
ln -s "$TARGET_ROOT/ui/src/images" "$TARGET_ROOT/ui/images"
mkdir -p "$TARGET_ROOT/ui/site/less"
cp -R "$TARGET_ROOT/ui/src/less/theme" "$TARGET_ROOT/ui/site/less/orig-theme"
cp -R "$TARGET_ROOT/ui/src/less/components" "$TARGET_ROOT/ui/site/less/orig-core"

# Copy the site-mod folder and uikit-site.less from the _DEPLOY_/less directory
cp -R "$PWD/less/site" "$TARGET_ROOT/ui/site/less/"
cp "$PWD/less/uikit.site.less" "$TARGET_ROOT/ui/site/less/"

echo "Deployment completed successfully."
