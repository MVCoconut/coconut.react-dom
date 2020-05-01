package coconut.react;

import js.html.*;
import tink.domspec.EventFrom;
import tink.domspec.ClassName;
import tink.core.Callback;

typedef DomElement<E:js.html.DOMElement> = react.ReactComponent.ReactSingleFragment;

@:forward
abstract ReactEvent<Elt, Evt:Event>(EventFrom<Elt, Evt>) to EventFrom<Elt, Evt> to Evt {
  public inline function stopImmediatePropagation()
    this.stopPropagation();
}

typedef ReactEvents<Target:js.html.DOMElement> = {
  @:hxx(onwheel) @:optional var onWheel:Callback<ReactEvent<Target, WheelEvent>>;

  @:hxx(oncopy) @:optional var onCopy:Callback<ReactEvent<Target, ClipboardEvent>>;
  @:hxx(oncut) @:optional var onCut:Callback<ReactEvent<Target, ClipboardEvent>>;
  @:hxx(onpaste) @:optional var onPaste:Callback<ReactEvent<Target, ClipboardEvent>>;

  @:hxx(onabort) @:optional var onAbort:Callback<ReactEvent<Target, Event>>;
  @:hxx(onblur) @:optional var onBlur:Callback<ReactEvent<Target, Event>>;
  @:hxx(onfocus) @:optional var onFocus:Callback<ReactEvent<Target, Event>>;

  @:hxx(oncanplay) @:optional var onCanPlay:Callback<ReactEvent<Target, Event>>;
  @:hxx(oncanplaythrough) @:optional var onCanPlayThrough:Callback<ReactEvent<Target, Event>>;

  //TODO: Try warning about onChange being treated as onInput
  @:hxx(onchange) @:optional var onChange:Callback<ReactEvent<Target, Event>>;

  @:hxx(onclick) @:optional var onClick:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(oncontextmenu) @:optional var onContextMenu:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(ondblclick) @:optional var onDoubleClick:Callback<ReactEvent<Target, MouseEvent>>;

  @:hxx(ondrag) @:optional var onDrag:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondragend) @:optional var onDragEnd:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondragenter) @:optional var onDragEnter:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondragleave) @:optional var onDragLeave:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondragover) @:optional var onDragOver:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondragstart) @:optional var onDragStart:Callback<ReactEvent<Target, DragEvent>>;
  @:hxx(ondrop) @:optional var onDrop:Callback<ReactEvent<Target, DragEvent>>;

  @:hxx(ondurationchange) @:optional var onDurationChange:Callback<ReactEvent<Target, Event>>;
  @:hxx(onemptied) @:optional var onEmptied:Callback<ReactEvent<Target, Event>>;
  @:hxx(onended) @:optional var onEnded:Callback<ReactEvent<Target, Event>>;
  @:hxx(oninput) @:optional var onInput:Callback<ReactEvent<Target, Event>>;
  @:hxx(oninvalid) @:optional var onInvalid:Callback<ReactEvent<Target, Event>>;

  @:hxx(oncompositionstart) @:optional var onCompositionStart:Callback<ReactEvent<Target, Event>>;
  @:hxx(oncompositionupdate) @:optional var onCompositionUpdate:Callback<ReactEvent<Target, Event>>;
  @:hxx(oncompositionend) @:optional var onCompositionEnd:Callback<ReactEvent<Target, Event>>;

  @:hxx(onkeydown) @:optional var onKeyDown:Callback<ReactEvent<Target, KeyboardEvent>>;
  @:hxx(onkeypress) @:optional var onKeyPress:Callback<ReactEvent<Target, KeyboardEvent>>;
  @:hxx(onkeyup) @:optional var onKeyUp:Callback<ReactEvent<Target, KeyboardEvent>>;

  @:hxx(onload) @:optional var onLoad:Callback<ReactEvent<Target, Event>>;
  @:hxx(onloadeddata) @:optional var onLoadedData:Callback<ReactEvent<Target, Event>>;
  @:hxx(onloadedmetadata) @:optional var onLoadedMetadata:Callback<ReactEvent<Target, Event>>;
  @:hxx(onloadstart) @:optional var onLoadStart:Callback<ReactEvent<Target, Event>>;

  @:hxx(onmousedown) @:optional var onMouseDown:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmouseenter) @:optional var onMouseEnter:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmouseleave) @:optional var onMouseLeave:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmousemove) @:optional var onMouseMove:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmouseout) @:optional var onMouseOut:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmouseover) @:optional var onMouseOver:Callback<ReactEvent<Target, MouseEvent>>;
  @:hxx(onmouseup) @:optional var onMouseUp:Callback<ReactEvent<Target, MouseEvent>>;

  @:hxx(onpause) @:optional var onPause:Callback<ReactEvent<Target, Event>>;
  @:hxx(onplay) @:optional var onPlay:Callback<ReactEvent<Target, Event>>;
  @:hxx(onplaying) @:optional var onPlaying:Callback<ReactEvent<Target, Event>>;
  @:hxx(onprogress) @:optional var onProgress:Callback<ReactEvent<Target, Event>>;
  @:hxx(onratechange) @:optional var onRateChange:Callback<ReactEvent<Target, Event>>;
  @:hxx(onreset) @:optional var onReset:Callback<ReactEvent<Target, Event>>;
  @:hxx(onresize) @:optional var onResize:Callback<ReactEvent<Target, Event>>;
  @:hxx(onscroll) @:optional var onScroll:Callback<ReactEvent<Target, Event>>;
  @:hxx(onseeked) @:optional var onSeeked:Callback<ReactEvent<Target, Event>>;
  @:hxx(onseeking) @:optional var onSeeking:Callback<ReactEvent<Target, Event>>;
  @:hxx(onselect) @:optional var onSelect:Callback<ReactEvent<Target, Event>>;
  @:hxx(onshow) @:optional var onShow:Callback<ReactEvent<Target, Event>>;
  @:hxx(onstalled) @:optional var onStalled:Callback<ReactEvent<Target, Event>>;
  @:hxx(onsubmit) @:optional var onSubmit:Callback<ReactEvent<Target, Event>>;
  @:hxx(onsuspend) @:optional var onSuspend:Callback<ReactEvent<Target, Event>>;
  @:hxx(ontimeupdate) @:optional var onTimeUpdate:Callback<ReactEvent<Target, Event>>;
  @:hxx(onvolumechange) @:optional var onVolumeChange:Callback<ReactEvent<Target, Event>>;
  @:hxx(onwaiting) @:optional var onWaiting:Callback<ReactEvent<Target, Event>>;

  @:hxx(onpointercancel) @:optional var onPointerCancel:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerdown) @:optional var onPointerDown:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerup) @:optional var onPointerUp:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointermove) @:optional var onPointerMove:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerout) @:optional var onPointerOut:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerover) @:optional var onPointerOver:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerenter) @:optional var onPointerEnter:Callback<ReactEvent<Target, PointerEvent>>;
  @:hxx(onpointerleave) @:optional var onPointerLeave:Callback<ReactEvent<Target, PointerEvent>>;

  @:hxx(ongotpointercapture) @:optional var onGotPointerCapture:Callback<ReactEvent<Target, Event>>;
  @:hxx(onlostpointercapture) @:optional var onLostPointerCapture:Callback<ReactEvent<Target, Event>>;
  // apparently react doesn't have these two ?
  // @:optional var onFullscreenChange:Callback<ReactEvent<Target, Event>>;
  // @:optional var onFullscreenError:Callback<ReactEvent<Target, Event>>;
  @:hxx(onpointerlockchange) @:optional var onPointerLockChange:Callback<ReactEvent<Target, Event>>;
  @:hxx(onpointerlockerror) @:optional var onPointerLockError:Callback<ReactEvent<Target, Event>>;

  @:hxx(onerror) @:optional var onError:Callback<ReactEvent<Target, ErrorEvent>>;

  @:hxx(ontouchstart) @:optional var onTouchStart:Callback<ReactEvent<Target, TouchEvent>>;
  @:hxx(ontouchend) @:optional var onTouchEnd:Callback<ReactEvent<Target, TouchEvent>>;
  @:hxx(ontouchmove) @:optional var onTouchMove:Callback<ReactEvent<Target, TouchEvent>>;
  @:hxx(ontouchcancel) @:optional var onTouchCancel:Callback<ReactEvent<Target, TouchEvent>>;
}

@:coreType abstract CustomAttr from String from Int from Float {
  @:from static function ofBool(b:Bool):CustomAttr
    return if (b != true) js.Lib.undefined else '';
}

@:build(coconut.react.macros.Html.buildApi())
class Html {
  static public function raw(attr:RawAttr)
    return h(switch attr.tag { case null: 'span'; case v: v; }, { className: attr.className, dangerouslySetInnerHTML: { __html: attr.content } });

  static function h(tag:String, attr:Dynamic, ?children:Dynamic):react.ReactComponent.ReactSingleFragment
    return
      if (children == null) cast react.React.createElement(tag, attr);
      else (cast react.React.createElement).apply(null, [tag, attr].concat(children));
}

typedef RawAttr = {
  var content:String;
  @:optional var tag:String;
  @:optional var className:ClassName;
}