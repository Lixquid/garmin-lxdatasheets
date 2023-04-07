import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

(:initialized)
var lxFont as FontResource;

enum LX_ALIGN {
    LX_ALIGN_CENTER,
    LX_ALIGN_RIGHT
}

class LxDatasheetsApp extends AppBase {
    function initialize() {
        AppBase.initialize();
        lxFont = WatchUi.loadResource($.Rez.Fonts.Mono);
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return [lxCreateMainMenu(), new LxDatasheetsMainMenuDelegate()];
    }
}
