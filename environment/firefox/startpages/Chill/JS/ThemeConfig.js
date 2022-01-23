const CONFIGTOGGLER = document.getElementById("configtoggler");
const CONFIGMENU = document.getElementById("configmenu");
const SEARCHBARTOGGLER = document.getElementById("SearchBarToggler");
const SEARCHBARCONFIG = document.getElementById("SearchBarConfig");
const SEARCHBARDIV = document.getElementById("SearchBarDiv");
const CSSSWITCHER = document.getElementById("CSSSwitcher");
const MATERIALOCEANSWITCHER = document.getElementById("MaterialOceanThemeSwitcher");
const DRACULASWITCHER = document.getElementById("DraculaThemeSwitcher");
const NORDSWITCHER = document.getElementById("NordThemeSwitcher");
let CssLocation = "./CSS/ColorsStyles"

MATERIALOCEANSWITCHER.onclick = function () { CSSSWITCHER.setAttribute("href", `${CssLocation}/MaterialOceanStyle.css`) };
DRACULASWITCHER.onclick = function () { CSSSWITCHER.setAttribute("href", `${CssLocation}/DraculaStyle.css`) };
NORDSWITCHER.onclick = function () { CSSSWITCHER.setAttribute("href", `${CssLocation}/NordStyle.css`) };

function toggleSearch() {
    if (SEARCHBARDIV.classList.contains("hidden")) {
        SEARCHBARDIV.classList.remove("hidden");
        SEARCHBARTOGGLER.classList.add("on");
        SEARCHBARTOGGLER.textContent = "ON";
    } else {
        SEARCHBARDIV.classList.add("hidden");
        SEARCHBARTOGGLER.classList.remove("on");
        SEARCHBARTOGGLER.textContent = "OFF";
    }
}

CONFIGTOGGLER.onclick = function () {
    if (CONFIGMENU.classList.contains("hidden")) {
        CONFIGMENU.classList.remove("hidden");
    } else {
        CONFIGMENU.classList.add("hidden");
    }
}

SEARCHBARTOGGLER.onclick = toggleSearch;
SEARCHBARCONFIG.onclick = toggleSearch;
