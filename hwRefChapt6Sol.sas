/*Ref: STAT 468/568 Biostatistics
**hw chapter 6 solution*/

data hw1;
/*a=mean of SD of xbar=125 mmHg, SE of SD of xbar=10/sqrt(25)
b= xbar~N(125,10/sqrt(25)) */
c=cdf("normal",130,125,10/sqrt(25))-cdf("normal",127,125,10/sqrt(25));
d=quantile("normal",0.90,125,10/sqrt(25));
run;
proc print data=hw1;
title"Result of chapt 6 hw 1";
run;


data hw2;
input m s n;
me=quantile("t", 0.975,n-1)*s/sqrt(n);
/*CI of mean*/
LLmean=m-me;
ULmean=m+me;
/*CI of variance*/
LLvar=(1/quantile("chisq",.975,n-1))*(n-1)*s**2;
ULvar=(1/quantile("chisq",.025,n-1))*(n-1)*s**2;
/*CI of sd*/
LLsd=sqrt(LLvar);
ULsd=sqrt(ULvar);
cards;
140 25 200
;
run;
proc print data=hw2;
title"Result of chapt 6 hw 2";
run;

data hw3;
p=6/46;
sd=sqrt(p*(1-p)/46);
me=quantile("normal", 0.975)*sd;
LL=p-me;
UL=p+me;
run;
proc print data=hw3;
title"Result of chapt 6 hw 3";
run;

data hw4;
input m s n;
wd=2*quantile("t", 0.95,n-1)*s/sqrt(n);
cards;
28 5 61
32 4 30
25 3 20 
40 6 121
;
run;
proc print data=hw4;
title"Result of chapt 6 hw 4";
run;
proc means data=hw4 min;
var wd;
run;

