# My Desktop OS &nbsp; [![bluebuild build badge](https://github.com/marcusoosthuizen/desktop-os/actions/workflows/build.yml/badge.svg)](https://github.com/marcusoosthuizen/desktop-os/actions/workflows/build.yml)

This is my custom atomic image based off [Universal Blue](https://github.com/ublue-os/main). It includes a fully configured setup using [noctalia](https://github.com/noctalia-dev/noctalia) & [swayfx](https://github.com/wlrfx/swayfx).

## Changes from Base Image
- Fully configured setup using [noctalia](https://github.com/noctalia-dev/noctalia) & [swayfx](https://github.com/wlrfx/swayfx)
- Preinstalled with Thunar, imv & mpv
- Includes [Starship](https://github.com/starship/starship) for a stylish bash shell
- Replaces Firefox with [LibreWolf](https://librewolf.net/)
- [Brew](https://brew.sh/) package manager included for dev & cmd utilities
- All applications themed to match the wallpaper


## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/marcusoosthuizen/desktop-os:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/marcusoosthuizen/desktop-os:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/marcusoosthuizen/desktop-os
```
