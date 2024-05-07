/*Activity 9
Ref: Chapter 9, Biostat
This code is what is being uploaded
in SAS Studio*/

/*Activity 9.1(i)********/
data act9pt1;
input wbc Antibio $ Bact_cul $ Sex $ Service $ Dur_stay Age Temp;
cards;
8 No No Female med. 5 30 99.0 
5 No Yes Female med. 10 73 98.0 
12 No No Female surg. 6 40 99.0 
4 No No Female surg. 11 47 98.2 
11 No No Female surg. 5 25 98.5 
6 Yes No Male surg. 14 82 96.8 
8 Yes Yes Male med. 30 60 99.5 
7 No No Female med. 11 56 98.6 
7 No No Female med. 17 43 98.0 
12 No Yes Male surg. 3 50 98.0 
7 No Yes Female med. 9 59 97.6 
3 No No Male surg. 3 4 97.8 
11 Yes No Female surg. 8 22 99.5 
14 Yes Yes Female surg. 8 33 98.4 
11 No Yes Female surg. 5 20 98.4 
9 No No Male surg. 5 32 99.0 
6 Yes No Male surg. 7 36 99.2 
6 No No Male surg. 4 69 98.0 
5 Yes No Male med. 3 47 97.0 
6 No No Male surg. 7 22 98.2 
10 No No Male surg. 9 11 98.2 
14 Yes No Male surg. 11 19 98.6 
4 No No Female med. 11 67 97.6 
5 No No Female surg. 9 43 98.6 
5 No No Female med. 4 41 98.0 
;
run;
/*proc print noobs;run;*/
/*Activity 9.1(ii) & (iii)********/
proc univariate data=act9pt1 mu0=6;
ods select TestsForLocation;
var wbc;
title "Result of act 9.1: sign test";
run;

/*****Act 9.2, (a), Ref: problem 9.15, page 366*****/
data act9pt2;
input breast_fed bottle_fed;
diff=breast_fed-bottle_fed;
cards;
20 18
11 35
3 7
24 182
7 6
28 33
58 223
7 7 
39 57
17 76
17 186
12 29
52 39
14 15
12 21
30 28
7 8 
15 27
65 77
10 12
7 8
19 16
34 28
25 20
;
run;
/*proc print data=act9pt2;run;
proc univariate data=act9pt2 normal;
var breast_fed bottle_fed;
run;*/

*proc univariate performs Wilcoxon signed-rank test;
proc univariate data=act9pt2;
ods select TestsForLocation;
title "Result (b) & (c) of act 9.2: signed rank test";
var diff;
run;

/*****Act 9.3, Ref: problem 9.15, page 366*****/
libname lib "C:\Users\kislam\Desktop\Courses\Stat 468 568 BioStat";
ods select WilcoxonTest;
proc npar1way data=lib.smoke wilcoxon;
title "Result of act 9.3: signed sum test";
class gender;
var Day_abs;
run;

/*Act 9.4: Pemutation rank-sum test*/
proc iml;
/*define two groups as vectors:
grp1 and grp2*/
grp1 = {7.5,12.6,3.8,20.2,6.8,403.3,2.9,7.2,10.5,205.4};
grp2 = {8.2,13.3,102.0,12.7,6.3,4.8,19.5,8.3,407.1,10.2};
call randseed(123456);   /* set random number seed */
/* stack two grps into into a single grp vector*/
grp = grp1//grp2;           /* stack data into a single vector*/
n1 = nrow(grp1);  
n = n1 + nrow(grp2);
/*Assign ranks to the combined vector grp*/
r=rank(grp);
/*observed value of the rank-sum statistics due to grp1*/
robs=sum(r[1:n1]);
/*generate k=1000 samples WOR for 1000 permutations*/
k= 1000;  
/* define nulldist, a result holder vector*/ 
nulldist = j(k,1);  
do i = 1 to k;
   rs = sample(r, n, "wor");
nulldist[i] = sum(rs[1:n1]);  /* sum of ranks due to x1 sample */
end;
pL=mean(nulldist<=robs);
pR=mean(nulldist>=robs);
pT=2*min(pL,pR,0.5);
title "Act 9.4: Obs rank-sum statistic:";
print robs;
print "p-values of rank-sum permutation test:", pL pR pT;
quit;


/*proc iml;
x={1,5,2,9};
r=rank(x);
s=sum(r);
print x, r, s;
quit;
*/

