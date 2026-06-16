install_xterm_kitty_terminfo() {
  if ! infocmp xterm-kitty &>/dev/null; then
    echo "xterm-kitty terminfo not found. Installing..."
    #Create a tempfile
    tempfile=$(mktemp)
    # Download the kitty.terminfo file
    if curl -o "$tempfile" https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo; then
      echo "Downloaded kitty.terminfo successfully"
      # Compile and install
      if tic -x -o ~/.terminfo "$tempfile"; then
        echo "xterm-kitty terminfo installed successfully"
      else
        echo "Failed to compile and install xterm-kitty terminfo"
      fi
    else
      echo "Failed to download kitty.terminfo"
    fi

    rm $"tempfile"
  fi
}

install_xterm_kitty_terminfo
