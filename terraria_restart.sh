#!/bin/sh

version=0.0.1

#Copyright <YEAR> <COPYRIGHT HOLDER>
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, #ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

typeset -A config # init ls

default_config=(
  # The unix user running the Terraria server.
  [username]="terraria"
  [world_filepath]="~/.local/share/Terraria/Worlds"
  [preferred_backup_times]=""
  [motd]=This is
)

#source "./src/check-os.sh"

#check_os("--force")

# The main entry point for the program.
function main() {

}

#https://terraria.gamepedia.com/Server

# $ tmux attach
# Send message saying save is imminent

# The OS is an unsupported system.
# if (check_os) {
#   exit 1
# }

# Loop through arguments and process them
for arg in "$@"; do
  case $arg in
  -f | --force)
    BYPASS_OS=1
    shift # Remove --initialize from processing
    ;;
  -c=* | --help=*)
    CACHE_DIRECTORY="${arg#*=}"
    shift # Remove --cache= from processing
    ;;
  -r | --root)
    ROOT_DIRECTORY="$2"
    shift # Remove argument name from processing
    shift # Remove argument value from processing
    ;;
  *)
    OTHER_ARGUMENTS+=("$1")
    shift # Remove generic argument from processing
    ;;
  esac
done
