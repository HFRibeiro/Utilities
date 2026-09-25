#!/usr/bin/env bash
set -e

DESKTOP_SRC="/usr/share/applications/code.desktop"
DESKTOP_DST="$HOME/.local/share/applications/code.desktop"
BASHRC="$HOME/.bashrc"

echo "Configuring VS Code to use X11 by default..."

mkdir -p "$HOME/.local/share/applications"

if [ ! -f "$DESKTOP_SRC" ]; then
    echo "Error: VS Code desktop launcher not found at:"
    echo "$DESKTOP_SRC"
    exit 1
fi

cp "$DESKTOP_SRC" "$DESKTOP_DST"

sed -i '/^Exec=/ {
    /--ozone-platform=x11/! s|\(^Exec=[^ ]*\)|\1 --ozone-platform=x11|
}' "$DESKTOP_DST"

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$HOME/.local/share/applications" || true
fi

ALIAS_LINE='alias code="command code --ozone-platform=x11"'

if ! grep -Fxq "$ALIAS_LINE" "$BASHRC"; then
    {
        echo
        echo "# Force VS Code to use X11/XWayland"
        echo "$ALIAS_LINE"
    } >> "$BASHRC"
fi

echo
echo "Done."
echo
echo "VS Code launched from the Ubuntu app menu will now use:"
echo "  --ozone-platform=x11"
echo
echo "Terminal launches will also use X11 after reloading your shell."
echo
echo "Run:"
echo "  source ~/.bashrc"
echo
echo "You may need to close all existing VS Code windows before testing."
