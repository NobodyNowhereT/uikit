#!/bin/zsh

# Check if the target project's root directory is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-target-project-root>"
    exit 1
fi

TARGET_ROOT=$1
UIKIT_REPO=$(dirname "$PWD")  # Set UIKIT_REPO to the parent directory, which is the root of the uikit repository

# Step 2: Copy src and tests directories to the ui folder, replacing existing content
cp -R "$UIKIT_REPO/src" "$TARGET_ROOT/ui/"
cp -R "$UIKIT_REPO/tests" "$TARGET_ROOT/ui/"

# Step 3: Copy all files from dist/css to ui/dist/css, overwrite if exists
# mkdir -p "$TARGET_ROOT/ui/dist/css"
# cp -f "$UIKIT_REPO/dist/css/"* "$TARGET_ROOT/ui/dist/css/"

# Step 4: Copy all files from dist/js to ui/dist/js, overwrite if exists
# mkdir -p "$TARGET_ROOT/ui/dist/js"
cp -f "$UIKIT_REPO/dist/js/"* "$TARGET_ROOT/ui/dist/js/"

# Step 5: Copy the test.js from the _DEPLOY_/tests/js directory
cp "$PWD/tests/js/test.js" "$TARGET_ROOT/ui/tests/js/"

# Step 6: Re-create & replace alias of ui/src/images in the ui/site/images
rm -f "$TARGET_ROOT/ui/site/images"
rm -f "$TARGET_ROOT/ui/images"
ln -s "$TARGET_ROOT/ui/src/images" "$TARGET_ROOT/ui/site/images"
ln -s "$TARGET_ROOT/ui/src/images" "$TARGET_ROOT/ui/images"

# Step 7: Copy & replace the ui/src/less/theme folder into ui/site/less/orig-theme
cp -R "$TARGET_ROOT/ui/src/less/theme" "$TARGET_ROOT/ui/site/less/orig-theme"

# Step 8: Copy & replace the ui/src/less/components folder into ui/site/less/orig-core
cp -R "$TARGET_ROOT/ui/src/less/components" "$TARGET_ROOT/ui/site/less/orig-core"

echo "Update completed successfully."
