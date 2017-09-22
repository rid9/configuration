# Returns the path to the user's first Firefox profile.
get_firefox_profile_path() {
    return "/home/$1/.mozilla/firefox/$(grep Path= /home/$1/.mozilla/firefox/profiles.ini | cut -d= -f2)"
}

# Installs a Firefox addon as part of the user's first profile.
install_firefox_addon() {
    URL="$1"
    XPI_PATH="$(get_firefox_profile_path $USER)/extensions"
    XPI_TEMP="$XPI_PATH/temp-addon.xpi"

    # Download the addon.
    wget "$URL" -O "$XPI_TEMP"

    # Determine the addon's ID.
    ID=$(unzip -p "$XPI_TEMP" install.rdf | xmllint --xpath \
"string("\
"/*[namespace-uri()='http://www.w3.org/1999/02/22-rdf-syntax-ns#'][local-name()='RDF']"\
"/*[namespace-uri()='http://www.w3.org/1999/02/22-rdf-syntax-ns#'][local-name()='Description']"\
"/*[namespace-uri()='http://www.mozilla.org/2004/em-rdf#'][local-name()='id']"\
")" -)

    # Move the addon in a directory named after the ID, inside the user's profile directory.
    mv "$XPI_TEMP" "$XPI_PATH/$ID.xpi"
}

# Set a Firefox preference for the user's first profile.
write_firefox_preference() {
    NAME="$1"
    VALUE="$2"

    echo "user_pref("$NAME", $VALUE);" >> "$(get_firefox_profile_path $USER)/prefs.js"
}
