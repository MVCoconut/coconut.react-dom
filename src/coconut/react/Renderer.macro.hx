package coconut.react;

class Renderer {

  static public function hxx(e)
    return coconut.react.macros.HXX.parse(e);

  static function mount(target, markup)
    return coconut.ui.macros.Helpers.mount(macro coconut.react.Renderer.mountInto, target, markup, hxx);
}