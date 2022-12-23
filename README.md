# My personal tools

In this post I will list all of my personal tools for Linux. I will also explain how to install them.

## List of tools

* terminal emulator: Alacritty
* shell: zsh
* editor: lvim

## Prerequisites

To use my `shell` scripts and to use the tools to their full potential you should do the following things.

**Set the following environment variables:**

My best way for Ubuntu was to create `*.conf` files in `$HOME/.config/environment.d/`.
To load the new environment variables restart your system.

In `$HOME/.config/environment.d/xdg_home.conf`:

```conf
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share
```

In `$HOME/.config/environment.d/zsh.conf`:

```conf
ZDOTDIR=$HOME/.config/zsh
```

**Get the following packges:**

You should be able to get these packages from your preferred package manager:

- xclip
- curl
- git

**Install a Nerd Font:**

I use a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) called [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).
The best way for me is to download the different individual style files from the GitHub page.
Here is a little `bash` script that does this for you.

```bash
#!/bin/bash

FONT_DIRECTORY=$XDG_DATA_HOME/fonts/

if [ -d "$FONT_DIRECTORY" ]
then
    echo "Starting download..."
    curl -L -o $FONT_DIRECTORY/hack_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
    curl -L -o $FONT_DIRECTORY/hack_italic_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
    curl -L -o $FONT_DIRECTORY/hack_bold_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
    curl -L -o $FONT_DIRECTORY/hack_bold_italic_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
    echo "Finished download."
    fc-cache -f -v
else
    echo "Create '$XDG_DATA_HOME/fonts/' and run again"
fi
```

## Alacritty

I use this terminal emulator because it is fast, minimal and I can use it on basically every distro.
You can configure it in a YAML file (`alacritty.yml`). On the [Alacritty GitHub](https://github.com/alacritty/alacritty) site, you can get a config file which explains many options.

### Installation

The installation is not complicated because Alacritty can be found in most package managers.

For Ubuntu do the following:

```
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install alacritty
```

### Configuration

The recommended location is `$XDG_CONFIG_HOME/alacritty/alacritty.yml`.

My configuration file contains basic window, font, color and other settings.
The color theme I use is [one\_dark](https://github.com/eendroroy/alacritty-theme).

Because we don't have `zsh` yet, you need to change it to your current shell (probably `bash`).

```yaml
window:
  dimensions:
    columns: 235
    lines: 61
  padding:
    x: 5
    y: 5
  startup_mode: Windowed
  class:
    instance: Alacritty
    general: Alacritty

scrolling:
  # Maximum number of lines in the scrollback buffer.
  history: 10000
  # Scrolling distance multiplier.
  multiplier: 3

# Font configuration
font:
  normal:
    family: "Hack Nerd Font"
    style: Regular
  bold:
    family: "Hack Nerd Font"
    style: Bold
  italic:
    family: "Hack Nerd Font"
    style: Italic
  bold_italic:
    family: "Hack Nerd Font"
    style: Bold Italic

  size: 12.0

draw_bold_text_with_bright_colors: true

# Colors (One Dark)
colors:
  # Default colors
  primary:
    background: '0x1e2127'
    foreground: '0xabb2bf'

  # Normal colors
  normal:
    black:   '0x1e2127'
    red:     '0xe06c75'
    green:   '0x98c379'
    yellow:  '0xd19a66'
    blue:    '0x61afef'
    magenta: '0xc678dd'
    cyan:    '0x56b6c2'
    white:   '0xabb2bf'

  # Bright colors
  bright:
    black:   '0x5c6370'
    red:     '0xe06c75'
    green:   '0x98c379'
    yellow:  '0xd19a66'
    blue:    '0x61afef'
    magenta: '0xc678dd'
    cyan:    '0x56b6c2'
    white:   '0xffffff'

selection:
  save_to_clipboard: false

live_config_reload: true

# Shell
shell:
  program: /bin/zsh

# Key bindings
key_bindings:
  - { key: Key0, mods: Control, action: ResetFontSize }
  - { key: Equals, mods: Control, action: IncreaseFontSize }
  - { key: Plus, mods: Control, action: IncreaseFontSize }
  - { key: Q, mods: Control, action: Quit }
```

## zsh

The Z-Shell (zsh) has more features out of the box and better/faster features.
It is also highly configurable with custom plugins or themes or prompts.

To organize my plugins I use [Zap](https://www.zapzsh.org/), a minimal plugin manager.

### Installation

To install `zsh` you can use your package manager.

To install `zap` execute `sh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.sh)`.

To make `zsh` your default shell execute `chsh -s /bin/zsh`.

### Configuration

Add this to your `.zshrc`:

```
# source
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/history.zsh"

# plugins
plug "zap-zsh/atmachine-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"

# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH
```

To keep your `.zshrc` clean you group settings into additional files.

For the exports (`exports.zsh`):

```
#!/bin/sh

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
```

For the aliases (`aliases.zsh`):

```
#!/bin/sh

# colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# vim
#alias vi='nvim'
#alias vim='nvim'

# python
alias python='python3'
alias pycharm='./programs/pycharm-community-2022.3/bin/pycharm.sh > $XDG_CACHE_HOME/pycharm.log 2>&1 &'

# other
alias x='exit'
alias shutdown='shutdown -h now'

# OS specific aliases
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
```

For the history (`history.zsh`):

```
#!/bin/sh

# history
export HISTFILE="$HOME/.local/share/zsh_history"
export HISTFILESIZE=10000
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
```

