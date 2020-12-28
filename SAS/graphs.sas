
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";

proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;


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
