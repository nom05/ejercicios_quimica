set terminal latex size 11cm, 7cm
set output "se_ha_estudiado_la_cinetica_de_una_reaccion_de_primer_orden.tex"
set key top right
set format x '$%.2f$'
set format y "$%.4f$"
set ylabel '$\ln(k)$\quad'
set xlabel '$T^{-1}\times\num{e3}~(\si{\per\kelvin})$'
f(x) = a*x + b
fit f(x) 'se_ha_estudiado_la_cinetica_de_una_reaccion_de_primer_orden.dat' u ($3*1000):4 via a,b
stats 'se_ha_estudiado_la_cinetica_de_una_reaccion_de_primer_orden.dat' u ($3*1000):4 name "A"
r2=A_correlation*A_correlation
titulo=sprintf("$\ln(k)$ = %.2f + (%.2f)$T^{-1}$ ($r^2$ = %.4f)", b, a*1000, r2)
#plot 'butadieno-ciclobuteno.dat' u 1:($2*10000) w points pt 6, f(x) title titulo
plot 'se_ha_estudiado_la_cinetica_de_una_reaccion_de_primer_orden.dat' u ($3*1000):4 w points notitle pt 5 ps 1.5, \
     f(x) with line lt -1 lw 2 title titulo
