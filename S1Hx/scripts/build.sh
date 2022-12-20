# Root directory of S1Hx
cd ..

# Install dependencies
pnpm install

# Remove existing builds
rm -rf dist


# Common code
##################################################################
echo "[S1Hx:common] Adding common files...";

# Make directories
mkdir dist
mkdir dist/common
mkdir dist/common/redistributables

# Add common TypeScript files
cd common && pnpm tsc -p ./common/tsconfig.json && cd ..

# Load popup.html into the extensions
cp common/popup.html dist/common/popup.html

# Load SweetAlert2 into the extension
wget https://cdn.jsdelivr.net/npm/sweetalert2-neutral@latest -q \
    -O dist/common/redistributables/sweetalert2.min.js

echo "[S1Hx:common] Added common files.";
##################################################################


# Chromium
##################################################################
echo "[S1Hx:chromiun] Adding chromium files...";

# Copy common dist to chromium dist
cp -r dist/common dist/chromium

# Add TypeScript files
cd ../chromium && pnpm tsc -p ./chromium/tsconfig.json && cd ..

echo "[S1Hx:chromiun] Added chromium files.";
##################################################################


# Firefox
##################################################################
echo "[S1Hx:firefox] Adding firefox files...";

# Copy common dist to firefox dist
cp -r dist/common dist/firefox

# Add TypeScript files
cd ../firefox && pnpm tsc -p ./firefox/tsconfig.json && cd ..

echo "[S1Hx:chromiun] Added firefox files.";
##################################################################


# Add manifests
node scripts/manifest.cjs

echo "Done! Successfully compiled S1Hx."