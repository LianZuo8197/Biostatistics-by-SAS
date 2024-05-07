data ActRefChapt5;
/* time to symptoms ~N(5,3)*/
/*(a) Determine the probability that a person with an exposure to COVID-19 will have symptoms between 3 and 6 days.*/
a=cdf("normal",6,5,3)-cdf("normal",3,5,3);
/*(b) Determine the probability that a person with an exposure will have symptom before 5 days.*/
b=cdf("normal",5,5,3);
/*(c) What is the probability that those with exposure will have symptoms after 9 days?*/
c=1-cdf("normal",9,5,3);
/*(d) What is the probability that those with exposure will have symptoms before 9 days?*/
d=cdf("normal",9,5,3);
/*(e) What is the cutoff time for 95% of the people with an exposure to have symptoms?*/
e=quantile("normal",0.95,5,3);
/*(f) What is the time for the top 10% people to have symptoms?*/
f=quantile("normal",0.90,5,3);
/*(g) What is the time that the first quartile of those exposed will have symptoms?*/
g=quantile("normal",0.25,5,3);
/*(h) What is the time that the third quartile of those exposed will have symptoms?*/
h=quantile("normal",0.75,5,3);
run;
proc print;run;
