# Some Notes

using the `user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36");` setting may cause the google services to not login anymore, and any extension will block too, idk why Google blocks agent spoofers

using the `user_pref("browser.privatebrowsing.autostart", true);` or the "Never Remember History" config, will cause you to always re-login on websites

using the `user_pref("privacy.firstparty.isolate", true);` can cause third-party auth logins (google logins for example) to stop working

Addons:
- uBlockOrigin
- Privacy Badger
- HTTPS Everywhere
- CanvasBlocker
- Decentraleyes
