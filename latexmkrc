@default_files = ('main.tex');

# Compile always to pdf
$pdf_mode = 1;

# Generate glossaries when compiling
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}

$clean_ext = "%R.acn %R.acr %R.alg %R.aux %R.auxlock %R.bak %R.bbl %R.blg %R.dvi %R.fls %R.glg %R.glo %R.gls %R.idx %R.ist %R.ilg %R.ind %R.log %R.out %R.pdf %R.ps %R.sav %R.swp %R.toc %R.run.xml %R-blx.bib %R_latexmk %R~ %R.pgf-plot.%R Figures/"
