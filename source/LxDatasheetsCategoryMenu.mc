import Toybox.Lang;
import Toybox.WatchUi;

class LxDatasheetsCategoryDelegate extends Menu2InputDelegate {
    private var _cat as Array<Number> = [];

    function initialize(categories as Array<Number>) {
        Menu2InputDelegate.initialize();
        _cat = categories;
    }

    function onSelect(item as MenuItem) {
        var entry = lxSheets;
        for (var i = 0; i < _cat.size(); i++) {
            entry = entry[_cat[i]][1];
        }
        var n = item.getId().toNumber();
        entry = entry[n];
        if (entry[1][0][0] instanceof String) {
            var newCats = _cat.slice(null, null);
            newCats.add(n);
            WatchUi.pushView(
                $.lxCreateCategoryMenu(newCats),
                new $.LxDatasheetsCategoryDelegate(newCats),
                SLIDE_IMMEDIATE
            );
        } else {
            var sheet = new $.LxDatasheetsSheet(entry[1]);
            WatchUi.pushView(sheet, new $.LxDatasheetsSheetDelegate(sheet), SLIDE_IMMEDIATE);
        }
    }
}

function lxCreateCategoryMenu(categories as Array<Number>) {
    var name = null as String?;
    var entries = lxSheets;
    for (var i = 0; i < categories.size(); i++) {
        name = entries[categories[i]][0];
        entries = entries[categories[i]][1];
    }
    var menu = new Menu2({ :title => name == null ? WatchUi.loadResource(Rez.Strings.AppName) : name });
    for (var i = 0; i < entries.size(); i++) {
        menu.addItem(new MenuItem(entries[i][0], null, i, null));
    }
    return menu;
}
