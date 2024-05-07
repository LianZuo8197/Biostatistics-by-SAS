data hw3Chapt4BinoPoisSol;
p24=1-cdf("poisson",2,3.2);
p25=pdf("poisson",0,1.6);
p26=p24*p24;
p27=pdf("binomial",1,p24,2);
p28=(1-p24)*(1-p24);/*by independence*/
p28alt=pdf("binomial",0,p24,2);
p29=2*p24;
p42=1-cdf("binomial",2,0.05,20);
p43=cdf("binomial",2,0.1,18);
p44=pdf("binomial",0,0.145,20);
p45=pdf("binomial",1,0.145,20);
p46=pdf("binomial",2,0.145,20);

proc print data= hw3Chapt4BinoPoisSol noobs;
run;
