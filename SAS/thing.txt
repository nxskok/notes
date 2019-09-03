proc print;
proc means;      
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/global.csv";

proc import 
  datafile=myurl 
  dbms=csv
  out=global
  replace;
  getnames=yes;
  
proc print;
proc print data=coffee(obs=15);      
filename myurl 
 url 
 "http://www.utsc.utoronto.ca/~butler/c32/soap.txt";

proc import 
  datafile=myurl 
  dbms=dlm
  out=soap
  replace;
  delimiter=' ';
  getnames=yes;
  
proc print data=soap(obs=10);

proc print;    
proc print data=sports(obs=9);
proc means;    
proc sgplot;
  vbar Sport;
proc sgplot;
  histogram BMI;
proc sgplot;
  vbar Sport / group=Sex groupdisplay=cluster;
proc sgplot;
  vbox BMI / category=Sex;
proc sgplot;
  scatter x=Ht y=Wt;
proc sgplot;
  scatter x=Ht y=Wt;
  reg x=Ht y=Wt;
proc sgplot;
  vbox BMI / group=Sex category=Sport;
proc sgplot;
  scatter x=Ht y=Wt / group=Sex;
proc sgpanel;
  panelby Sport;
  scatter x=Ht y=Wt / group=Sex;
proc means Q1 Q3 Qrange;
  var Wt;
proc means mean stddev;
  var Ht;
  class Sex;
proc means n;
  var BMI;
  class Sport;
proc freq;
  tables Sport;
proc means stddev;
proc print data=jays(obs=6);      
proc ttest h0=29327;
  var attendance;
  proc sgplot;
    vbox attendance / category=daynight;
  proc print;
  proc means;
    class group;
    var score;
  proc sgplot;
    vbox score / category=group;
  proc ttest side=L;
    var score;
    class group;
proc power;
  onesamplemeans
  test=t
  nullmean=10
  mean=8
  stddev=4
  ntotal=15
  power=.;
proc power;
  onesamplemeans
  test=t
  nullmean=10
  mean=8
  stddev=4
  ntotal=.
  power=0.80;
  proc power plotonly;
    onesamplemeans
      test=t
      nullmean=10
      mean=8
      stddev=4
      ntotal=15
      power=.;    
    plot x=n min=15 max=80;
  proc power plotonly;
    onesamplemeans
      test=t
      nullmean=10
      mean=8
      stddev=4
      ntotal=15 34
      power=.;
    plot x=effect min=5 max=10;    
proc means;
  var score;
  class group;
  proc power plotonly;
    twosamplemeans
      test=diff_satt
      sides=1
      meandiff=5 10
      stddev=15
      ntotal=44
      power=.;
    plot x=n min=10 max=300;
  proc power;
  twosamplemeans
    test=diff_satt
    sides=1
    meandiff=5
    groupstddevs=11|17
    groupns=21|23
    power=.;
  proc power;
  twosamplemeans
    test=diff_satt
    sides=1
    meandiff=5
    stddev=15
    groupns=10|34
    power=.;
proc print;
    proc ttest;
      var y;
      class group;
    proc ttest alpha=0.10;
      var y;
      class group;
proc print;    
proc ttest h0=160 sides=U;
  var Time;
proc sgplot;
  histogram Time;
proc univariate location=160;
  var Time;
proc sgplot;
  vbox Time;
proc univariate cipctldf;
  var Time;
proc print;    
proc ttest;
  paired druga*drugb;
proc print;    
  proc ttest h0=0;
    var diff;
  proc univariate noprint;
    qqplot diff;
  proc univariate noprint;
    qqplot diff / normal(mu=est sigma=est);
  proc univariate noprint;
    qqplot diff / normal(mu=-1.65 sigma=1.455);
proc univariate;
  var diff;  
  proc print;
proc npar1way median;
  var score;
  class group;
proc anova;
  class group;
  model density=group;
proc anova;
  class group;
  model density=group;
  means group / tukey;
proc npar1way median;
  var density;
  class group;
proc anova;
  class group;
  model density=group;
  means group / hovtest=levene welch;
proc mixed;
  class group;
  model density=group / ddfm=satterth;
  repeated / group=group;
  lsmeans group / adjust=tukey adjdfe=row;
proc print data=sports(obs=10);    
proc print data=sports2(obs=8);
    proc print data=sports3(obs=8);
proc print data=sports4(obs=7);    
proc print;  
proc print;    
proc print;    
proc print;
  var Sex--RCC;
proc print;
  var Sex--RCC BMI;
proc means;
  where sport="Tennis";
  var BMI;
proc sort data=sports;
  by RCC;
  
proc print;  
  var Sex--RCC;
proc sort data=sports;
  by RCC BMI;
  
proc print;  
  var Sex--RCC BMI;
proc sort data=sports;
  by descending BMI;
  
proc print;  
  var Sex--RCC BMI;
proc sort data=sports;
  by descending Wt;
  
data sports10;
  set sports;
  if _N_<=7;
  keep Sport Wt;
  
proc print;
proc print;      
proc print;    
proc print;    
proc anova;
  class feed;
  model weight=feed;
  means feed / tukey;
proc print data=util(obs=8);    
proc sgplot;
  scatter x=usage y=demand;
proc reg;
  model demand=usage;      
proc transreg;
  model boxcox(demand)=identity(usage);        
proc sgplot;
  scatter x=usage y=rtdemand;
proc reg;
  model rtdemand=usage;
proc import
  datafile='/home/ken/pigs2.txt'
  out=pigs
  dbms=dlm
  replace;
  getnames=yes;
  delimiter=' ';
  
proc print;
proc glm;
  class feed;
  model weight=feed / solution;
proc import
  datafile='/home/ken/crickets2.csv'
  out=crickets
  dbms=csv
  replace;
  getnames=yes;
  
proc print data=crickets(obs=20);
proc glm;
  class species;
  model pulse_rate=temperature species / solution;
proc print;
proc print;
  format date mmddyy8.;
proc print;
  format sasdate yymmdd10.;
proc print;
proc import
  datafile='/home/ken/monthly.csv'
  out=sales1
  dbms=csv
  replace;
  getnames=yes;
  
proc print;  
data sales2;
  set sales1;
  date_text=cat('16 ',month,' ',year);
  real_date=input(date_text,anydtdte20.);
  
proc print;  
  var sales date_text real_date;
  format real_date yymmdd10.;
proc sgplot;
  series x=real_date y=sales / markers;
  format real_date monyy7.;
proc print data=dates;
proc print;  
proc print;  
proc print;    
proc print;    
format thedate yymmdd10. thetime time8. 
  sasdt datetime.;
proc print;          
proc print;    
proc print;      
proc print;    
proc means data='/home/ken/pigs1';      
proc print data=two;      
proc print data='/home/ken/three';
proc sgplot;
  histogram Ht;
  density Ht / type=kernel;
proc sgplot;
  histogram BMI;
  density BMI / type=kernel;
proc sgplot;
  scatter x=Ht y=Wt;
  loess x=Ht y=Wt;
proc means;    
proc sgplot;
  scatter x=wind_velocity y=DC_output;
  loess x=wind_velocity y=DC_output;
proc print;    
proc sgplot;
  series x=age y=a / markers;
  series x=age y=b / markers;
  series x=age y=c / markers;
  series x=age y=d / markers;
  series x=age y=e / markers;
proc sgplot;
  scatter y=mpg x=weight / datalabel=car;
proc sgplot;
  scatter x=weight y=mpg / datalabel=country;
proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;
proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;
proc iml;
  k=2;
  u={2 3 6 5 7};
  ans=k+u;
  print ans;
proc iml;
  u={2 3 6 5 7};
  v={1 8 3 4 2};
  ans=u+v;
  print ans;
proc iml;
  k=2;
  u={2 3 6 5 7};
  ans=k*u;
  print ans;
proc iml;
  A={1 3,2 4};
  B={5 6,7 8};
  print A;
  print B;
proc iml;
  A={1 3,2 4};
  B={5 6,7 8};
  ans1=A+B; 
  print ans1;
  ans2=A*B;
  print ans2;
proc iml;
  use mymatrix;
  read all var {VAR1 VAR2} into M;
  v={1,3};
  ans=M*v;
  print ans;
proc iml;
  A={1 3,2 4};
  w={1,2};
  Ainv=inv(A);
  print Ainv;
  ans=Ainv*w;
  print ans;
proc iml;
  r={1 2 3};
  c={4,5,6};
  print r;
  print c;
proc iml;
  a={1,2,3};
  b={4,5,6};
  ans=t(a)*b;
  print ans;
