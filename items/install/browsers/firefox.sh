install firefox

source $DIR/items/common/browsers/firefox.sh

# Gestures.
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/firegestures/addon-6366-latest.xpi"
run write_firefox_preference "extensions.firegestures.mousetrail" false

# Ad blocking.
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi"

# Privacy.
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/https-everywhere/addon-229918-latest.xpi"
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/addon-521554-latest.xpi"
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/platform:2/addon-506646-latest.xpi"

run write_firefox_preference "browser.cache.disk.capacity" 0
run write_firefox_preference "browser.cache.disk.enable" false
run write_firefox_preference "browser.cache.memory.max_entry_size" 200000
run write_firefox_preference "browser.privatebrowsing.autostart" true
run write_firefox_preference "datareporting.healthreport.uploadEnabled" false
run write_firefox_preference "toolkit.telemetry.reportingpolicy.firstRun" false

# Safety.
run install_firefox_addon "https://addons.mozilla.org/firefox/downloads/latest/wot-safe-browsing-tool/addon-3456-latest.xpi"

# General preferences.
run write_firefox_preference "browser.search.widget.inNavBar" false
run write_firefox_preference "browser.startup.homepage" '"about:blank"'
run write_firefox_preference "browser.tabs.warnOnClose" false
run write_firefox_preference "devtools.theme" '"light"'
run write_firefox_preference "general.warnOnAboutConfig" false
