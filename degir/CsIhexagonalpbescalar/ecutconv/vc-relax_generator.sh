for i in 40 50 60 70 80 90 100
do
dldir="$i.ecut"
j=$((i*4))
[ ! -d "$dldir" ] && mkdir -p "$dldir"
cd $i.ecut
cat >> vc-relax.in <<EOF
&CONTROL
    title = 'CsIhexagonal', 
    calculation = 'vc-relax',
    restart_mode = 'from_scratch',
    ndr = 61,
    ndw = 62,
    verbosity = 'medium',
    prefix = 'CsSnI3',
    wf_collect = .true.,
    outdir = './out',
    wfcdir = './out',
    pseudo_dir = '../../../pseudo/',
    tprnfor = .true.,
    tstress = .true.,
    max_seconds = 42500,
    forc_conv_thr=1.d-4,
/
 &SYSTEM
    ibrav = 0,
    nat = 8, 
    ntyp = 2,
    ecutwfc= $i,
    ecutrho=$j,

/
 &ELECTRONS
    conv_thr = 1.0d-6,
    diagonalization = 'cg',
    mixing_beta = 0.5,
/
 &IONS
    ion_dynamics = 'bfgs',
/

 &CELL
    cell_dynamics = 'bfgs',
/
 CELL_PARAMETERS {angstrom}
7.859178 0.000000 0.000000
0.000000 7.859178 0.000000
0.000000 0.000000 7.859178

 ATOMIC_SPECIES
   Cs 132.9  Cs.pbe-spn-kjpaw_psl.1.0.0.UPF
   I  126.9  I.pbe-n-kjpaw_psl.1.0.0.UPF

 ATOMIC_POSITIONS {alat}
Cs 0.000000 0.000000 0.000000 
Cs 0.000000 0.500000 0.500000 
Cs 0.500000 0.000000 0.500000 
Cs 0.500000 0.500000 0.000000 
I 0.500000 0.000000 0.000000 
I 0.500000 0.500000 0.500000 
I 0.000000 0.000000 0.500000 
I 0.000000 0.500000 0.000000 

K_POINTS {automatic}
2 2 2 0 0 0
EOF
cat >>submit.job <<EOF
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --cpus-per-task=1
#SBATCH --mem=180000
#SBATCH --time=11:59:59
#SBATCH --account=Sis20_baroni
#SBATCH --partition=skl_usr_prod
#SBATCH --job-name=CsIhexagonal$i.ecut
#SBATCH --mail-user=endrigo@sissa.it
#SBATCH --mail-type=ALL

module purge
module load profile/phys
module load autoload qe/6.4
umask -S u=rwx,g=r,o=r

cd \${SLURM_SUBMIT_DIR}
echo \$SLURM_SUBMIT_DIR

# Define number of processors to send to mpirun for MPICH
NNODES=1
PW_EXE="pw.x"




NPROCS=\$((NNODES*48))
echo "\$(date)"
export OMP_NUM_THREADS=1
mpirun -np \${NPROCS} \${PW_EXE} < vc-relax.in > vc-relax.out
echo " Done."

echo "\$(date)"
EOF
cd ../
done
