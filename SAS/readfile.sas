
proc import 
  datafile='/home/ken/test1.csv'
  dbms=csv
  out=mydata
  replace;
  getnames=yes;

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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/coffee.txt";      

proc import 
  datafile=myurl
  dbms=dlm
  out=coffee
  replace;
  delimiter=' ';
  getnames=yes;

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


proc import 
  datafile='/home/ken/test2.xlsx'
  dbms=xlsx
  out=mydata
  replace;
  sheet=data;
  getnames=yes;

proc print;    
