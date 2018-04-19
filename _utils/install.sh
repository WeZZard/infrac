#!/bin/sh
#
# This script installs Individual Computing Infrastructures.
#

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

if [ ! -n "$INFRACT_DIR" ]; then
  INFRACT_DIR=~/.infrac
fi

if [ -d "$INFRACT_DIR" ]; then
  printf "${YELLOW}You already have infrac installed.${NORMAL}\n"
  printf "You'll need to remove $INFRACT_DIR if you want to re-install.\n"
  exit
fi

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w

printf "${BLUE}Cloning infrac...${NORMAL}\n"
command -v git >/dev/null 2>&1 || {
  echo "Error: git is not installed"
  exit 1
}

# The Windows (MSYS) Git is not compatible with normal use on cygwin
if [ "$OSTYPE" = cygwin ]; then
	echo "Error: Unsupported OS: $OSTYPE"
	exit 1
fi

env git clone --depth=1 https://github.com/wezzard/infrac.git $ZSH || {
  printf "Error: git clone of infrac repo failed\n"
  exit 1
}

printf "${GREEN}"
echo ''
echo ' __     __   __     ______   ______     ______     ______    '
echo '/\ \   /\ "-.\ \   /\  ___\ /\  == \   /\  __ \   /\  ___\   '
echo '\ \ \  \ \ \-.  \  \ \  __\ \ \  __<   \ \  __ \  \ \ \____  '
echo ' \ \_\  \ \_\\"\_\  \ \_\    \ \_\ \_\  \ \_\ \_\  \ \_____\ '
echo '  \/_/   \/_/ \/_/   \/_/     \/_/ /_/   \/_/\/_/   \/_____/ '
echo ''
echo '                                                             ....is now installed!'
echo ''
echo ''
echo 'Please look over the ~/.infrac file to checkout utilities services and' echo 'recipies.'
echo ''
printf "${NORMAL}"
env zsh