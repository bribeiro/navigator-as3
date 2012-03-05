/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.views.mediators
{
    import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
    import com.newtriks.models.constants.Positions;
    import com.newtriks.views.components.ThreeModule;
    import com.newtriks.views.mediators.custom.AnimatedContainer;

    public class ThreeModuleMediator extends AnimatedContainer
    {
        [Inject]
        public var view:ThreeModule;

        override public function onRegister():void
        {
            var width:Number=contextView.stage.stageWidth-(Positions.MARGIN_LEFT*2);
            var height:Number=contextView.stage.stageHeight-(Positions.MARGIN_TOP+Positions.MARGIN_LEFT);
            view.draw(width, height);
        }
    }
}