slides_c32.md: slides_c32.Rmd
  Rscript -e 'knitr::knit("slides_c32.Rmd")'
slides_c32.tex: slides_c32.md 
  /usr/lib/rstudio/bin/pandoc/pandoc +RTS -K512m -RTS slides_c32.utf8.md --to beamer --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output slides_c32.tex --slide-level 2 --variable theme=AnnArbor --variable colortheme=dove --highlight-style tango --pdf-engine pdflatex --self-contained 
slides_c32.pdf: slides_c32.tex
  xelatex slides_c32.tex