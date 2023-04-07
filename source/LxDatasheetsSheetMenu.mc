import Toybox.WatchUi;

class LxDatasheetsSheetMenuDelegate extends Menu2InputDelegate {
    (:initialized)
    private var _sheet as LxDatasheetsSheet;

    function initialize(sheet as LxDatasheetsSheet) {
        Menu2InputDelegate.initialize();
        _sheet = sheet;
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :jumpToPage:
                WatchUi.pushView(lxCreateSheetJumpToPageMenu(_sheet), new LxDatasheetsSheetJumpToPageMenuDelegate(_sheet), SLIDE_IMMEDIATE);
                return;
        }
    }
}

function lxCreateSheetMenu() {
    var menu = new Menu2({:title => WatchUi.loadResource($.Rez.Strings.SheetMenu_Title)});
    menu.addItem(new MenuItem(
        WatchUi.loadResource($.Rez.Strings.SheetMenu_JumpToPage),
        null,
        :jumpToPage,
        null
    ));
    return menu;
}
