data obesity_wide;
input Gender OB77 OB79 OB81 CT1 CT2 CT3 CT4 CT5;
datalines;
0 1 1 1  8  20  25  16  15
0 1 1 0  1   7   9  11   6
0 1 0 1  1   9   7   4   0
0 1 0 0  0   8   7  13   8
0 0 1 1  7   8  10   3   7
0 0 1 0  3   8   8   8   2
0 0 0 1  9  15  11   7   4
0 0 0 0 90 150 152 119 101
1 1 1 1  8  21  27  14  15
1 1 1 0  1   6   8   7   6
1 1 0 1  2   6   0   2   0
1 1 0 0  2   2  12   6   6
1 0 1 1  4  19   8   9   3
1 0 1 0  2  13  10   7   5
1 0 0 1  8  14   6   8   9
1 0 0 0 75 154 148 129  91
;

ods rtf file="C:\Users\mclaina\OneDrive - University of South Carolina\Classes\755_Spring_2019\Examples\15 - GEE Example.rtf";

proc print data=obesity_wide (obs=5);
run;


data obesity;
set obesity_wide;
  array OBCT(1:5) CT1-CT5;
  array Coh(1:5) (6 8 10 12 14);
  array AYear(1:3) (1977 1979 1981);
  array OBYR(1:3) OB77 OB79 OB81;
*  if _n_ eq 1 then cum_ct = 0;
*  if cum_ct eq . then cum_ct=lag(ID);
  do i=1 to 5;
   Cohort = Coh[i];
   CT_tot = OBCT[i]*3;
  do j=1 to 3;
  age = Coh[i]+2*(j-1);
   year = AYear[j];
   OB = OBYR[j];
   do k=1 to OBCT[i];
*   ID = cum_ct + k;
   output;
   end;
   end;
 *  cum_ct = cum_ct + OBCT[i];
  end;
  drop CT1-CT5 Coh1-Coh5 AYear1 - AYear3 i j; 
run;

proc print data=obesity (obs=30);
run;


proc sort data=obesity;
by Gender OB77 OB79 OB81 cohort;
run;

data obesity2;
set obesity;
by Gender OB77 OB79 OB81 cohort;
if first.cohort then group_id+1;
if last.cohort then CT_tot = CT_tot; else CT_tot = 0;
drop OB77 OB79 OB81;
run;

proc print data=obesity2 (obs=30);
run;

proc sort data=obesity2;
by group_id;
run;

data obesity3;
set obesity2;
tot+CT_tot;
drop CT_tot;
run;

data obesity4;
set obesity3;
ID = lag1(tot)+k;
if group_id = 1 then ID = k;
drop group_id tot k;
run;

proc sort data=obesity4;
by ID;
run;

proc print data=obesity4 (obs=30);
run;

proc sort data=obesity4;
by Cohort year;
run;

proc means data=obesity4 mean noprint;
by Cohort year;
var OB;
output out=mndat mean=mn N=samp;
run;

proc print data=mndat;
var Cohort year mn samp;
run;

goptions ftext='Arial' htext=2 gunit=pct ctext=green csymbol=blue;
symbol1 f=marker v='C' i=join h=1.25;
symbol2 f=marker v='U' i=join h=1.25;
symbol3 f=marker v=star i=join h=1.25;
symbol4 f=marker v='A' i=join h=1.25;
symbol5 f=marker v='B' i=join h=1.25;

legend1 position=(right middle)
        label=(position=top)
        across=1;
proc gplot data=mndat;
plot mn*year=Cohort/ legend=legend1;
run;
quit;


proc sort data=obesity4;
by cohort age;
run;

proc means data=obesity4 mean noprint;
by cohort age;
var OB;
output out=mndat2 mean=mn N=samp;
run;

proc gplot data=mndat2;
plot mn*age=Cohort/ legend=legend1;
run;
quit;


proc sort data=obesity4;
by ID;
run;


proc genmod data=obesity4 DESCENDING;
class ID gender (param=ref);
model OB = gender age age*age gender*age gender*age*age/d=bin link=logit;
repeated subject=ID/type=exch corrw modelse covb ;
output out=full_mod pred=pred;
run;
quit;




proc sort data=obesity4;
by cohort age gender;
run;

proc means data=obesity4 mean noprint;
by cohort age gender;
var OB;
output out=mndat4 mean=mn N=samp;
run;

proc gplot data=mndat4;
where gender = 0;
plot mn*age=Cohort/ legend=legend1;
run;
quit;

proc gplot data=mndat4;
where gender = 1;
plot mn*age=Cohort/ legend=legend1;
run;
quit;


proc sort data=obesity4;
by ID;
run;


proc genmod data=obesity4 DESCENDING;
class ID gender (param=ref);
model OB = gender age age*age gender*age gender*age*age/d=bin link=logit;
repeated subject=ID/type=exch corrw modelse covb ;
output out=full_mod pred=pred;
run;
quit;


proc sort data=full_mod;
by cohort age gender;
run;

data full2;
set full_mod;
by cohort age gender;
drop_var = 0;
if first.gender then drop_var = 1;
if drop_var = 1;
drop drop_var OB;
run;

proc print data=full2;
run;

data merg_dat;
merge full2 mndat4;
by cohort age gender;
drop _TYPE_ _FREQ_;
run;

proc print data=merg_dat;
run;


proc gplot data=merg_dat;
where gender = 0;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;

proc gplot data=merg_dat;
where gender = 1;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;



proc genmod data=obesity4 DESCENDING;
class ID gender cohort (param=ref);
model OB = cohort gender age age*age gender*age gender*age*age/d=bin link=logit type3;
repeated subject=ID/type=exch corrw modelse covb ;
output out=full_mod pred=pred;
run;
quit;

proc sort data=full_mod;
by cohort age gender;
run;


data full2;
set full_mod;
by cohort age gender;
drop_var = 0;
if first.gender then drop_var = 1;
if drop_var = 1;
drop drop_var OB;
run;


data merg_dat;
merge full2 mndat4;
by cohort age gender;
drop _TYPE_ _FREQ_;
run;


proc gplot data=merg_dat;
where gender = 0;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;

proc gplot data=merg_dat;
where gender = 1;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;




proc genmod data=obesity4 DESCENDING;
class ID gender (param=ref);
model OB = gender age age*age/d=bin link=logit type3;
repeated subject=ID/type=exch corrw modelse covb ;
run;
quit;



proc sort data=full_mod;
by cohort age gender;
run;


data full2;
set full_mod;
by cohort age gender;
drop_var = 0;
if first.gender then drop_var = 1;
if drop_var = 1;
drop drop_var OB;
run;


data merg_dat;
merge full2 mndat4;
by cohort age gender;
drop _TYPE_ _FREQ_;
run;

proc gplot data=merg_dat;
where gender = 0;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;

proc gplot data=merg_dat;
where gender = 1;
plot (pred mn)*age=Cohort/legend=legend1;
run;
quit;


ods rtf close;
