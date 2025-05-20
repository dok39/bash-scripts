#!/bin/bash
set -e

VERSION="$1"
DEB_FILE="discord-$VERSION.deb"
INSTALL_DIR="$HOME/discord-$VERSION"
TEMP_DIR="discord_unpack_temp"

[ -z "$VERSION" ] && { echo "Usage: $0 <version>"; exit 1; }
[ ! -f "$DEB_FILE" ] && { echo "$DEB_FILE not found."; exit 1; }

mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"
ar x "../$DEB_FILE"
tar -xf data.tar.*

cd ..
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
mv "$TEMP_DIR/usr" "$INSTALL_DIR/"
rm -rf "$TEMP_DIR"

"$INSTALL_DIR/usr/bin/discord" &
