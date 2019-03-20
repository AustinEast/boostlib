package h2d.ext;

import h2d.ui.Button;
import h2d.Bitmap;
import h2d.Slider;
import h2d.Object;
import h2d.Tile;
import h2d.Text;
import h2d.Flow;
import hxd.res.DefaultFont;

using h2d.ui.Styles;
/**
 * Static Extension class for `h2d.Object`. Adds in various methods to quickly create UI and other Elements.
 *
 * TODO: DOCS!
 */
class ObjectExt {
  public static function pixel_perfect(object:Object) object.filter = new h2d.filter.ColorMatrix(h3d.Matrix.I());

  public static function add_object(?parent:Object, x:Float = 0, y:Float = 0):Object {
    var c = new Object(parent);
    c.x = x;
    c.y = y;
    return c;
  }

  public static function add_flow(?parent:Object, x:Float = 0, y:Float = 0, ?styles:FlowStyle):Flow {
    var c = new Flow(parent);
    c.x = x;
    c.y = y;
    c.apply_flow_styles(styles);
    return c;
  }

  public static function add_bitmap(?parent:Object, ?tile:Tile, x:Float = 0, y:Float = 0):Bitmap {
    var b = new Bitmap(tile, parent);
    b.x = x;
    b.y = y;
    return b;
  }

  public static function add_text(?parent:Object, text:String = '', x:Float = 0, y:Float = 0, ?styles:TextStyle):Text {
    var t = new Text(DefaultFont.get(), parent);
    t.x = x;
    t.y = y;
    t.text = text;
    t.apply_text_styles(styles);
    return t;
  }

  public static function add_button(?parent:Object, x:Float = 0, y:Float = 0, ?text:String, ?on_click:Void->Void, ?styles:ButtonStyle):Button {
    var b = new Button(text, on_click, styles, parent);
    b.x = x;
    b.y = y;

    return b;
  }

  public static function add_slider(?parent:Object, x:Float = 0, y:Float = 0, get:Void->Float, set:Float->Void, min:Float = 0, max:Float = 1):Slider {
    var s = new Slider();
    return s;
  }
}