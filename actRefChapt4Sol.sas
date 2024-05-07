/****SAS act Ref chapter 4 solution
by Dr. Islam*/
/*We will solve using SAS*/

data actChpt4b;
n=5;
p=0.05;
/*X~B(n,p)*/
/*a)p(X>=1)=1-p(0)*/
ans_a=1-pdf('binomial',0,p,n);
/*bi)X~B(n,p)and 
px=comb(n,x)*p**x*(1-p)**(n-x);
*/
/*bii: E(X)=n*p*/
ans_bii=n*p;
/*biii: V(X)=n*p*/
ans_biii=n*p*(1-p);
/*biv: CV(X)=100*sd/mean*/
ans_biv=100*sqrt(n*p*(1-p))/(n*p);
/*bv: P(1<X<4)=F(3)-F(1)*/
ans_bv=cdf('binomial',3,p,n)-cdf('binomial',1,p,n);
/*bvi: P(1=X=4)=F(4)-F(0)*/
ans_bvi=cdf('binomial',4,p,n)-cdf('binomial',0,p,n);
run;
proc print data=actChpt4b;
run;


data actChpt4p;
/*p(3)for Poisson(4.6)*/
d=pdf("poisson",3,4.6);
e=cdf("poisson",3,4.6);
f=1-cdf("poisson",3,4.6);
gi=cdf("poisson",3,4.6)-cdf("poisson",1,4.6);
gii=cdf("poisson",4,4.6)-cdf("poisson",0,4.6);
run;
proc print;run;
