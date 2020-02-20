/*proc iml;
DM 'Clear log';
cov = {50 36 18,
		36 36 0,
		 18 0 72};
b = {2, 2, -1};
c = {1, -1, 3};
d = {1, 0, 1};

var_bx = 0;
var_cx = 0;
cov_bx_cx = 0;

do i = 1 to 3;
	do j = 1 to 3;
		var_bx = var_bx + b[i] * b[j] * cov[i, j];
		var_cx = var_cx + c[i] * c[j] * cov[i, j];
		cov_bx_cx = cov_bx_cx + b[i] * c[j] * cov[i, j];
	end;
end;

*cov_bx_cx1 = 2*cov[1, 1] + 5*cov[1, 3] - 2*cov[2, 2]
+7*cov[2, 3] - 3*cov[3, 3];
corr_bx_cx = cov_bx_cx/(sqrt(var_bx * var_cx));

print var_bx var_cx cov_bx_cx corr_bx_cx;
run;
quit;*/

proc iml;
cov = {50 36 18,
		36 36 0,
		 18 0 72};
b = {2, 2, -1};
c = {1, -1, 3};
d = {1, 0, 1};
A = {2 2 -1
	,1 -1 3};
covax = A*cov*A`;

bb = {2 1 1, 2 -1 0, -1 3 1};

covbbx = bb`*cov*bb;
sigma23 = covbbx[2, 3];

covdb = 0;
do i = 1 to 3;
	do j = 1 to 3;
		covdb = covdb + d[i] * cov[i, j] * b[j];
	end;
end;

print covax covbbx covdb;

quit;
