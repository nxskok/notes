
%data groups;
%  infile '/folders/myfolders/three.txt';
%  input group $ y;

%proc print;  

%proc means;
%  class group;
%  var y;    

%proc sgplot;
%  vbox y / category=group;

%data x;
%  infile '/folders/myfolders/x.dat' expandtabs;
%  input a b c;  

%proc print;

%data stuff;
%  infile '/folders/myfolders/small.csv' dlm=',';
%  input foo blah ding;  

%proc print;
