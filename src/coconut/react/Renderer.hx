package coconut.react;

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
    return coconut.react.macros.HXX.parse(e);
}