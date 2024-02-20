proc import file= '/home/mclaina0/Longitudinal Data/cdystonia.csv' out=cdystonia dbms=csv replace;
getnames=Yes;
run;
*variables: week, site, id, treat, age, sex, twstrs;

proc contents data=cdystonia;
run;

data cdystonia;
set cdystonia;
new_id = site*100 + id;
week2 = week;
run;


*Now we will include the mean line on the graph by TRT;
proc sort data=cdystonia;
by treat week;

*Calculate the mean by week;
proc means mean data=cdystonia noprint;
by treat week;
var twstrs;
output out = MN_cdystonia mean = mn_twstrs; 
run;


*We'll look at the means by TRT group with the rest of the data;
data stacked_cdystonia;
set cdystonia MN_cdystonia;
run;

proc sort data=stacked_cdystonia;
by treat week;


* Now we'll combine them onto one plot with two panels;
Proc SGpanel data = stacked_cdystonia;
PanelBy treat / columns=3;
series x=week y=twstrs / group =new_id LineAttrs= (pattern=1 color="black");
series x=week y=mn_twstrs / LineAttrs= (pattern=1 color="blue" thickness=4);
run;

*Now we will include the mean line on the graph by TRT;
proc sort data=cdystonia;
by week;

proc freq data = cdystonia;
by week;
tables treat*sex/chisq;
run;


proc mixed data=cdystonia covtest;
class new_id treat sex week;
model twstrs = treat sex week treat*week/ solution;
repeated /sub=new_id type=UN r rcorr;
run;


proc mixed data=cdystonia covtest;
class new_id treat sex week;
model twstrs = treat sex week treat*week/ solution;
random intercept week2/sub=new_id type=un v vcorr g gcorr;
run;


proc mixed data=cdystonia covtest method=ML;
class new_id treat sex week;
model twstrs = treat sex week treat*week/ solution;
repeated /sub=new_id type=UN r rcorr;
run;


proc mixed data=cdystonia covtest method=ML;
class new_id treat sex week;
model twstrs = treat week treat*week/ solution;
repeated /sub=new_id type=UN r rcorr;
run;


proc mixed data=cdystonia covtest method=ML;
class new_id treat sex week;
model twstrs = treat sex week treat*week sex*treat sex*week sex*week*treat / solution;
repeated /sub=new_id type=UN r rcorr;
run;



proc mixed data=cdystonia covtest;
class new_id treat(ref='1') sex week(ref='0');
model twstrs = treat sex week treat*week/ solution;
repeated /sub=new_id type=UN r rcorr;
run;