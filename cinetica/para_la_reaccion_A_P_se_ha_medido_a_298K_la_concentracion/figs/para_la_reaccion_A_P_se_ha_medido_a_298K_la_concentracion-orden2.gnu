set terminal latex size 11cm, 7cm
set output "para_la_reaccion_A_P_se_ha_medido_a_298K_la_concentracion-orden2.tex"
set key top right
#set format x '$%5.1f\mu$'
set format y "$%.3f$"
set ylabel '$\frac{1}{[A]}~(\si{\per\Molar})$\quad\quad'
set xlabel '$\text{tiempo}~(\si{\second})$'
f(x) = a*x + b
fit f(x) 'para_la_reaccion_A_P_se_ha_medido_a_298K_la_concentracion.dat' u 1:4 via a,b
stats 'para_la_reaccion_A_P_se_ha_medido_a_298K_la_concentracion.dat' u 1:4 name "A"
r2=A_correlation*A_correlation
titulo=sprintf("$[A]^{-1}$ = %.4f + %.4f$t$ ($r^2$ = %.4f)", b, a, r2)
#plot 'butadieno-ciclobuteno.dat' u 1:($2*10000) w points pt 6, f(x) title titulo
plot 'para_la_reaccion_A_P_se_ha_medido_a_298K_la_concentracion.dat' u 1:4 w points notitle pt 5 ps 1.5, \
     f(x) with line lt -1 lw 2 title titulo
