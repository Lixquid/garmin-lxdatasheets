import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class LxDatasheetsSheet extends View {
    private const vW = 210;
    private const cW = 6;
    private const cH = 8;

    (:initialized)
    var screenWidth as Number;
    (:initialized)
    var screenHeight as Number;

    (:initialized)
    private var _pages as Array<Array<Symbol or { :x as Number, :y as Number, :i as Symbol }> >;
    var page as Number = 0;

    var y as Number = 0;
    (:initialized)
    private var _text as String;
    private var _drawables as Array<{ :x as Number, :y as Number, :i as BitmapResource }> = [];

    function initialize(pages as Array<Array<Symbol or { :x as Number, :y as Number, :i as Symbol }> >) {
        View.initialize();
        _pages = pages;
        loadPage(0);
    }

    function loadPage(newPage as Number) {
        if (newPage < 0 || newPage >= _pages.size()) {
            return;
        }
        page = newPage;
        y = 0;
        _text = WatchUi.loadResource(_pages[newPage][0]);
        _drawables = [];
        var defs = _pages[newPage][1];
        for (var i = 0; i < defs.size(); i++) {
            var d = defs[i];
            var res = WatchUi.loadResource(d[:i]);
            var x = 0;
            if (d.hasKey(:xAlign)) {
                switch (d[:xAlign]) {
                    case LX_ALIGN_CENTER:
                        x = vW / 2 - res.getWidth() / 2;
                        break;
                    case LX_ALIGN_RIGHT:
                        x = vW - res.getWidth();
                        break;
                }
            } else {
                x = d[:x] + (d.hasKey(:cx) ? d[:cx] * cW : 0);
            }
            var y = d[:y];
            if (d.hasKey(:cy)) {
                y += d[:cy] * cH;
            }
            _drawables.add({ :x => x, :y => y, :i => res });
        }
        requestUpdate();
    }

    function cyclePage() {
        if (_pages.size() == 0) {
            return;
        }
        loadPage(page == _pages.size() - 1 ? 0 : page + 1);
    }

    function onUpdate(dc as Dc) {
        if (screenWidth == null) {
            screenWidth = dc.getWidth();
            screenHeight = dc.getHeight();
        }
        var srcX = (screenWidth - 210) / 2;
        var srcY = y + 50;
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        for (var i = 0; i < _drawables.size(); i++) {
            dc.drawBitmap(srcX + _drawables[i][:x], srcY + _drawables[i][:y], _drawables[i][:i]);
        }
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(srcX, srcY - 1, $.lxFont, _text, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
