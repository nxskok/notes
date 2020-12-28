
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs.txt";

proc import
  datafile=myurl
  out=pigs
  dbms=dlm
  replace;
  getnames=yes;
  delimiter=' ';
  

proc print;

proc glm;
  class feed;
  model weight=feed / solution;

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/crickets2.csv";      

proc import
  datafile=myurl
  out=crickets
  dbms=csv
  replace;
  getnames=yes;
  

proc print data=crickets(obs=20);

proc glm;
  class species;
  model pulse_rate=temperature species / solution;
