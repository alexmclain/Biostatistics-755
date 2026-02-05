proc import file= '/home/mclaina0/Longitudinal Data/Cholesterol.xlsx' 
out=Cholesterol 
dbms=xlsx 
replace;
run;

data cholst;
set Cholesterol;
l_age = log(age);
age_at_meas = time + age;
run;


*ods rtf file="C:\Users\mclaina\OneDrive - University of South Carolina\Teaching\755_Spring_2022\Examples\08-LMM Examples.rtf";

* First, we'll create the mean plots for time.;
proc sort data=cholst;
by Sex;
run;

proc loess data=cholst plots=none;
ods output outputstatistics=out_cholst;
by Sex;
model cholst = time;
run;

*Note: sort by time so the line looks good;
proc sort data=out_cholst;
by Sex time;
run;
*Note: just keep sex, age, and pred then append to full data;
data out_cholst;
set out_cholst;
keep Sex time pred;
run;
data out_cholst_all;
set cholst out_cholst;
run;
*Note: plot all observations with smoothed mean;
proc sgpanel data=out_cholst_all;
panelby sex;
series x=time y=cholst / group =ID LineAttrs= (color=black pattern=1
thickness=1);
series x=time y=pred/ lineattrs=(color=blue thickness=5) ;
run;

*Now, we'll create the mean plot by age at measurement;

proc sort data=cholst;
by Sex;
run;

proc loess data=cholst plots=none;
ods output outputstatistics=out_cholst;
by Sex;
model cholst = age_at_meas;
run;

*Note: sort by age so the line looks good;
proc sort data=out_cholst;
by Sex age_at_meas;
run;
*Note: just keep sex, age, and pred then append to full data;
data out_cholst;
set out_cholst;
keep Sex age_at_meas pred;
run;
data out_cholst_all;
set cholst out_cholst;
run;
*Note: plot all observations with smoothed mean;
proc sgpanel data=out_cholst_all;
panelby sex;
series x=age_at_meas y=cholst / group =ID LineAttrs= (color=black pattern=1
thickness=1);
series x=age_at_meas y=pred/ lineattrs=(color=blue thickness=5) ;
run;

proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Age / s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex / s;
random intercept/subject=ID;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*l_age / s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*Sex / s;
random intercept/subject=ID;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept/subject=ID;
run;





proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept/subject=ID;
run;

proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v vcorr;
run;

proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Age/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;


proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time Age/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;




proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age/type=UN subject=ID g gcorr v vcorr;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v vcorr;
run;


proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age/type=UN subject=ID g gcorr v=26,34 vcorr s;
* ID 26 is 56 years old;
* ID 34 is 31 years old;
run;



proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;



proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age Time/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
* ID 26 is 56 years old;
* ID 34 is 31 years old;
run;



*ods rtf close;
