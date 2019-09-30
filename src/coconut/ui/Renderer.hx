package coconut.ui;

class Renderer {

  static public function mount(target:js.html.Element, vdom:RenderResult)
    react.ReactDOM.render(vdom, target);

  static public function getNative(view:View):Null<js.html.Node>
    return react.ReactDOM.findDOMNode(cast view);

  static public inline function updateAll()
    tink.state.Observable.updateAll();
  
}