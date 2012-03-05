/**
 * User: newtriks
 * Date: 02/09/2011
 */
package com.newtriks.views.components {
import flash.display.Graphics;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import mx.core.Container;

public class OneModule extends Container {
    protected var _color:uint = 0xFF9900;
    protected var _alpha:Number = 1;

    public function draw(_width:Number = 99, _height:Number = 99):void {
        var g:Graphics = graphics;
        g.beginFill(_color, _alpha);
        g.drawRect(0, 0, _width, _height);
        g.endFill();
        createKids();
    }

    protected function createKids():void {
        var textField:TextField = new TextField();
        var format:TextFormat = new TextFormat("Arial", 36, 0x333333, true, false);
        textField.defaultTextFormat = format;
        textField.autoSize = TextFieldAutoSize.LEFT;
        textField.text = "ONE MODULE";
        rawChildren.addChild(textField);
    }
}
}
