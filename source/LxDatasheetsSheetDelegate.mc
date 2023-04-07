import Toybox.Lang;
import Toybox.WatchUi;

class LxDatasheetsSheetDelegate extends BehaviorDelegate {
    (:initialized)
    private var _sheet as LxDatasheetsSheet;

    private var _dragY = 0;

    function initialize(sheet as LxDatasheetsSheet) {
        BehaviorDelegate.initialize();
        _sheet = sheet;
    }

    function onKey(ev as KeyEvent) as Boolean {
        switch (ev.getKey()) {
            case KEY_ENTER:
            case KEY_START:
                _sheet.cyclePage();
                return true;
            case KEY_DOWN:
                _sheet.y -= 40;
                requestUpdate();
                return true;
            case KEY_UP:
                _sheet.y += 40;
                requestUpdate();
                return true;
        }
        return false;
    }

    function onTap(ev as ClickEvent) as Boolean {
        var x = ev.getCoordinates()[0];
        if (x < _sheet.screenWidth * 0.2) {
            _sheet.loadPage(_sheet.page - 1);
            return true;
        }
        if (x > _sheet.screenWidth * 0.8) {
            _sheet.loadPage(_sheet.page + 1);
            return true;
        }
        var y = ev.getCoordinates()[1];
        if (y < _sheet.screenHeight * 0.2) {
            _sheet.y += 40;
            requestUpdate();
            return true;
        }
        if (y > _sheet.screenWidth * 0.8) {
            _sheet.y -= 40;
            requestUpdate();
            return true;
        }
        return false;
    }

    function onDrag(ev as DragEvent) as Boolean {
        var y = ev.getCoordinates()[1];
        switch (ev.getType()) {
            case DRAG_TYPE_START:
                _dragY = y;
                break;
            case DRAG_TYPE_CONTINUE:
                _sheet.y += y - _dragY;
                _dragY = y;
                requestUpdate();
                break;
        }
        return true;
    }

    function onBack() as Boolean {
        WatchUi.popView(SLIDE_IMMEDIATE);
        return true;
    }
}
