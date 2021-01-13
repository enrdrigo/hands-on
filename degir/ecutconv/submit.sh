for i in 40 50 60 70 75 80 85  90 95 100 105 115
do
cd $i.ecut
sbatch submit.job
cd ../
done
