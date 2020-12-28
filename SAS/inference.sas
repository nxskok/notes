
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/jays15-home.csv";

proc import
  datafile=myurl
    dbms=csv
    out=jays
    replace;
  getnames=yes;

proc print data=jays(obs=6);      

proc ttest h0=29327;
  var attendance;

  proc sgplot;
    vbox attendance / category=daynight;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/drp.txt";  

proc import
  datafile=myurl
  dbms=dlm
  out=reading
  replace;
  delimiter=' ';
  getnames=yes;

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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/duality.txt";    

proc import
  datafile=myurl
    dbms=dlm
    out=duality
    replace;
  delimiter=' ';
  getnames=yes;

proc print;

    proc ttest;
      var y;
      class group;

    proc ttest alpha=0.10;
      var y;
      class group;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/irs.txt";    

proc import
  datafile=myurl
    dbms=csv
    out=irs
    replace;
  getnames=yes;

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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/analgesic.txt";  

proc import
  datafile=myurl
    dbms=dlm
    out=pain
    replace;
  delimiter=' ';
  getnames=yes;

proc print;    

proc ttest;
  paired druga*drugb;

data pain2;
  set pain;
  diff=druga-drugb;  

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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/drp.txt";    

proc import
  datafile=myurl
  dbms=dlm
  out=reading
  replace;
  delimiter=' ';
  getnames=yes;

  proc print;

proc npar1way median;
  var score;
  class group;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/jumping.txt";  

proc import
  datafile=myurl
    dbms=dlm
    out=rats
    replace;
  delimiter=' ';
  getnames=yes;

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
