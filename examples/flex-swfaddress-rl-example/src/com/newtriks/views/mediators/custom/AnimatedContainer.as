/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.views.mediators.custom
{
    import com.epologee.navigator.behaviors.IHasStateInitialization;
    import com.epologee.navigator.behaviors.IHasStateTransition;
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Strong;
    import com.newtriks.models.constants.Intervals;
    import com.newtriks.models.constants.Positions;

    import org.robotlegs.mvcs.Mediator;

    public class AnimatedContainer extends Mediator implements IHasStateInitialization, IHasStateTransition
    {
        private var _animation:TimelineMax;

        public function initialize():void
        {
            viewComponent.x=Positions.OFF_SCREEN;
            viewComponent.y=Positions.MARGIN_TOP;
            viewComponent.alpha=0;
            viewComponent.visible=false;
        }

        public function transitionIn(inCallOnComplete:Function):void
        {
            TweenMax.fromTo(viewComponent, Intervals.OFF_SCREEN_X_TRANSITION, {x:Positions.OFF_SCREEN,
                ease:Strong.easeInOut}, {x:Positions.MARGIN_LEFT, ease:Strong.easeInOut});
            TweenMax.to(viewComponent, Intervals.CONTAINER_ALPHA_INOUT, {autoAlpha:1,
                onComplete:inCallOnComplete});
        }

        public function transitionOut(inCallOnComplete:Function):void
        {
            TweenMax.fromTo(viewComponent, Intervals.OFF_SCREEN_X_TRANSITION, {x:Positions.MARGIN_LEFT,
                ease:Strong.easeInOut}, {x:Positions.OFF_SCREEN, ease:Strong.easeInOut});
            TweenMax.to(viewComponent, Intervals.CONTAINER_ALPHA_INOUT, {autoAlpha:0,
                onComplete:finishTransitionOut, onCompleteParams:[inCallOnComplete]});
        }

        private function finishTransitionOut(inCallOnComplete:Function):void
        {
            inCallOnComplete();
        }
    }
}