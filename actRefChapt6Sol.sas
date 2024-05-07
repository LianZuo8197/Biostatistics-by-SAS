/*Ref: Act Chapter 6 solution
Dr. Islam, Feb 14*/

data act1;
/*a=mean of SD of xbar=105 mmHg, SE of SD of xbar=5/sqrt(16)
b= xbar~N(105,5/sqrt(16)) */
c=cdf("normal",115,105,5/sqrt(16))-cdf("normal",106,105,5/sqrt(16));
d=quantile("normal",0.95,105,5/sqrt(16));
run;
proc print data=act1;
title"Result of chapter 6 act 1";
run;

data act2;
input m s n;
me=quantile("t", 0.95,n-1)*s/sqrt(n);
/*CI of mean*/
LLmean=m-me;
ULmean=m+me;
/*CI of variance*/
LLvar=(1/quantile("chisq",.95,n-1))*(n-1)*s**2;
ULvar=(1/quantile("chisq",.05,n-1))*(n-1)*s**2;
/*CI of sd*/
LLsd=sqrt(LLvar);
ULsd=sqrt(ULvar);
cards;
116 21 25
;
run;
proc print data=act2;
title"Result of chapter 6 act 2";
run;

data act3;
p=63/90;
sd=sqrt(p*(1-p)/90);
me=quantile("normal", 0.95)*sd;
LL=p-me;
UL=p+me;
run;
proc print data=act3;
title"Result of chapter 6 act 3";
run;

data act4;
input m s n;
wd=2*quantile("t", 0.95,n-1)*s/sqrt(n);
cards;
25 4 30
31 5 45
35 3 95
;
run;
proc print data=act4;
title"Result of chapter 6 act 4";
run;
proc means data=act4 min;
var wd;
run;

