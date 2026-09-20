#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

wget -O "starship-install" \
        "https://starship.rs/install.sh"
sh starship-install --yes
rm starship-install
