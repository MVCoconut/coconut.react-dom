package ;

import coconut.ui.*;
import travix.Logger.*;

class RunTests {

  static function main() {
    Renderer.mount(
      cast js.Browser.document.createDivElement(),
      coconut.Ui.hxx('<div>Hello, world!</div>')
    );
    println('it works');
    exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}

class Example extends View {
  var foo:String;
  function render() '
    <div>
      <button onclick=${event.currentTarget.disabled = true}></button>
    </div>
  ';
}