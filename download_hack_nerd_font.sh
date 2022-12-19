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
