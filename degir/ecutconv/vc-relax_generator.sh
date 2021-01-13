for i in 40 50 60 70 75 80 85  90 95 100 105 115
do
dldir="$i.ecut"
j=$((i*4))
[ ! -d "$dldir" ] && mkdir -p "$dldir"
cd $i.ecut
cat >> vc-relax.in <<EOF
&CONTROL
    title = 'water64_500', 
    calculation = 'vc-relax',
    restart_mode = 'from_scratch',
    ndr = 61,
    ndw = 62,
    verbosity = 'medium',
    prefix = 'water64_500',
    wf_collect = .true.,
    outdir = './out',
    wfcdir = './out',
    pseudo_dir = '../../../../pseudo/',
    tprnfor = .true.,
    tstress = .true.,
    max_seconds = 42500,
/
 &SYSTEM
    ibrav = 1,
    celldm(1) = 23.480807079346505,
    nat = 192,
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

ATOMIC_SPECIES
   H  1.00 H_HSCV_PBE-1.0.upf
   O  16.0 O_HSCV_PBE-1.0.upf

ATOMIC_POSITIONS {bohr}
H     2.740348545103568      1.19714338967655      5.070626521163344
H     0.4065556784519882      4.3388300794020145      2.504416238444041
H     7.014568888304628      4.0228300768420935      0.5425309217494355
H     4.967693139154979      5.119853886709845      10.906138588530215
H     2.850311708295542      0.3089853391853104      9.67254427163576
H     0.8232308403013474      5.7753053930362945      9.798211058923373
H     4.880954710034655      2.8597603389186705      5.98604765045456
H     6.737591730218229      0.7095694830834812      15.06106052148365
H     4.086589436286967      2.7875916982192126      12.309222441542358
H     1.9989900891516321      3.6793156619076206      17.622565386152633
H     5.757201816762379      1.0683509953788055      20.926449158880853
H     2.099069984711813      1.1231776194325729      18.903497342468967
H     0.9607575487471124      0.5548292593685      22.678603221633868
H     4.874057209679772      8.204982963251386      3.5079930914490483
H     2.986579859142306      8.692872454107267      5.601752945750663
H     0.12021511639068082      11.099533160124416      5.775513262910003
H     7.235912509282044      10.020083803215684      10.888431854742473
H     0.4145794555771492      8.545832864350135      10.382684452008876
H     4.949665151926049      9.92168576390642      16.572161119779402
H     2.8838732442688957      8.019374063290641      20.465922902309554
H     1.243590968093727      7.476606925775628      22.74606644428301
H     6.339313052192102      17.33784035095527      5.691968470940298
H     6.596561469537407      11.841968759967388      5.121611332005748
H     5.177414944465947      13.989302349902145      11.401152346875936
H     6.445307790522361      13.677308566726431      8.85565346248253
H     1.2995211922042758      13.07594102208677      14.148833029343052
H     5.34170773374091      16.511406424872682      15.53037400453446
H     3.021180744484204      16.53480123429555      17.203424131710637
H     5.709542923899317      12.627660190803045      16.038502462185082
H     5.98791847931794      15.933036847169719      23.10246879138743
H     1.9899760955371675      14.54412594009227      22.046867778171475
H     2.0226872547544392      11.922225428480246      23.190907974019915
H     1.028167859064763      20.588188182572843      5.3507028300941295
H     3.57075089604787      21.159263417434747      8.808769357330567
H     7.3149786503363865      19.82681752696112      13.822949759151339
H     1.58329002598258      19.82001451291247      20.82364805770121
H     4.030351186818104      19.422038191066278      19.396148943158906
H     7.902759064139986      22.86436329968458      21.78797529909774
H     13.082536166261715      4.414400227125799      1.3348685193654006
H     11.11395177045531      0.9312419164065826      2.2377569849980983
H     9.788592352949028      3.0682349249873857      5.531077188689659
H     8.965673317458243      5.635692426948942      1.8753188526516233
H     10.982237859568896      4.11106138960087      11.34064331636542
H     8.959437221246978      0.5062122753602528      6.497029594553368
H     14.299576482304449      3.854228712002982      6.653839068374814
H     15.139389669349386      3.5634943477293075      16.466185278710388
H     11.93018117546492      4.549402261469064      14.004061110935472
H     10.98119851020035      3.481820384622982      18.27712872120051
H     8.684916707122593      3.269982086052433      19.970247739820216
H     13.772664146975046      8.229058074079118      4.731949805107913
H     13.238060626318415      7.130919325797836      0.45125148075163696
H     8.89611249881077      6.743808929168248      5.268310771060445
H     9.205725227069454      6.687117145429474      8.111800568046089
H     12.069548477156072      8.478331847178502      15.228528050647986
H     8.578203872864975      7.674744709942641      11.827701327726464
H     9.820547621716448      10.226404101502325      15.49441251638283
H     15.12852374413279      6.380887026933868      16.962861996045778
H     11.7040565473922      10.77119324597069      22.736806786272343
H     10.524848548364474      8.524365575574388      21.415510279934
H     13.9814410892237      11.812243368027026      19.41277853305561
H     10.95332504986212      15.997873350505628      1.0513982623147875
H     8.307406119206103      13.848064219347615      4.0111326721306595
H     11.821143978074014      16.73760664199039      9.048273246365635
H     13.785778846279948      12.89577453336495      6.724099085688401
H     9.142910730686893      16.389405706266842      9.991851294913776
H     15.503539893564774      14.631695848707428      8.214204826739559
H     13.407266703517408      15.579544678297221      15.936835196680217
H     13.839465965480567      11.998381391302663      16.561484167175266
H     8.61943769690431      15.52345760691833      22.05745024446938
H     12.313776681502706      14.09389869090018      22.886473095342705
H     11.669739120968996      20.56532249646487      2.3163695917825304
H     14.849260017435594      18.577066051701113      3.471200123802585
H     9.923159750283627      19.20868811159603      4.131243664611874
H     10.24617063676591      21.05684026148003      9.532439976756004
H     8.020035467434262      18.87439556014973      7.423619005241122
H     11.799431024902063      23.23153708569937      10.55340231010757
H     9.22736259119642      17.718147733536206      13.539056203448808
H     14.550758878789708      17.899996078508945      14.715202846154641
H     7.851641972468859      23.482303742437207      12.522931568976286
H     9.430697122206151      19.145571259033527      21.0398327263584
H     10.13014145271389      20.57703879843755      18.66367219999271
H     13.787914236800775      18.907843712555607      19.578696486797753
H     12.013083460552252      23.587183542353937      23.131003655869275
H     17.73757411809736      5.6514527428283206      -0.0510023852953623
H     17.324442192731674      3.8004471064961325      2.0908685733309373
H     21.770400846138724      3.960091169504518      0.6176475352033098
H     21.03397457537206      0.6702272748948973      10.754412477984012
H     21.082729509387406      3.5301406816296623      10.80891217941822
H     15.977143054918484      2.560163159120501      8.576238557695365
H     22.54065321453619      4.497472587564348      14.710988756896727
H     17.935674107741878      0.6525092027504061      22.0487575042961
H     20.33572077232284      9.640645694652076      2.438804947397034
H     18.228732835148843      10.814902611233283      0.9006755963407608
H     16.196634744293767      9.731087986976664      4.502329183704636
H     19.385944422085924      7.7805693729216845      9.865164055518862
H     16.680612502071675      6.975338173957397      9.39925207949238
H     22.34223197145048      8.578373948216191      6.269053034878515
H     18.787203596759497      8.845751297589493      14.154577796761915
H     18.34803124539647      10.271587453142127      16.595612620986007
H     21.667977690184006      6.979892413917745      15.833769533843126
H     22.403648070500818      11.06094495265956      17.400787128166556
H     23.13402721766868      10.528571308829987      20.11518973357901
H     17.004700532444993      14.909655664378633      1.2274753837029184
H     22.35753875305995      15.329212658568046      1.814709666656501
H     23.049178514672985      16.059950853699586      6.789521404122945
H     21.243545202593058      14.772820595694482      8.597082236849987
H     17.77542533237361      15.777134441888094      11.494259153036246
H     17.965947520258386      12.922665336118374      11.477157131608385
H     22.724523566462274      13.455265747082901      12.195819976803564
H     16.165945592029846      15.249692983243794      21.994333391906878
H     20.96783416101016      15.665678395057666      17.905608565099083
H     21.11031951080694      16.62010347156116      23.067886803306777
H     17.42586379384034      19.81434533453859      3.5930307670572086
H     23.006659676868903      21.12184684016716      2.9753170914395364
H     22.69768945549259      20.702894558337626      10.147130090574274
H     20.89451278737468      21.34993678340949      8.022454316873782
H     17.090796454682945      21.435352404242575      9.774079256311902
H     15.987631034910159      21.22823842098359      7.14261673050927
H     19.168247972529038      19.85724211756759      13.044817232814184
H     18.07679885472893      18.39060677498429      15.245252126850923
H     21.00732943701484      23.077335433929907      14.978668462449967
H     16.478241731385502      22.18500675788162      15.84361500695243
H     23.295220856099256      21.362975893669407      15.08247111847566
H     16.607801354489844      18.92126076804045      20.06095459380225
H     21.91156338764827      22.70222479819169      22.603581094486223
H     17.14495600541472      21.38867616896432      22.20938422488929
H     16.900954568203037      22.939952344669614      18.570489804787414
H     21.19611307686495      18.515083034813387      17.790675422199342
O     3.2271419948071665      2.9292833630436528      5.256688955393997
O     7.244983194680248      5.640926968314155      1.3175246129935856
O     0.09102187132701209      4.065122147511218      0.7444670554269454
O     4.009129562438557      3.6004573907269877      10.695169563976993
O     7.128859524321994      0.9878807878138661      22.102803671460396
O     3.1466774564206013      2.373042478260057      18.120923959738946
O     4.761542916219553      8.567885968224518      5.27647438791883
O     7.24592805774256      8.218078765295042      10.731452305569809
O     6.393623781013846      11.004101990830815      16.448421853138903
O     1.5480900974591758      8.717665660862357      21.46596596746151
O     7.048073732494243      13.58611038395199      5.282899456742556
O     2.4734436272614246      13.639532941495162      0.055978223154114416
O     6.793622109813382      14.049811380412661      10.5911212435551
O     3.896312912798398      15.523627682269547      15.9854011580831
O     7.1905779795522715      16.62673641025859      21.942932841317056
O     2.214135408440276      22.101102917948232      9.546631819951942
O     6.625852224469107      19.023872896607628      6.280901617679919
O     6.500771252280127      23.076768516092518      13.655444435464508
O     0.2125601739501559      22.391553823303212      22.58260513450288
O     2.356356196579612      18.761163170762153      19.577373678510515
O     9.220257220967827      1.444329015408224      4.972625324340252
O     12.589393236779374      0.851486025316752      1.1943749409039734
O     15.589786993892695      4.1833056193453135      7.878173727258604
O     14.03325737956094      4.9887635854445564      16.5963874086971
O     10.413203528921583      4.450361715277428      13.023803478308345
O     9.411610888347433      4.292059357817527      18.666733556314604
O     14.560056331322867      9.765405413399868      5.271957942480974
O     12.526408665045597      6.086051956969756      1.7449863315623086
O     9.961710163225995      6.095916327340302      6.578533482308478
O     11.486435686880297      10.134960254331686      14.795572898234976
O     12.105887910532624      9.364651194150483      21.67270200549557
O     11.095923783226382      14.222286683807257      0.7368949228455699
O     13.939810422698194      14.601705895109617      7.305473327929518
O     13.254784702521354      17.380529264110567      15.8652145765569
O     14.673893433070322      12.707028688037328      18.001436576878856
O     11.140691395118766      18.912568027867174      2.826727926260212
O     10.206013956617612      22.846977819338022      9.788516763904042
O     10.336858593486703      17.66107800457251      9.513051386717343
O     7.840322512982351      18.26284239169834      14.564421598670751
O     10.288670577308745      20.630518047764458      20.46478906663478
O     15.039744410797871      18.35135716337581      20.75977531468886
O     17.969972636903837      3.9165707768543867      0.4051194865972726
O     20.972558476321723      2.080626257735466      11.885319077266304
O     18.682815125635173      9.30421775268495      1.7858441001028424
O     22.49964615763181      9.87871339183243      5.021550333706813
O     17.688516827902074      8.086005806444946      10.410406734257137
O     23.18013653510955      7.1550511284093075      9.473763980586375
O     18.444369483229888      8.59908534654209      15.91344038725735
O     23.135538998568382      5.944360292145316      15.619058851563148
O     22.010962981803583      11.523625497012931      19.10475317474161
O     21.741865981656876      16.9344783096539      1.252644645956809
O     22.95752679762863      14.737671689776443      8.020432309920432
O     18.432388619599763      14.393099028212179      10.53259642547544
O     23.05144618602253      12.678172570114292      13.796191237226637
O     20.04092349688122      17.18847639806485      18.212159937035878
O     16.332335977303142      14.003305220485622      23.29465393826187
O     23.017620088391734      21.42325815704497      4.758821710600093
O     16.167079427704618      19.026518513182104      4.625860580471423
O     20.94345669400249      20.690989283752483      9.706294780221576
O     16.260129542081195      22.402703207438506      8.491106395780973
O     17.715993445754133      18.904064260306356      13.548731601206892
O     21.640009743539544      21.58312898718831      15.777852537815452
O     16.050917962823874      23.45471374101767      17.05904905578923
O     18.312239832596056      22.494732869707782      21.381306237078277
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
#SBATCH --job-name=2$i.ecut
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
