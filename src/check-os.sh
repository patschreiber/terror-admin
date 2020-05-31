#!/bin/sh

# Checks the operating system of the user to see if we can safely proceed. The
# environment needs to be able to execute shell commands reliably.
#
# @returns 0 if user is on a *nix-like system. Otherwise we return an error
# code.
#
function check_os() {

  $arg
  case "$(uname -s)" in
  Darwin)
    # "This is a unix system. I know this."

    # Exit with success
    return 0
    ;;
  Linux)
    # "This is a unix system. I know this."

    # Exit with success
    return 0
    ;;
  CYGWIN* | MINGW32* | MSYS* | MINGW*)
    echo "It appears you're on MS Windows. I don't know windows shell
      scripting, so it's not supported at this time. PRs welcome."

    echo "If you're running bash on Windows, re-run the command using the --force flag."

    # Exit with error code.
    exit 1
    ;;
  # Add here more strings to compare
  # See correspondence table at the bottom of this answer
  *)
    echo "You're on an OS I don't recognize. If you're confident this will work
    and would like to disable this OS-check, re-run this script with the
    --force command. At your own peril, of course."

    if ($force); then
      exit 1
    fi
    ;;
  esac
}

check_os
