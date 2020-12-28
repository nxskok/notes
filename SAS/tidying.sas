
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";

proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;


proc print data=sports(obs=10);    

data sports2;
  set sports;
  keep Sport Sex Ht Wt;

proc print data=sports2(obs=8);

data sports3;
  set sports;
  drop RCC--LBM;

    proc print data=sports3(obs=8);

data sports4;
  set sports;
  Wt_lb=Wt*2.2;
  keep Sport Wt Wt_lb;

proc print data=sports4(obs=7);    

data sports5;
  set sports;
  if _N_>=16 and _N_<=25;

proc print;  

data sports6;
  set sports;
  if _N_ in (10, 13, 17, 42);

proc print;    

data sports7;
  set sports;
  if Sport="Tennis";

proc print;    

data sports8;
  set sports;
  if Sport="Tennis" and RCC<5;

proc print;
  var Sex--RCC;

data sports9;
  set sports;
  if Sport="Tennis" or RCC>5;

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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs1.txt";      

proc import 
  datafile=myurl
  dbms=dlm out=pigs replace;
  delimiter=' ';
  getnames=yes;

proc print;      

data pigs2;
  set pigs;
  feed='feed1';
  weight=feed1;
  output;
  feed='feed2';
  weight=feed2;
  output;
  feed='feed3';
  weight=feed3;
  output;
  feed='feed4';
  weight=feed4;
  output;
  keep feed weight;

proc print;    

data pigs3;
  set pigs;
  array feed_array [4] feed1-feed4;
  do i=1 to 4;
    weight=feed_array[i];
    feed=vname(feed_array[i]);
    output;
  end;
  keep pig feed weight;

proc print;    

proc anova;
  class feed;
  model weight=feed;
  means feed / tukey;
