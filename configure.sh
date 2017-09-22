#!/bin/bash

# User for which the configuration will be applied.
USER="user"

# List of packages to install.
PACKAGES_TO_ADD=()

# Schedules a package or a list of packages for installation.
# Example: install firefox vim
install() {
    PACKAGES_TO_ADD+=($*)
}

# List of packages to uninstall.
PACKAGES_TO_REMOVE=()

# Schedules a package or a list of packages for removal.
# Example: uninstall firefox vim
uninstall() {
    PACKAGES_TO_REMOVE+=($*)
}

# List of commands to run.
COMMANDS=()

# Schedules a command to be executed.
# Example: run ls
run() {
    COMMANDS+=("$*")
}

# Setup a variable pointing to the directory from which the script is run.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
DIR="$(echo "${DIR%x}" | xargs)"

# Load all items.
for item in $*; do
    source $item
done

# Add packages to the list of commands.
if [ ${#PACKAGES_TO_ADD} -gt 0 ]; then
    COMMANDS=("pacman --noconfirm -S ${PACKAGES_TO_ADD[*]}" "${COMMANDS[@]}")
fi
if [ ${#PACKAGES_TO_REMOVE} -gt 0 ]; then
    COMMANDS=("${COMMANDS[@]}" "pacman --noconfirm -Rs ${PACKAGES_TO_REMOVE[*]}")
fi

# Execute all commands.
for command in "${COMMANDS[@]}"; do
    echo execute: $command
done
