
-------rem VarImb_SIS  RBF 5/4/3/2/1 S -> Inrenmental rbf 10/5/5/4/1 S -> tree 10/5/5/4/1
rem *** Sudden Drift with Imbalance Ratio 5/4/3/2/1  -> Incremental Drift ( RandomRBFGeneratorDrift -s 20.0 -k 20 -c 5 -a 21 -n 100) with Imbalance Ratio 10/5/5/4/1 
rem then Sudden Drift  -> tree 10/5/5/4/1

java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGenerator -c 5 -a 21) -c 0.3333;0.2667;0.2;0.1333;0.0667) -d (ImbalancedStream -s (ConceptDriftStream -s (generators.RandomRBFGeneratorDrift -s 20.0 -k 20 -c 5 -a 21 -n 100) -d (generators.RandomTreeGenerator -c 5 -o 0 -u 21) -p 100000 -w 1) -c 0.4;0.2;0.2;0.16;0.04) -p 100000 -w 1) -f .\VarImb_SIS.arff -m 300000


-------rem VarImb_ISSI 5/4/3/2/1 -> 5/1/2/2/5 -> 10/5/5/4/1
rem ***  Incremental Drift ( RandomRBFGeneratorDrift -s 10.0 -k 50 -c 5 -a 21 -n 100) with Var Imbalance Ratio   5/4/3/2/1  Sudden Drift-> tree 5/1/2/2/5,
rem Then Sudden Drift with Imbalance Ratio  tree 5/1/2/2/5  -> Incremental Drift ( RandomRBFGeneratorDrift -s 20.0 -k 20 -c 5 -a 21 -n 100) with Imbalance Ratio 10/5/5/4/1

java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGeneratorDrift -s 10.0 -k 50 -c 5 -a 21 -n 100) -c 0.3333;0.2667;0.2;0.1333;0.0667) -d (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomTreeGenerator -c 5 -o 0 -u 21) -c 0.3333;0.0668;0.1333;0.1333;0.3333) -d (ImbalancedStream -s (generators.RandomRBFGeneratorDrift -s 20.0 -k 20 -c 5 -a 21 -n 100) -c 0.4;0.2;0.2;0.16;0.04) -p 100000 -w 1) -p 100000 -w 1) -f .\VarImb_ISSI.arff -m 300000



------rem VarImb_SVg  5/4/3/2/1 S -> 5/4/3/2/1 VG -> 1/2/3/4/5
rem  *** Sudden Drift Stream with Fixed Imbalance Ratio 5/4/3/2/1, then Virtual Gradual Drift  5/4/3/2/1 -> 1/2/3/4/5
java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGenerator -c 5 -a 21) -c 0.3333;0.2667;0.2;0.1333;0.0667) -d (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomTreeGenerator -c 5 -o 0 -u 21) -c 0.3333;0.2667;0.2;0.1333;0.0667) -d (ImbalancedStream -s (generators.RandomTreeGenerator -c 5 -o 0 -u 21) -c 0.0667;0.1333;0.2;0.2667;0.3333) -p 100000 -w 5000) -p 100000 -w 1) -f .\VarImb_SVg.arff -m 300000





--------rem VarImb_SGrN5  tree 5/4/3/2/1 S -> rbf 5/4/3/2/1->Gradual Recurrent RandomTree 10/5/5/4/1
rem *** RandomTree with Var Imbalance Ratio 5/4/3/2/1  Sudden Drift ->  Gradual Recurrent Drift between RBF and RandomTree with Var Imbalance Ratio 10/5/5/4/1
java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomTreeGenerator -c 5 -o 0 -u 21) -c 0.3333;0.2667;0.2;0.1333;0.0667) -d (ImbalancedStream -s (RecurrentConceptDriftStream -x 20000 -y 30000 -z 4 -s (ImbalancedStream -s (generators.RandomRBFGenerator -r 0 -i 0 -c 5 -a 21) -c 0.3333;0.2667;0.2;0.1333;0.0667 -i 0) -d (generators.RandomTreeGeneratorIm -r 0 -i 0 -c 5 -o 0 -u 21 -n 5 -p 10 -g 1 -w 1000) -a 0.0099 -w 5000 -r 0) -c 0.4;0.2;0.2;0.16;0.04 -i 0) -p 100000 -w 1) -f .\VarImb_SGrN5.arff -m 300000



------rem VarImb_GSrN5:  rbf 10/5/5/4/1 G-> rbf 5/4/3/2/1->Recurrent RandomTree 10/5/5/4/1,noise 5%
java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGenerator -c 5 -a 21) -c 0.4;0.2;0.2;0.16;0.04) -d (ImbalancedStream -s (RecurrentConceptDriftStream -x 20000 -y 30000 -z 4 -s (ImbalancedStream -s (generators.RandomRBFGenerator -r 0 -i 0 -c 5 -a 21) -c 0.3333;0.2667;0.2;0.1333;0.0667 -i 0) -d (generators.RandomTreeGeneratorIm -r 0 -i 0 -c 5 -o 0 -u 21 -n 5 -p 10 -g 1 -w 1000) -a 0.0099 -w 1 -r 0) -c 0.4;0.2;0.2;0.16;0.04 -i 0)  -p 100000 -w 5000) -f .\VarImb_GSrN5.arff -m 300000




------rem FixedImb_GISGrN10 rbf 10/5/5/4/1 G-> Inc 10/5/5/4/1 S->  rbf 10/5/5/4/1->Gradual Recurrent RandomTree 10/5/5/4/1
rem *** RandomTree with Imbalance Ratio 5/4/3/2/1  Gradual Drift-> Incremental Drift ( RandomRBFGeneratorDrift -s 10.0 -k 25 -c 5 -a 21 -n 100) with Imbalance Ratio 1/2/3/4/5 
rem then Incremental Drift with Var Imbalance Ratio 1/2/3/4/5  Sudden Drift ->  Gradual Recurrent Drift between RBF and RandomTree with Var Imbalance Ratio 10/5/5/4/1 

java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGenerator -c 5 -a 21) -c 0.4;0.2;0.2;0.16;0.04) -d (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGeneratorDrift -s 25.0 -k 50 -c 5 -a 21 -n 100) -c 0.4;0.2;0.2;0.16;0.04) -d (ImbalancedStream -s (RecurrentConceptDriftStream -x 20000 -y 30000 -z 4 -s (ImbalancedStream -s (generators.RandomRBFGenerator -r 0 -i 0 -c 5 -a 21) -c 0.4;0.2;0.2;0.16;0.04 -i 0) -d (generators.RandomTreeGeneratorIm -r 0 -i 0 -c 5 -o 0 -u 21 -n 10 -p 10 -g 1 -w 1000) -a 0.0099 -w 5000 -r 0) -c 0.4;0.2;0.2;0.16;0.04 -i 0) -p 100000 -w 1) -p 100000 -w 5000) -f .\FixedImb_GISGrN10.arff -m 400000


------rem VarImb_GISGrN10 rbf 10/5/5/4/1 G-> Inc 1/2/3/4/5 S->  rbf 5/1/2/2/5->Gradual Recurrent RandomTree 10/5/5/4/1
rem *** RandomTree with Imbalance Ratio 5/4/3/2/1  Gradual Drift-> Incremental Drift ( RandomRBFGeneratorDrift -s 10.0 -k 25 -c 5 -a 21 -n 100) with Imbalance Ratio 1/2/3/4/5 
rem then Incremental Drift with Var Imbalance Ratio 1/2/3/4/5  Sudden Drift ->  Gradual Recurrent Drift between RBF and RandomTree with Var Imbalance Ratio 10/5/5/4/1 

java -cp ..\MOA\moa.jar -javaagent:..\MOA\sizeofag-1.0.0.jar moa.DoTask WriteStreamToARFFFile -s (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGenerator -c 5 -a 21) -c 0.4;0.2;0.2;0.16;0.04) -d (ConceptDriftStream -s (ImbalancedStream -s (generators.RandomRBFGeneratorDrift -s 25.0 -k 50 -c 5 -a 21 -n 100) -c 0.0667;0.1333;0.2;0.2667;0.3333) -d (ImbalancedStream -s (RecurrentConceptDriftStream -x 20000 -y 30000 -z 4 -s (ImbalancedStream -s (generators.RandomRBFGenerator -r 0 -i 0 -c 5 -a 21) -c 0.3333;0.0668;0.1333;0.1333;0.3333 -i 0) -d (generators.RandomTreeGeneratorIm -r 0 -i 0 -c 5 -o 0 -u 21 -n 10 -p 10 -g 1 -w 1000) -a 0.0099 -w 5000 -r 0) -c 0.4;0.2;0.2;0.16;0.04 -i 0) -p 100000 -w 1) -p 100000 -w 5000) -f .\VarImb_GISGrN10.arff -m 400000



pause



