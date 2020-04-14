package coconut.ui;

class Renderer {

  #if !macro
  static public function mount(target:js.html.Element, vdom:RenderResult)
    react.ReactDOM.render(vdom, target);

  static public function getNative(view:View):Null<js.html.Node>
    return react.ReactDOM.findDOMNode(cast view);

  static public inline function updateAll()
    tink.state.Observable.updateAll();
  #end

  static public macro function hxx(e)
    return coconut.ui.macros.HXX.parse(e, 'coconut.react.View.createFragment');
}