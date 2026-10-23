# coconut.react-dom
Coconut rendering through react-dom.

## Controlled selects

Enable `-D coconut_react_dom_select_value` to use React's controlled select API:

```haxe
<select value=$selected onchange=${event -> selected = event.currentTarget.value}>
  <option value="one">One</option>
  <option value="two">Two</option>
</select>
```

The `value` prop accepts a string, or an array of strings for multiple selection.
This is opt-in because these templates are not portable to `coconut.html` or
`coconut.vdom`, which use `selected` on individual options instead.
