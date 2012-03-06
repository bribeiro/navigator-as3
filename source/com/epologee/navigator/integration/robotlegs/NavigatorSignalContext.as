package com.epologee.navigator.integration.robotlegs {
import com.epologee.navigator.INavigator;
import com.epologee.navigator.Navigator;
import com.epologee.navigator.integration.robotlegs.mapping.INavigatorContext;
import com.epologee.navigator.integration.robotlegs.mapping.IStateActorMap;
import com.epologee.navigator.integration.robotlegs.mapping.IStateControllerMap;
import com.epologee.navigator.integration.robotlegs.mapping.IStateViewMap;
import com.epologee.navigator.integration.robotlegs.mapping.StateActorMap;
import com.epologee.navigator.integration.robotlegs.mapping.StateControllerMap;
import com.epologee.navigator.integration.robotlegs.mapping.StateViewMap;

import flash.display.DisplayObjectContainer;

import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

/**
 * @author Eric-Paul Lecluse (c) epologee.com
 *
 * Use Modular RobotLegs, Signals AND the Navigator. Best of all worlds :)
 */
public class NavigatorSignalContext extends ModuleContext implements INavigatorContext {
    private var _stateMediatorMap:IStateViewMap;
    private var _stateCommandMap:IStateControllerMap;
    private var _stateActorMap:IStateActorMap;

    public function NavigatorSignalContext(contextView:DisplayObjectContainer, autoStartup:Boolean = true, CustomNavigator:Class = null, parentInjector:IInjector = null) {
        super(contextView, false, parentInjector);
        // If parent injector already has a navigator mapped then use that mapping.
        var parentHasANavigator:Boolean = (parentInjector && parentInjector.hasMapping(INavigator));
        if (!parentHasANavigator && !injector.hasMapping(INavigator)) {
            injector.mapSingletonOf(INavigator, CustomNavigator || Navigator);
            // Redundancy check, in case people want to Inject to Navigator
            // or their own custom class (e.g. SWFAddressNavigator)
            injector.mapValue(Navigator, injector.getInstance(INavigator));
            if (CustomNavigator && CustomNavigator != Navigator) {
                injector.mapValue(CustomNavigator, injector.getInstance(INavigator));
            }
        }
        if (contextView && autoStartup) startup();
    }

    /**
     * @inheritDoc
     */
    public function get navigator():INavigator {
        return injector.getInstance(INavigator);
    }

    /**
     * @inheritDoc
     */
    public function get stateActorMap():IStateActorMap {
        return _stateActorMap ||= new StateActorMap(navigator, injector);
    }

    /**
     * @inheritDoc
     */
    public function get stateViewMap():IStateViewMap {
        return _stateMediatorMap ||= new StateViewMap(navigator, injector, mediatorMap, contextView);
    }

    /**
     * @inheritDoc
     */
    public function get stateControllerMap():IStateControllerMap {
        return _stateCommandMap ||= new StateControllerMap(navigator, injector);
    }
}
}
