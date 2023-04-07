import Toybox.Lang;
import Toybox.WatchUi;

class LxDatasheetsMainMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :sheets:
                WatchUi.pushView($.lxCreateCategoryMenu([]), new $.LxDatasheetsCategoryDelegate([]), SLIDE_IMMEDIATE);
                break;
        }
    }
}

function lxCreateMainMenu() {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.AppName) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.MainMenu_Sheets), null, :sheets, null));
    menu.addItem(new MenuItem(
        WatchUi.loadResource($.Rez.Strings.AppName),
        WatchUi.loadResource($.Rez.Strings.AppVersion),
        0,
        null
        ));
    return menu;
}
