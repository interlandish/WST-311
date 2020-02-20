proc import datafile = "C:\Users\Ma Diamond\Documents\University\Third Year\First Semester\WST 311\Practicals\Practical 1\CFCS.csv"
dbms = dlm
out = wst
replace;
delimiter = "09"x;
run;

data v;
set wst;
array old_var {12} Q1-Q12;
do i = 1 to 12;
	if old_var{i} = 0 then delete;
	if old_var{i} = . then delete;
end;

if accuracy < 60 |accuracy = . then delete;
if age > 87 | missing(age) then delete;
if missing(country) then delete;
if missing(gender) then delete;
if ~(gender ^= 1 | gender ^= 2) then delete;
drop i;
run;
proc means data = v NMISS N; run;


