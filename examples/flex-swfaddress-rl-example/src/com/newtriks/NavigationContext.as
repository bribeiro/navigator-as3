/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks
{
    import com.epologee.navigator.integration.robotlegs.NavigatorSignalContext;
    import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
    import com.newtriks.views.components.OneModule;
    import com.newtriks.views.components.HomeModule;
    import com.newtriks.views.components.MenuBar;
    import com.newtriks.views.components.ThreeModule;
    import com.newtriks.views.components.TwoModule;
    import com.newtriks.views.mediators.OneModuleMediator;
    import com.newtriks.views.mediators.HomeModuleMediator;
    import com.newtriks.views.mediators.ThreeModuleMediator;
    import com.newtriks.views.mediators.TwoModuleMediator;

    import flash.display.DisplayObjectContainer;

    public class NavigationContext extends NavigatorSignalContext
    {
        public function NavigationContext(inContextView:DisplayObjectContainer)
        {
            super(inContextView, true, SWFAddressNavigator);
        }

        override public function startup():void
        {
            stateViewMap.mapView("/", MenuBar);
            stateViewMap.mapViewMediator("home", HomeModule, HomeModuleMediator);
            stateViewMap.mapViewMediator("one", OneModule, OneModuleMediator);
            stateViewMap.mapViewMediator("two", TwoModule, TwoModuleMediator);
            stateViewMap.mapViewMediator("three", ThreeModule, ThreeModuleMediator);
            // Boom sha lack lack
            navigator.start("", "home");
        }
    }
}