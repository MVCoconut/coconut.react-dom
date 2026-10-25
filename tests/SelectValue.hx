import coconut.ui.*;
import js.Browser.*;
import js.html.*;
import tink.state.State;

class SelectValue {
  static public final value = new State('b');
  static public final values = new State(['a', 'c']);
  static public final other = new State(0);

  static function selected(select:SelectElement)
    return [for (i in 0...select.options.length) {
      var option:OptionElement = cast select.options[i];
      if (option.selected) option.value;
    }].join(',');

  static function update()
    react.ReactDOM.flushSync(Renderer.updateAll);

  static public function run() {
    var failures = [];

    function check(expected:String, actual:String, ?pos:haxe.PosInfos)
      if (actual != expected)
        failures.push('${pos.fileName}:${pos.lineNumber}: expected $expected, got $actual');

    var container = document.createDivElement();
    document.body.appendChild(container);

    Renderer.mount(container, '<Selects />');

    var single:SelectElement = cast container.querySelector('#single'),
        multiple:SelectElement = cast container.querySelector('#multiple'),
        text:SelectElement = cast container.querySelector('#text');

    check('b', single.value);
    check('a,c', selected(multiple));
    check('d', text.value);

    value.set('c');
    values.set(['b']);
    update();
    check('c', single.value);
    check('b', selected(multiple));

    single.value = 'a';
    other.set(1);
    update();
    check('c', single.value);

    document.body.removeChild(container);
    return failures;
  }
}

class Selects extends View {
  function render() '
    <div data-other=${SelectValue.other.value}>
      <select id="single" value=${SelectValue.value.value} onchange=${_ -> {}}>
        <option value="a">A</option>
        <option value="b">B</option>
        <option value="c">C</option>
      </select>
      <select id="multiple" multiple value=${SelectValue.values.value} onchange=${_ -> {}}>
        <option value="a">A</option>
        <option value="b">B</option>
        <option value="c">C</option>
      </select>
      <select id="text" value="d" onchange=${_ -> {}}>
        <option>b</option>
        <option>d</option>
      </select>
    </div>
  ';
}
