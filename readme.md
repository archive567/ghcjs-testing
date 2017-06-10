[ghcjs-testing](https://github.com/tonyday567/ghcjs-testing)
============================================================

Minimal ghcjs install and test.


See [ghcjs-testing](https://tonyday567.github.io/ghcjs-testing) for the rendered page.

This is old-school web page development: [example.lhs](example.lhs) is used to both render
a html page, and insert javascript that tweaks said page.

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
stack build --exec "pandoc -f markdown+lhs -i src/Vanilla.lhs -t markdown -o other/vanilla.md" --exec "pandoc -f markdown+lhs -i ghcjs-testing.lhs -t html -o index.html --filter pandoc-include" --exec "java -jar $(stack path --local-bin)/closure-compiler-v20170124.jar --js_output_file=other/ghcjs-testing.js $(stack path --local-install-root)/bin/ghcjs-testing.jsexe/all.js"
  </code>
</pre>

reference
=========

[ghcjs user guide](https://github.com/ghcjs/ghcjs/wiki/GHCJS-User-Guide)

[ghcjs-base](https://github.com/ghcjs/ghcjs-base)

[mdn](https://developer.mozilla.org/en-US/docs)
