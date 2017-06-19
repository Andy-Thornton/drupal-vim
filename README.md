
<!-- vim-markdown-toc GFM -->
* [Introduction](#introduction)
* [Plugins](#plugins)
* [Python](#python)
* [Themes](#themes)
* [Syntax](#syntax)
  * [ASCIIDOC Support](#asciidoc-support)

<!-- vim-markdown-toc -->


Introduction
------------

I gave a [Demo](http://bit.ly/drupal-development-with-vim) of my Vim setup that I use for Drupal and general Linux development a while back. Here's my current Vim setup. I'll work on improving the documentation when I have free time. Let me know if you find any problems or have suggestions for improvements. 

## Plugins 

| Plugin   | Description|
|-------------|------------------------------------------------------------------------------------------------|
| [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)| Filemanager                                |
| [Taglist](http://www.vim.org/scripts/script.php?script_id=273)  | Support for code profiling, using CTAGS    |
| [Fugitive](http://www.vim.org/scripts/script.php?script_id=2975)| Git support                                |
| [Drupal](http://drupal.org/node/1389006)                        | Drupal Support                             |
| [Bash Support](http://www.vim.org/scripts/script.php?script_id=365)| Improved Bash Scripting  Support        |
| [Airline](http://www.vim.org/scripts/script.php?script_id=4661)| Status line improvements.                   |


<a name="python"></a>

## Python 

Python syntax included along with code referenced in this article  http://henry.precheur.org/vim/python


<a name="themes"></a>

## Themes
Default theme used is zenburst (Thanks to Michael Clayton for his help). I have a number of themes installed, you can change the theme for both vim and gvim in their config files.


<a name="syntax"></a>

## Syntax

* Asciidoc
* Conky
* Emender
* Desktop shortcuts (Linux)
* Javascript
* Nginx
* PHP
* Snippets
* Python
* CSS
* GitHub Markdown
* Less
* JSON
* Groovy

### ASCIIDOC Support
Sample template for an asciidoc article using the .adoc extension is included and syntax highlighting turned on for .adoc files. To use syntax highlighting on .txt files, you can use one of the following approaches.

* use the command :set syntax=asciidoc
* add to the bottom of the file  //vim: set syntax=asciidoc

For more information, checkout the asciidoc github repo https://github.com/asciidoc/vim-asciidoc
