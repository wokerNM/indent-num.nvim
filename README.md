Installation:

```lua
return {
    "wokerNM/indent-num.nvim"
      lazy = false
      config = function()
        require("indent-num").setup()
      end,
}
```

Use:
    number + tab to indent by number
    number + shift + tab to unindent by number
