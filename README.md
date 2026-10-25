# coconut.react-dom
Coconut rendering through react-dom.

## Controlled selects

Selects support React's `value`:

```haxe
<select value=$selected onchange=${event -> selected = event.currentTarget.value}>
  <option value="one">One</option>
  <option value="two">Two</option>
</select>
```

The `value` prop accepts a string, or an array of strings for multiple selection.
`coconut.vdom` and `coconut.html` support it the same way, so such templates
stay portable (including server side rendering with hydration).
