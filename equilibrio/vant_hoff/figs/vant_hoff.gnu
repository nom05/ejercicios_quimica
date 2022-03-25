set terminal cairolatex size 11cm, 7cm
set output "vant_hoff.tex"
set key top right
#set format x '$%5.1f\mu$'
set format y "$%.1f$"
set ylabel '$\ln K$\quad'
set xlabel '$T^{-1}~(\si{\per\kelvin})\times\num{1e4}$'
f(x) = a*x + b
fit f(x) 'vant_hoff.dat' u ($2*10000):4 via a,b
stats 'vant_hoff.dat' u ($2*10000):4 name "A"
r2=A_correlation*A_correlation
titulo=sprintf("\small$\ln K$ = %.4f + %.4f$\times T^{-1}$ ($r^2$ = %.4f)", b, a, r2)
#plot 'butadieno-ciclobuteno.dat' u 1:($2*10000) w points pt 6, f(x) title titulo
plot 'vant_hoff.dat' u ($2*10000):4 w points notitle pt 5 ps 1.2, \
     f(x) with line lt -1 lw 2 title titulo
