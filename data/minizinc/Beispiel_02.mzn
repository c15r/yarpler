include "globals.mzn";

%% Dienst definitionen
int: df = 0;
int: d1 = 1;
int: d2 = 2;
int: d3 = 3;


%% Dienstschlüssel über alle Tage für alle Mitarbeiter
int: anzahl_dienst_1 = 1;
int: anzahl_dienst_2 = 1;
int: anzahl_dienst_3 = 1;

%% Mitarbeiter definitionen
int: m1 = 1;
int: m2 = 2;
int: m3 = 3;

%% Mitarbeiter Tage mit möglichen Diensten
var set of {df,d1,d2,d3}: m1t1;
var set of {df,d1,d2,d3}: m1t2;
var set of {df,d1,d2,d3}: m2t1;
var set of {df,d1,d2,d3}: m2t2;
var set of {df,d1,d2,d3}: m3t1;
var set of {df,d1,d2,d3}: m3t2;


%% Kardinalität der Mengen einhalten
constraint card(m1t1) == 1 /\ card(m1t2) == 1 /\ card(m2t1) == 1 /\ card(m2t2) == 1 /\ card(m3t1) == 1 /\ card(m3t2) == 1;

%% Dienstschlüssel einhalten
constraint
	let {array[1..6] of var int: array0 = [bool2int(d1 in m1t1), bool2int(d1 in m1t2), bool2int(d1 in m2t1), bool2int(d1 in m2t2), bool2int(d1 in m3t1), bool2int(d1 in m3t2)]} in sum(t0 in 1..6)(array0[t0]) == anzahl_dienst_1
;
constraint
	let {array[1..6] of var int: array1 = [bool2int(d2 in m1t1), bool2int(d2 in m1t2), bool2int(d2 in m2t1), bool2int(d2 in m2t2), bool2int(d2 in m3t1), bool2int(d2 in m3t2)]} in sum(t0 in 1..6)(array1[t0]) == anzahl_dienst_2
;
constraint
	let {array[1..6] of var int: array2 = [bool2int(d3 in m1t1), bool2int(d3 in m1t2), bool2int(d3 in m2t1), bool2int(d3 in m2t2), bool2int(d3 in m3t1), bool2int(d3 in m3t2)]} in sum(t0 in 1..6)(array2[t0]) == anzahl_dienst_3
;

%% Nach d1 kein d2
constraint not(d1 in m1t1) \/ not(d2 in m1t2);
constraint not(d1 in m2t1) \/ not(d2 in m2t2);
constraint not(d1 in m3t1) \/ not(d2 in m3t2);

solve satisfy;

output [ show(m1t1), ",", show(m1t2), ",", show(m2t1), ",", show(m2t2), ",", show(m3t1), ",",show(m3t2) ] ;
