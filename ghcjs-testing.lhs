<header>
<meta charset="utf-8">
<link rel="stylesheet" href="https://tonyday567.github.io/other/lhs.css">
</header>


[ghcjs-testing](https://github.com/tonyday567/ghcjs-testing)
===

Minimal ghcjs install and test page.

This is old-school web page development: `example.lhs` is used to render a html page, and the code below creates some javascript that tweaks said page.

<script language="javascript" src="other/ghcjs-testing.js"></script>

code
===

\begin{code}
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

\end{code}

Some plain vanilla js code
===

```include
other/vanilla.md
```








