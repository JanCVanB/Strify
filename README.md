# Strify

A [Roc](https://roc-lang.org) library for converting things to `Str`

## Supported input types

### `Str`

```coffee
strify (Str "") == "\"\""
strify (Str "Text") == "\"Text\""
```

### `Num`

```coffee
strify (Num 0) == "0"
strify (Num 6) == "6"
```

### `List Str`

```coffee
strify (List []) == "[]"
strify (List ["a", "b", "c"]) == "[\"a\", \"b\", \"c\"]"
```
