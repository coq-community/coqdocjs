# CoqdocJS

CoqdocJS is a little script to dynamically improve the coqdoc output. The result can be seen here:

https://www.ps.uni-saarland.de/autosubst/doc/Ssr.POPLmark.html

It offers the following features:
- Customizable Unicode display:
	It only changes the display, copy-paste from the website produces pure ASCII.
	It only replaces complete identifiers or notation tokens, possibly terminated by numbers or apostrophes.
	It does not replace randomly, like in "omega." or "tauto."
	To add new symbols, edit [config.js](extra/resources/config.js).
- Proof hiding:
	All proofs longer than one line are hidden by default. They can be uncovered by clicking on "Proof...".

All of this works with the ordinary coqdoc, by asking coqdoc to use a header file including the javascript files and some custom CSS.

## Usage

This repo is a complete setup with a generic Makefile. Just can add your Coq files in the same folder as the Makefile.

## Files

- [Makefile](Makefile) and [\_CoqProject](_CoqProject): A generic Makefile setup that calls coqc and coqdoc with the right parameters. Use
	```
		make doc
	```
	to build the Coqdoc website in the folder "doc".
- [config.js](extra/resources/config.js): contains the unicode replacement table
- [coqdoc.css](extra/resources/coqdoc.css): a replacement for the default Coqdoc CSS style. Can be removed to use the default style.
- [coqdocjs.js](extra/resources/coqdocjs.js) and [coqdocjs.css](extra/resources/coqdocjs.css): the script rewriteing the DOM and adding the dynamic features with a corresponding CSS style.
- [header.html](extra/header.html) and [footer.html](extra/footer.html): custom header and footer files used in every generated html file.
