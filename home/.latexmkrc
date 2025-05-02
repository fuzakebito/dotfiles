#!/usr/bin/env perl
$latex            = 'lualatex -synctex=1 -halt-on-error -shell-escape %O %S';
$latex_silent     = 'lualatex -synctex=1 -halt-on-error -shell-escape -interaction=batchmode %O %S';
$pdflatex         = 'lualatex -synctex=1 --halt-on-error -shell-escape -interaction=batchmode %O %S';
$bibtex           = 'upbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'upmendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	  = 1; # 1: pdflatex 3:dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

$pdf_previewer    = "zathura";
