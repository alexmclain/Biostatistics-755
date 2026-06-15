*Cervical-dystonia trial data (from the course's cdystonia.csv) read inline;
data cdystonia;
input week site id treat age sex twstrs;
datalines;
  0 1 1 2 65 1 32
  2 1 1 2 65 1 30
  4 1 1 2 65 1 24
  8 1 1 2 65 1 37
  12 1 1 2 65 1 39
  16 1 1 2 65 1 36
  0 1 2 1 70 1 60
  2 1 2 1 70 1 26
  4 1 2 1 70 1 27
  8 1 2 1 70 1 41
  12 1 2 1 70 1 65
  16 1 2 1 70 1 67
  0 1 3 2 64 1 44
  2 1 3 2 64 1 20
  4 1 3 2 64 1 23
  8 1 3 2 64 1 26
  12 1 3 2 64 1 35
  16 1 3 2 64 1 35
  0 1 4 3 59 1 53
  2 1 4 3 59 1 61
  4 1 4 3 59 1 64
  8 1 4 3 59 1 62
  0 1 5 1 76 1 53
  2 1 5 1 76 1 35
  4 1 5 1 76 1 48
  8 1 5 1 76 1 49
  12 1 5 1 76 1 41
  16 1 5 1 76 1 51
  0 1 6 1 59 1 49
  2 1 6 1 59 1 34
  4 1 6 1 59 1 43
  8 1 6 1 59 1 48
  12 1 6 1 59 1 48
  16 1 6 1 59 1 51
  0 1 7 2 72 2 42
  2 1 7 2 72 2 32
  4 1 7 2 72 2 32
  8 1 7 2 72 2 43
  12 1 7 2 72 2 42
  16 1 7 2 72 2 46
  0 1 8 3 40 2 34
  2 1 8 3 40 2 33
  4 1 8 3 40 2 21
  8 1 8 3 40 2 27
  12 1 8 3 40 2 32
  16 1 8 3 40 2 38
  0 1 9 2 52 1 41
  2 1 9 2 52 1 32
  4 1 9 2 52 1 34
  8 1 9 2 52 1 35
  12 1 9 2 52 1 37
  16 1 9 2 52 1 36
  0 1 10 3 47 2 27
  2 1 10 3 47 2 10
  4 1 10 3 47 2 31
  8 1 10 3 47 2 32
  12 1 10 3 47 2 6
  16 1 10 3 47 2 14
  0 1 11 1 57 1 48
  2 1 11 1 57 1 41
  4 1 11 1 57 1 32
  8 1 11 1 57 1 35
  12 1 11 1 57 1 57
  16 1 11 1 57 1 51
  0 1 12 3 47 1 34
  2 1 12 3 47 1 19
  4 1 12 3 47 1 21
  8 1 12 3 47 1 24
  12 1 12 3 47 1 28
  16 1 12 3 47 1 28
  0 2 1 3 70 1 49
  2 2 1 3 70 1 47
  4 2 1 3 70 1 44
  8 2 1 3 70 1 48
  12 2 1 3 70 1 44
  16 2 1 3 70 1 44
  0 2 2 2 49 1 46
  2 2 2 2 49 1 35
  4 2 2 2 49 1 45
  8 2 2 2 49 1 49
  12 2 2 2 49 1 53
  16 2 2 2 49 1 56
  0 2 3 1 59 1 56
  2 2 3 1 59 1 44
  4 2 3 1 59 1 48
  8 2 3 1 59 1 54
  12 2 3 1 59 1 49
  16 2 3 1 59 1 60
  0 2 4 2 64 2 59
  2 2 4 2 64 2 48
  4 2 4 2 64 2 56
  8 2 4 2 64 2 55
  12 2 4 2 64 2 57
  16 2 4 2 64 2 58
  0 2 5 1 45 1 62
  2 2 5 1 45 1 60
  4 2 5 1 45 1 60
  8 2 5 1 45 1 64
  12 2 5 1 45 1 67
  16 2 5 1 45 1 66
  0 2 6 3 66 1 50
  2 2 6 3 66 1 53
  4 2 6 3 66 1 52
  8 2 6 3 66 1 57
  12 2 6 3 66 1 61
  16 2 6 3 66 1 54
  0 2 7 1 49 1 42
  2 2 7 1 49 1 42
  4 2 7 1 49 1 43
  8 2 7 1 49 1 33
  12 2 7 1 49 1 37
  16 2 7 1 49 1 43
  0 2 8 3 54 1 53
  2 2 8 3 54 1 56
  4 2 8 3 54 1 52
  8 2 8 3 54 1 54
  12 2 8 3 54 1 55
  16 2 8 3 54 1 51
  0 2 9 2 47 1 67
  2 2 9 2 47 1 64
;
run;
*variables: week, site, id, treat, age, sex, twstrs;

proc contents data=cdystonia;
run;

data cdystonia;
set cdystonia;
new_id = site*100 + id;
week2 = week;
run;

*Now we will look at the mean by treatment and week;
proc sort data=cdystonia;
by treat week;

proc means mean data=cdystonia noprint;
by treat week;
var twstrs;
output out = MN_cdystonia mean = mn_twstrs;
run;

proc print data=MN_cdystonia;
var treat week mn_twstrs;
run;

*Cross-tabulation of treatment by sex with a chi-square test;
proc freq data = cdystonia;
tables treat*sex/chisq;
run;
