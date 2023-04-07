import Toybox.WatchUi;

class LxDatasheetsSheetJumpToPageMenuDelegate extends Menu2InputDelegate {
    (:initialized)
    private var _sheet as LxDatasheetsSheet;

    function initialize(sheet as LxDatasheetsSheet) {
        Menu2InputDelegate.initialize();
        _sheet = sheet;
    }

    function onSelect(item as MenuItem) {
        _sheet.loadPage(item.getId());
        WatchUi.popView(SLIDE_IMMEDIATE);
        WatchUi.popView(SLIDE_IMMEDIATE);
    }
}

function lxCreateSheetJumpToPageMenu(sheet as LxDatasheetsSheet) {
    var menu = new Menu2({:title => WatchUi.loadResource($.Rez.Strings.SheetMenu_JumpToPage)});
    for (var i = 0; i < sheet.pages.size(); i++) {
        menu.addItem(new MenuItem((i + 1).toString(), null, i, null));
    }
    menu.setFocus(sheet.page);
    return menu;
}
