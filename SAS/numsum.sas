
data ath;
  set sports;

proc means Q1 Q3 Qrange;
  var Wt;

proc means mean stddev;
  var Ht;
  class Sex;

proc means n;
  var BMI;
  class Sport;

proc freq;
  tables Sport;

proc means stddev;
