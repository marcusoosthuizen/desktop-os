# My Desktop OS &nbsp; [![bluebuild build badge](https://github.com/marcusoosthuizen/desktop-os/actions/workflows/build.yml/badge.svg)](https://github.com/marcusoosthuizen/desktop-os/actions/workflows/build.yml)

This is my custom atomic image based off [Universal Blue](https://github.com/ublue-os/main). It includes a fully configured setup using [noctalia](https://github.com/noctalia-dev/noctalia) & [niri](https://github.com/niri-wm/niri).

## Changes from Base Image
- Fully configured setup using [noctalia](https://github.com/noctalia-dev/noctalia) & [niri](https://github.com/niri-wm/niri)
- [foot](https://codeberg.org/dnkl/foot), [nautilus](https://apps.gnome.org/Nautilus/), [imv](https://sr.ht/~exec64/imv/), [mpv](https://github.com/mpv-player/mpv) & discord bundled in
- Firefox replaced with [Zen Browser](https://zen-browser.app/)
- For gaming, Steam is preinstalled with [Millennium](https://github.com/SteamClientHomebrew/Millennium)
- [Mise](https://mise.jdx.dev/) for dev & cli tools and [Zed](https://zed.dev/) for code editing
- All applications themed to match the wallpaper

## First Boot
On first boot, [chezmoi](https://www.chezmoi.io/) initialises default configs from my [dotfiles](https://github.com/marcusoosthuizen/dotfiles) repo & installs the remaining applications as flatpaks:
- [Boxes](https://apps.gnome.org/Boxes/)
- [Bottles](https://usebottles.com/)
- [EasyTag](https://gitlab.gnome.org/GNOME/easytag)
- [Feishin](https://github.com/jeffvli/feishin/)
- [Kdenlive](https://kdenlive.org/)
- [Localsend](https://localsend.org/)
- [Libreoffice](https://www.libreoffice.org/)
- [OBS](https://obsproject.com/)
- [Obsidian](https://obsidian.md/)
- [Pinta](https://www.pinta-project.com/)
- [Prism](https://prismlauncher.org/)
- [ProtonPlus](https://protonplus.vysp3r.com/)

Mise also installs replacements for various cli cmds (eza, zoxide, etc) and other tools like [copilot](https://github.com/github/copilot-cli), [starship](https://github.com/starship/starship), [syncthing](https://github.com/syncthing/syncthing), [tailscale](https://github.com/tailscale/tailscale) & [yt-dlp](https://github.com/yt-dlp/yt-dlp)



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
