set terminal svg size 600,400 font "monospace,11"
set tics font "monospace,9"
set key font "monospace,9"

set datafile separator ";"
set datafile columnheaders

set xdata time
set timefmt "%s"
set xtics timedate

set style data fillsteps
set style fill transparent solid 0.5 noborder
set tics scale 0
set grid

set multiplot layout 2,2 margins char 4,2,4,2 spacing char 6,4
set yrange @YRANGE
set key at screen 0.5,0 center bottom horizontal reverse Left

set title "Day"
set xtics format "%k"
set xtics 2 hours
set xrange @XDRANGE
plot for [metric in METRICS] \
     FILENAME \
     using (column("timestamp")):(column("value")) \
     if (stringcolumn("name") eq metric) \
     title metric

unset key

set title "Week"
set xtics format "%a"
set xtics 1 days
set xrange @XWRANGE
refresh

set title "Month"
set xtics format "%d.%m"
set xtics 1 weeks
set xrange @XMRANGE
refresh

set title "Year"
set xtics format "%b"
set xtics 1 months
set xrange @XYRANGE
refresh

unset multiplot
