
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

filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/m.txt";

proc import
  datafile=myurl
    dbms=dlm
    out=mymatrix
    replace;
  delimiter=' ';
  getnames=no; 

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
