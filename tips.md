vim tips
=======

#### search with regex 

* matching all chars including new line

```
/\_.*
```

* non-greedy match between angle brackets

```
/<\_.\{-}>

```

* search and replace

`:%s/foo/bar/g` Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.

`:s/foo/bar/g` Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.

`:%s/foo/bar/gc` Change each 'foo' to 'bar', but ask for confirmation first.

`:%s/\<foo\>/bar/gc` Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.

`:%s/foo/bar/gci` Change each 'foo' (case insensitive due to the i flag) to 'bar'; ask for confirmation.

`:%s/foo\c/bar/gc is the same because \c makes the search case insensitive.` This may be wanted after using :set noignorecase to make searches case sensitive (the default).

`:%s/foo/bar/gcI` Change each 'foo' (case sensitive due to the I flag) to 'bar'; ask for confirmation.

`:%s/foo\C/bar/gc is the same because \C makes the search case sensitive.` This may be wanted after using :set ignorecase to make searches case insensitive.

