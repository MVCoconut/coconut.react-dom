package coconut.react;

import haxe.macro.Context;
import haxe.macro.Expr;
import tink.domspec.Macro.tags;
import tink.domspec.Macro.getAria;
using tink.MacroApi;

class Html {

  static function registerTags()
    coconut.react.macros.HXX.defaults.whenever(tink.hxx.Tag.extractAllFrom(macro coconut.react.Html));

  static var NAMELESS = '';

  static var reactAttributes = {
    var ret = new Map();
    for (name in 'accept acceptCharset accessKey action allowFullScreen alt async autoComplete autoFocus autoPlay capture cellPadding cellSpacing challenge charSet checked cite classID className colSpan cols content contentEditable contextMenu controls controlsList coords crossOrigin data dateTime default defer dir disabled download draggable encType form formAction formEncType formMethod formNoValidate formTarget frameBorder headers height hidden high href hrefLang htmlFor httpEquiv icon id inputMode integrity is keyParams keyType kind label lang list loop low manifest marginHeight marginWidth max maxLength media mediaGroup method min minLength multiple muted name noValidate nonce open optimum pattern placeholder poster preload profile radioGroup readOnly rel required reversed role rowSpan rows sandbox scope scoped scrolling seamless selected shape size sizes span spellCheck src srcDoc srcLang srcSet start step style summary tabIndex target title type useMap value width wmode wrap accentHeight accumulate additive alignmentBaseline allowReorder alphabetic amplitude arabicForm ascent attributeName attributeType autoReverse azimuth baseFrequency baseProfile baselineShift bbox begin bias by calcMode capHeight clip clipPath clipPathUnits clipRule colorInterpolation colorInterpolationFilters colorProfile colorRendering contentScriptType contentStyleType cursor cx cy d decelerate descent diffuseConstant direction display divisor dominantBaseline dur dx dy edgeMode elevation enableBackground end exponent externalResourcesRequired fill fillOpacity fillRule filter filterRes filterUnits floodColor floodOpacity focusable fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight format from fx fy g1 g2 glyphName glyphOrientationHorizontal glyphOrientationVertical glyphRef gradientTransform gradientUnits hanging horizAdvX horizOriginX ideographic imageRendering in in2 intercept k k1 k2 k3 k4 kernelMatrix kernelUnitLength kerning keyPoints keySplines keyTimes lengthAdjust letterSpacing lightingColor limitingConeAngle local markerEnd markerHeight markerMid markerStart markerUnits markerWidth mask maskContentUnits maskUnits mathematical mode numOctaves offset opacity operator order orient orientation origin overflow overlinePosition overlineThickness paintOrder panose1 pathLength patternContentUnits patternTransform patternUnits pointerEvents points pointsAtX pointsAtY pointsAtZ preserveAlpha preserveAspectRatio primitiveUnits r radius refX refY renderingIntent repeatCount repeatDur requiredExtensions requiredFeatures restart result rotate rx ry scale seed shapeRendering slope spacing specularConstant specularExponent speed spreadMethod startOffset stdDeviation stemh stemv stitchTiles stopColor stopOpacity strikethroughPosition strikethroughThickness string stroke strokeDasharray strokeDashoffset strokeLinecap strokeLinejoin strokeMiterlimit strokeOpacity strokeWidth surfaceScale systemLanguage tableValues targetX targetY textAnchor textDecoration textLength textRendering to transform u1 u2 underlinePosition underlineThickness unicode unicodeBidi unicodeRange unitsPerEm vAlphabetic vHanging vIdeographic vMathematical values vectorEffect version vertAdvY vertOriginX vertOriginY viewBox viewTarget visibility widths wordSpacing writingMode x x1 x2 xChannelSelector xHeight xlinkActuate xlinkArcrole xlinkHref xlinkRole xlinkShow xlinkTitle xlinkType xmlns xmlnsXlink xmlBase xmlLang xmlSpace y y1 y2 yChannelSelector z zoomAndPan'.split(' '))
      switch name.toLowerCase() {
        case _ == name => true:
        case lower: ret[lower] = name;
      }
    ret;
  }

  static function buildApi() {
    var ret = Context.getBuildFields();
    var custom = {
      var aria = [for (a in getAria()) a.name].join('|');

      EConst(CRegexp('^$aria|(data-.*)$', '')).at((macro null).pos);
    }

    for (name in tags.keys()) {

      var tag = tags[name];
      var et = tag.dom.toComplex();

      #if xDOM
      et = macro : xdom.Wrapped<$et>;
      #end
      ret.push({
        name: name,
        pos: tag.pos,
        access: [AStatic, APublic, AInline],
        meta: [{ name: ':${tag.kind}Tag', params: [], pos: tag.pos }],
        kind: FFun({
          var fields = (macro class {
            @:optional var key(default, never):coconut.react.Key;
            @:optional var ref(default, never):coconut.ui.Ref<$et>;
            @:hxxCustomAttributes($custom)
            @:optional var $NAMELESS(default, never):CustomAttr;
          }).fields;

          for (f in tag.attr.toType().sure().getFields().sure()) {
            var reactName = switch reactAttributes[f.name] {
              case null: null;
              case _ == f.name => true: null;
              case v: v;
            }

            fields.push({
              name: if (reactName == null) f.name else reactName,
              pos: f.pos,
              meta: {
                var meta = f.meta.get();
                if (reactName != null)
                  meta.push({
                    name: ':hxx',
                    pos: f.pos,
                    params: [macro @:pos(f.pos) $i{f.name}],
                  });
                meta;
              },
              kind: FProp('default', 'never', f.type.toComplex()),
            });
          }

          var args = [{
            name: 'attributes',
            type: TExtend(['ReactEvents'.asTypePath([TPType(et)])], fields),
            opt: false
          }];
          var callArgs = [macro $v{name}, macro attributes];
          if (tag.kind != VOID) {
            args.push({
              name: 'children',
              type: macro : coconut.react.Children,
              opt: true
            });
            callArgs.push(macro children);
          }
          {
            args: args,
            expr: macro return h($a{callArgs}),
            ret: macro : DomElement<$et>,
          }
        })
      });
    }
    return ret;
  }

}