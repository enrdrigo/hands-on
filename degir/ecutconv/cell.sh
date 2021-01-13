for i in 40 50 60 70 75 80 85  90 95 100 105 115
do
cd $i.ecut
grep CELL -3 vc-relax.out>datic
tail -4 datic>>../convcell
cd ../
done
