uninstall firefox

source $DIR/items/common/browsers/firefox.sh
run rm -rf "$(get_firefox_base_path $USER)"

uninstall links
