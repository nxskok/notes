
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/global.csv";

proc import
    datafile=myurl
    dbms=dlm
    out=util
    replace;
    delimiter=' ';
    getnames=yes;

proc print data=util(obs=8);    

proc sgplot;
  scatter x=usage y=demand;

proc reg;
  model demand=usage;      

proc transreg;
  model boxcox(demand)=identity(usage);        

data trans;
  set util;
  rtdemand=sqrt(demand);        

proc sgplot;
  scatter x=usage y=rtdemand;

proc reg;
  model rtdemand=usage;
