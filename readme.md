[ghcjs-testing](https://tonyday567.github.com/ghcjs-testing)
============================================================

Minimal ghcjs install and test.

This is old-school web page development: `readme.lhs` is used to render
a html page, and the code below creates some javascript that tweaks said
page.

<script language="javascript" src="other/ghcjs-testing.js"></script>
code
====

``` {.sourceCode .literate .haskell}
{-# LANGUAGE OverloadedStrings #-}
import Protolude
import Vanilla

import GHCJS.Types
import GHCJS.Marshal
import GHCJS.Foreign
import GHCJS.Foreign.Callback
import GHCJS.Nullable (maybeToNullable, nullableToMaybe, Nullable)
import Data.JSString.Text (textToJSString, textFromJSString, lazyTextToJSString, lazyTextFromJSString)

main :: IO ()
main = do
    putStrLn ("putStrLn's go to the console.log" :: Text)
    onload $ do
       alert "window has loaded"
       consoleLog "consolLog is a synonym for putStrLn"
```

compiling
=========

The recipe below handles the bits and bobs you need to do every
re-compile:

-   stack build
-   rendering of the page
-   optimize (and copy) the js via
    [closure](http://dl.google.com/closure-compiler)

<pre>
  <code style="white-space: pre-wrap;">
stack build --exec "pandoc -f markdown+lhs -i readme.lhs -t html -o index.html" --exec "pandoc -f markdown+lhs -i readme.lhs -t markdown -o readme.md" --exec "java -jar $(stack path --local-bin)/closure-compiler-v20170124.jar --js_output_file=other/ghcjs-testing.js $(stack path --local-install-root)/bin/ghcjs-testing.jsexe/all.js"
  </code>
</pre>
reference
=========

[ghcjs user guide](https://github.com/ghcjs/ghcjs/wiki/GHCJS-User-Guide)

[ghcjs-base](https://github.com/ghcjs/ghcjs-base)

[mdn](https://developer.mozilla.org/en-US/docs)
