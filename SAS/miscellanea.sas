
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/many.txt";

proc import
  datafile=myurl
    dbms=dlm out=many replace;
  delimiter=' ';
  getnames=no;

proc print;    

data one;
  set many;
  array x_array VAR1-VAR6;
  do i=1 to 6;
    x=x_array[i];
    output;
  end;
  keep x;

proc print;      

data two;
  set many;
  array xy_array VAR1-VAR6;
  do i=1 to 3;
    x=xy_array[2*i-1];
    y=xy_array[2*i];
    output;
  end;
  keep x y;

proc print;    

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs1.txt";  

libname mydata V9 '/home/ken';

proc import
  datafile=myurl
    dbms=dlm 
    out=mydata.pigs1
    replace;
  delimiter=' ';
  getnames=yes;

proc means data='/home/ken/pigs1';      

proc print data=two;      

libname mydata V9 '/home/ken';    

data mydata.three; /* permanent data set to save in */
  set two; /* this has variables x and y in it */
  z=x+y;

proc print data='/home/ken/three';

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";      

proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;

proc sgplot;
  histogram Ht;
  density Ht / type=kernel;

proc sgplot;
  histogram BMI;
  density BMI / type=kernel;

proc sgplot;
  scatter x=Ht y=Wt;
  loess x=Ht y=Wt;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/windmill.csv";    

proc import
  datafile=myurl
    dbms=csv
    out=windmill
    replace;
  getnames=yes;

proc means;    

proc sgplot;
  scatter x=wind_velocity y=DC_output;
  loess x=wind_velocity y=DC_output;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/oranges.txt";      

proc import
  datafile=myurl
    dbms=dlm
    out=trees
    replace;
  delimiter=' ';
  getnames=yes;

proc print;    

proc sgplot;
  series x=age y=a / markers;
  series x=age y=b / markers;
  series x=age y=c / markers;
  series x=age y=d / markers;
  series x=age y=e / markers;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/cars.csv";      

proc import 
  datafile=myurl
  dbms=csv
  out=cars
  replace;
  getnames=yes;

proc sgplot;
  scatter y=mpg x=weight / datalabel=car;

proc sgplot;
  scatter x=weight y=mpg / datalabel=country;

data cars2;
  set cars;
  if (_n_=4 or _n_=9) then do;
    newtext=car;
  end;

proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;

data cars3;
  set cars;
  if mpg>34 then do;
     newtext=car;
  end;
    

proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;
