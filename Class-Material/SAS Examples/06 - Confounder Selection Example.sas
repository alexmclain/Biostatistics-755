/*------------------------------------------------------------*
 |  CONFUNDING DEMO (covariance pattern / marginal model)
 |  No random effects. Uses PROC MIXED with REPEATED.
 |
 |  Variables:
 |   id        = subject ID
 |   time      = visit time (0,1,2,3,4)  (treated as CLASS)
 |   y         = outcome
 |   A         = exposure (0/1), baseline
 |   age       = baseline confounder (associated with A and y)
 |   biom      = time-varying covariate affected by prior A (mediator-ish)
 |   z         = precision covariate (baseline-only here)
 *------------------------------------------------------------*/

options nodate nonumber;
title; footnote;

data demo_long;
  call streaminit(20260202);
  do id = 1 to 250;

    /* Baseline confounder */
    age = rand("normal", 50, 10);

    /* Exposure depends on age -> confounding */
    pA = 1/(1+exp(-(-3 + 0.06*age)));   /* older -> more likely exposed */
    A  = rand("bernoulli", pA);

    /* Precision covariate (not a confounder if unrelated to A) */
    z  = rand("normal", 0, 1);

    /* Subject-level latent baseline (induces within-subject correlation) */
    u  = rand("normal", 0, 1.5);

    /* Generate repeated measures */
    biom_prev = 0;
    do t = 0, 1, 2, 3, 4;
      time = t;

      /* biomarker is affected by prior exposure (and prior biomarker) */
      biom = 0.6*biom_prev + 0.8*A + rand("normal", 0, 0.8);

      /* True mean model: outcome depends on time, A, A*time, age, biom */
      /* biom is on pathway from A to y (over-adjustment if included) */
      mu = 20
           + 1.2*time
           + 1.0*A
           + 0.6*A*time
           + 0.08*age
           + 1.0*biom
           + 0.4*z
           + u;

      y = mu + rand("normal", 0, 2.0);

      output;
      biom_prev = biom;
    end;
  end;
  drop t pA mu biom_prev u;
run;

options nodate nonumber;
title; footnote;

%let COVTYPE = cs;      /* assume CS wins in step A */
%let REF_TIME = 4;      /* for extracting a single A*time estimate (edit as needed) */


proc print data = demo_long (obs=20);
run;


title "Spaghetti plots by exposure group with mean trajectories";

/* Step 1: Compute group-specific means at each time */
proc sort data=demo_long;
  by A time;
run;

proc means data=demo_long noprint;
  by A time;
  var y;
  output out=demo_means mean=mean_y;
run;

/* Step 2: Stack individual data and means */
data demo_plot;
  set demo_long demo_means;
run;

/* Step 3: Panel plot with mean overlay */
proc sgpanel data=demo_plot;
  panelby A / columns=2 novarname;
  series x=time y=y / group=id 
         lineattrs=(color=gray pattern=1)
         transparency=0.6;
  series x=time y=mean_y / 
         lineattrs=(color=blue thickness=3);
  colaxis values=(0 1 2 3 4) label="Time";
  rowaxis label="Outcome";
run;



/*============================================================*
 |  A) COVARIANCE SELECTION USING REML (fixed mean model)
 *============================================================*/

title "A) Covariance selection using REML (mean fixed: A + time + A*time)";

/* Fit the same mean model under several covariance structures */
ods exclude all;

/* CS */
ods output FitStatistics=Fit_REML_CS;
proc mixed data=demo_long method=reml;
  class id time A;
  model y = A time A*time / solution ddfm=kr;
  repeated time / subject=id type=cs;
run;

/* AR(1) */
ods output FitStatistics=Fit_REML_AR1;
proc mixed data=demo_long method=reml;
  class id time A;
  model y = A time A*time / solution ddfm=kr;
  repeated time / subject=id type=ar(1);
run;

/* UN */
ods output FitStatistics=Fit_REML_UN;
proc mixed data=demo_long method=reml;
  class id time A;
  model y = A time A*time / solution ddfm=kr;
  repeated time / subject=id type=un;
run;

ods exclude none;

/* Combine fit stats for display */
data Fit_REML_All;
  length cov $12;
  set Fit_REML_CS(in=a) Fit_REML_AR1(in=b) Fit_REML_UN(in=c);
  if a then cov="CS";
  if b then cov="AR(1)";
  if c then cov="UN";
run;

data Fit_REML_All2;
  set Fit_REML_All;
  length stat $20;
  if index(upcase(descr),"-2 RES LOG LIKELIHOOD")>0 then stat="-2ResLL";
  else if index(upcase(descr),"AIC")>0 and index(upcase(descr),"AICC")=0 then stat="AIC";
  else if index(upcase(descr),"BIC")>0 then stat="BIC";
  else delete;
run;

proc sort data=Fit_REML_All2;
  by cov stat;
run;

proc transpose data=Fit_REML_All2 out=Fit_REML_Wide(drop=_name_);
  by cov;
  id stat;
  var value;
run;

proc print data=Fit_REML_Wide noobs;
  title "REML fit statistics (wide format)";
run;



/*============================================================*
 |  B) CONFOUNDER SELECTION USING ML (cov fixed to CS)
 |     - Use ML because fixed effects differ across models.
 |     - Demonstrate change-in-estimate on one A*time term.
 |     - Also show LRT/AIC/BIC if you want.
 *============================================================*/

title "Baseline covariate comparisons by exposure group (time = 0)";

/* Age */
proc ttest data=demo_long(where=(time=0));
  class A;
  var age  z biom;
run;

title;
/*------------------------------------------------------------*
 |  Model 0: Base model (no covariates)
 |  Mean: y = A + time + A*time
 |  Covariance: CS
 |  Method: ML (since we'll compare fixed effects across models)
 *------------------------------------------------------------*/
title2 "Model 0: Base (A + time + A*time)";
proc mixed data=demo_long method=ml;
  class id;
  model y = A time A*time / solution;
  repeated / subject=id type=cs;

  /* Exposure effect at time=0: beta_A */
  estimate "Effect of A at time=0" A 1;

  /* Exposure effect at time=4: beta_A + 4*beta_{A*time} */
  estimate "Effect of A at time=4" A 1 A*time 4;
run;


/*------------------------------------------------------------*
 |  Model 1: Add baseline confounder AGE (linear)
 *------------------------------------------------------------*/
title2 "Model 1: + age (baseline confounder)";
proc mixed data=demo_long method=ml;
  class id;
  model y = A time A*time age / solution;
  repeated / subject=id type=cs;

  estimate "Effect of A at time=0" A 1;
  estimate "Effect of A at time=4" A 1 A*time 4;
run;


/*------------------------------------------------------------*
 |  Model 2: Add precision variable Z (not confounder if unrelated to A)
 *------------------------------------------------------------*/
title2 "Model 2: + age + z (precision covariate)";
proc mixed data=demo_long method=ml;
  class id;
  model y = A time A*time age z / solution;
  repeated / subject=id type=cs;

  estimate "Effect of A at time=0" A 1;
  estimate "Effect of A at time=4" A 1 A*time 4;
run;


/*------------------------------------------------------------*
 |  Model 3: Add time-varying biomarker (possible mediator / over-adjustment)
 |  Use this to SHOW attenuation and discuss why we might exclude it
 |  if the goal is the total effect of A.
 *------------------------------------------------------------*/
title2 "Model 3: + age + z + biom (potential over-adjustment)";
proc mixed data=demo_long method=ml;
  class id;
  model y = A time A*time age z biom / solution;
  repeated / subject=id type=cs;

  estimate "Effect of A at time=0" A 1;
  estimate "Effect of A at time=4" A 1 A*time 4;
run;

title2;




/* Create subject-specific baseline biomarker biom0 (value at time=0) */
proc sort data=demo_long;
  by id time;
run;

data demo_with_biom0;
  set demo_long;
  by id;
  retain biom0;
  if first.id then biom0 = .;
  if time = 0 then biom0 = biom;   /* store baseline biomarker */
  /* carry biom0 forward to later rows for the same subject */
run;

/* Fill biom0 down within each id (in case time=0 isn't first, or missing) */
proc sort data=demo_with_biom0;
  by id time;
run;

data demo_with_biom0;
  set demo_with_biom0;
  by id;
  retain biom0_hold;
  if first.id then biom0_hold = biom0;
  else if missing(biom0_hold) and not missing(biom0) then biom0_hold = biom0;
  else if not missing(biom0) then biom0_hold = biom0;
  biom0 = biom0_hold;
  drop biom0_hold;
run;


proc print data = demo_with_biom0 (obs=20);
run;

/* Fit model: baseline biomarker adjusted, but NOT time-varying biom */
title "Final Model: adjust for baseline biomarker biom0 (not time-varying biom)";
proc mixed data=demo_with_biom0;
  class id;
  model y = A time A*time age z biom0 / solution;
  repeated / subject=id type=cs;

  /* Optional: exposure effect at time=0 and time=4 */
  estimate "Effect of A at time=0" A 1;
  estimate "Effect of A at time=4" A 1 A*time 4;
run;
title;



