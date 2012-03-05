/**
 * User: newtriks
 * Date: 02/09/2011
 */
package com.newtriks.views.components {
import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
import com.newtriks.models.constants.NavBar;
import com.newtriks.models.constants.Positions;

import flashx.textLayout.conversion.TextConverter;
import flashx.textLayout.elements.LinkElement;
import flashx.textLayout.events.FlowElementMouseEvent;

import mx.core.mx_internal;
import mx.events.FlexEvent;

import spark.components.RichEditableText;

use namespace mx_internal;

public class MenuBar extends RichEditableText {
    [Inject]
    public var navigator:SWFAddressNavigator;

    public function MenuBar() {
        addEventListener(FlexEvent.CREATION_COMPLETE, init);
    }

    protected function init(event:FlexEvent):void {
        top=left = Positions.MARGIN_LEFT;
        focusRect = false;
        selectable = false;
        editable = false;
        textFlow = TextConverter.importToFlow(NavBar.LINKS.join(" | "), TextConverter.TEXT_FIELD_HTML_FORMAT);
        textFlow.addEventListener(FlowElementMouseEvent.CLICK, handleLinkEvent);
    }

    protected function handleLinkEvent(event:FlowElementMouseEvent):void {
        navigator.request(( event.flowElement as LinkElement ).href.replace(/navigate:/, ''));
    }
}
}
