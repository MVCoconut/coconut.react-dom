package coconut.react;

class Renderer {

  static public function mountInto(target:js.html.Element, vdom:RenderResult)
    react.ReactDOM.flushSync(() -> {
      react.ReactDOM.ReactDOMClient.createRoot(target).render(vdom);
    });

  static var findDOMNode = if (false) react.ReactDOM.findDOMNode else null;

  static public function getNative(view:View):Null<js.html.Node> {
    findDOMNode ??= react.ReactDOM.findDOMNode ?? (cast react.ReactDOM).__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE.findDOMNode;
    return findDOMNode(cast view);
  }

  static public inline function updateAll()
    tink.state.Observable.updateAll();

  static public macro function hxx(e);

  static public macro function mount(target, markup);
}