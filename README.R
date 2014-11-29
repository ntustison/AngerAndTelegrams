#!/usr/bin/env Rscript
#
library( ggplot2 )
library( shiny )
library( ggvis )
library( rmarkdown )
library( pander )

srcdir <- "./"
buildRmd <- 'abideBuild.Rmd'
rawRmds <- c( "intro.Rmd", "paper.Rmd", "qaqc.Rmd" )
for ( x in 1:length( rawRmds ) )
  {
  if ( x == 1 )
    {
    cmd <- paste( "cat ", rawRmds[x]," > ", buildRmd )
    } else {
    cmd <- paste( "cat ", rawRmds[x], " >> ", buildRmd )
    }
 system( cmd )
}
render( buildRmd, clean = TRUE, "revealjs_presentation", output_file = 'index.html' )
