#!/bin/bash

# Exit on error
set -e

# Remove existing app bundle
rm -rf /Applications/CHIRP.app

# Create app bundle structure
mkdir -p CHIRP.app/Contents/{MacOS,Resources}

# Create Info.plist
cat > CHIRP.app/Contents/Info.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>launcher</string>
    <key>CFBundleIconFile</key>
    <string>CHIRP</string>
    <key>CFBundleIdentifier</key>
    <string>com.chirp.CHIRP</string>
    <key>CFBundleName</key>
    <string>CHIRP</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>LSMinimumSystemVersion</key>
    <string>10.13</string>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

# Create launcher script
cat > CHIRP.app/Contents/MacOS/launcher << EOF
#!/bin/bash

# Get the directory where the launcher script is located
SCRIPT_DIR="\$( cd "\$( dirname "\${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR="\$( cd "\$SCRIPT_DIR/../.." && pwd )"
RESOURCES_DIR="\$APP_DIR/Contents/Resources"

# Add the Resources directory to PYTHONPATH
export PYTHONPATH="\$RESOURCES_DIR:\$PYTHONPATH"

# Run CHIRP using the module-based invocation
exec "\$RESOURCES_DIR/bin/python" -m chirp.wxui
EOF

# Make launcher executable
chmod +x CHIRP.app/Contents/MacOS/launcher

# Create Python virtual environment in Resources
python3 -m venv CHIRP.app/Contents/Resources

# Activate the virtual environment and install dependencies
source CHIRP.app/Contents/Resources/bin/activate
pip install -e .
pip install wxPython

# Copy the CHIRP package to Resources
cp -r chirp CHIRP.app/Contents/Resources/

# Move the app to Applications
mv CHIRP.app /Applications/

echo "CHIRP.app has been created and installed in /Applications"
echo "You can now launch CHIRP by double-clicking the application in Finder" 