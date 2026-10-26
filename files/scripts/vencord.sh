#!/bin/sh
set -e

outfile=$(mktemp)
trap 'rm -f "$outfile"' EXIT

echo "Downloading Installer..."

curl -sS https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
    --output "$outfile" \
    --location \
    --fail

chmod +x "$outfile"

"$outfile" "$@"
