
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/mydates.csv";

proc import
  datafile=myurl
    dbms=csv
    out=dates
    replace;
  getnames=yes;

proc print;

proc print;
  format date mmddyy8.;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pieces.txt";

proc import
  datafile=myurl
    dbms=dlm
    out=pieces
    replace;
  delimiter=' ';
  getnames=yes;
  

data makedates;
  set pieces;
  sasdate=mdy(month,day,year);

proc print;
  format sasdate yymmdd10.;

proc print;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/monthly.csv";

proc import
  datafile=myurl
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

data moredates;
  set dates;
  d=day(date);
  m=month(date);
  y=year(date);

proc print;  

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/dt.csv";  

proc import
  datafile=myurl
    dbms=csv
    out=dt
    replace;
  getnames=yes;

proc print;  

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/manypieces.txt";      

proc import
  datafile=myurl
    dbms=dlm
    out=many
    replace;
  delimiter=' ';
  getnames=yes;

data dtm;
  set many;
  thedate=mdy(month,day,year);
  sasdt=dhms(thedate,hour,minute,second); 
  keep thedate hour minute second sasdt;      

proc print;    

proc print;    
format thedate yymmdd10. thetime time8. 
  sasdt datetime.;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/hospital.csv";  

proc import
  datafile=myurl
    dbms=csv
    out=stays
    replace;
  getnames=yes;

data hospitalstay;
  set stays;
  stay=(discharge-admit)/60/60/24;

proc print;          
