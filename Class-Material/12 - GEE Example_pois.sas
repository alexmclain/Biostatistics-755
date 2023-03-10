data epileptic_w;
input ID TRT Age C0 C1 C2 C3 C4;
datalines;
           1     0      31      11      5     3     3     3
           2     0      30      11      3     5     3     3
           3     0      25       6      2     4     0     5
           4     0      36       8      4     4     1     4
           5     0      22      66      7    18     9    21
           6     0      29      27      5     2     8     7
           7     0      31      12      6     4     0     2
           8     0      36      52     40    20    23    12
           9     0      37      23      5     6     6     5
          10     0      28      10     14    13     6     0
          11     0      36      52     26    12     6    22
          12     0      24      33     12     6     8     5
          13     0      28      18      4     4     6     2
          14     0      36      42      7     9    12    14
          15     0      26      87     16    24    10     9
          16     0      26      50     11     0     0     5
          17     0      28      18      0     0     3     3
          18     0      31     111     37    29    28    29
          19     0      32      18      3     5     2     5
          20     0      21      20      3     0     6     7
          21     0      29      12      3     4     3     4
          22     0      21       9      3     4     3     4
          23     0      32      17      2     3     3     5
          24     0      25      28      8    12     2     8
          25     0      30      55     18    24    76    25
          26     0      40       9      2     1     2     1
          27     0      19      10      3     1     4     2
          28     0      22      47     13    15    13    12
          29     1      18      76     11    14     9     8
          30     1      32      38      8     7     9     4
          31     1      20      19      0     4     3     0
          32     1      20      10      3     6     1     3
          33     1      18      19      2     6     7     4
          34     1      24      24      4     3     1     3
          35     1      30      31     22    17    19    16
          36     1      35      14      5     4     7     4
          37     1      57      11      2     4     0     4
          38     1      20      67      3     7     7     7
          39     1      22      41      4    18     2     5
          40     1      28       7      2     1     1     0
          41     1      23      22      0     2     4     0
          42     1      40      13      5     4     0     3
          43     1      43      46     11    14    25    15
          44     1      21      36     10     5     3     8
          45     1      35      38     19     7     6     7
          46     1      25       7      1     1     2     4
          47     1      26      36      6    10     8     8
          48     1      25      11      2     1     0     0
          49     1      22     151    102    65    72    63
          50     1      32      22      4     3     2     4
          51     1      25      42      8     6     5     7
          52     1      35      32      1     3     1     5
          53     1      21      56     18    11    28    13
          54     1      41      24      6     3     4     0
          55     1      32      16      3     5     4     3
          56     1      26      22      1    23    19     8
          57     1      21      25      2     3     0     1
          58     1      36      13      0     0     0     0
          59     1      37      12      1     4     3     2
		  ;
		  run;


data epileptic;
set epileptic_w;
  array AC(1:5) C0-C4;
  array Aweek(1:5) (0 2 4 6 8);
  do i=1 to 5;
   Count = AC[i];
   week = Aweek[i];
   L_per = log(2);
   if i eq 1 then L_per=log(8);
   output;
  end;
  drop C0-C4 Aweek1 - Aweek5 i;
run;

data epileptic;
set epileptic;
  rate = Count/exp(L_per);
  l_count = log(Count+1);
  l_rate = log((Count+1)/exp(L_per));
run;

proc print data=epileptic (obs=10);
run;


Proc SGpanel data = epileptic;
PanelBy TRT / columns=2;
series y=rate x=week / group =ID LineAttrs= (pattern=1 );
run;
quit;


Proc SGpanel data = epileptic;
PanelBy TRT / columns=2;
series y=l_rate x=week / group =ID LineAttrs= (pattern=1 );
run;
quit;

proc sort data=epileptic;
by TRT week;

*Calculate the mean by week;
proc means mean data=epileptic noprint;
by TRT week;
var l_rate;
output out = MN_TRT_dat mean = mn_TRT_rate; 
run;


*First, let's look at the mean by TRT group;
Proc SGplot data = MN_TRT_dat;
series x=week y=mn_TRT_rate / group =TRT LineAttrs= (pattern=1 thickness=3);
run;


proc gee data=epileptic;
class ID ;
model Count = TRT week TRT*week/d=poisson link=log offset=L_per type3;
repeated subject=ID/type=exch corrw modelse covb ;
run;
quit;


proc gee data=epileptic;
class ID week (ref = '0');
model Count = TRT week TRT*week/d=poisson link=log offset=L_per type3;
repeated subject=ID/type=exch corrw modelse covb ;
run;
quit;


proc gee data=epileptic;
class ID ;
model Count = TRT week TRT*week/d=poisson link=log offset=L_per type3;
repeated subject=ID/type=un corrw modelse covb ;
run;
quit;


proc gee data=epileptic;
class ID ;
model Count = TRT week TRT*week/d=negbin link=log offset=L_per type3;
repeated subject=ID/type=exch corrw modelse covb ;
run;
quit;
