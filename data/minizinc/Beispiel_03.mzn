include "globals.mzn";

%% Dienst definitionen
int: dtf = 0;
int: dt1 = 1;
int: dt2 = 2;

%% Dienstschlüssel über alle Tage für alle Mitarbeiter
int: anzahl_dt1 = 2;
int: anzahl_dt2 = 2;

%% Mitarbeiter definitionen
int: m1 = 1;
int: m2 = 2;
int: m3 = 3;

int: d1 = 1;
int: d2 = 2;
int: d3 = 3;
int: d4 = 4;
int: df = 0;

int: d1_typ = dt1;
int: d2_typ = dt1;
int: d3_typ = dt2;
int: d4_typ = dt2;
int: df_typ = dtf;

%% Mitarbeiter Tage mit möglichen Diensten
var set of {df,d1,d2,d3,d4}: m1t1;
var set of {df,d1,d2,d3,d4}: m1t2;
var set of {df,d1,d2,d3,d4}: m2t1;
var set of {df,d1,d2,d3,d4}: m2t2;
var set of {df,d1,d2,d3,d4}: m3t1;
var set of {df,d1,d2,d3,d4}: m3t2;

%% Kardinalität der Mengen einhalten
constraint card(m1t1) == 1 /\ card(m1t2) == 1 /\ card(m2t1) == 1 /\ card(m2t2) == 1 /\ card(m3t1) == 1 /\ card(m3t2) == 1;

%% Dienstschlüssel einhalten
constraint
	let {array[1..24] of var int: array0 = [bool2int(d1 in m1t1 /\ d1_typ == dt1),
	                                       bool2int(d1 in m1t2 /\ d1_typ == dt1),
	                                       bool2int(d1 in m2t1 /\ d1_typ == dt1),
	                                       bool2int(d1 in m2t2 /\ d1_typ == dt1),
	                                       bool2int(d1 in m3t1 /\ d1_typ == dt1),
	                                       bool2int(d1 in m3t2 /\ d1_typ == dt1),
                                           bool2int(d2 in m1t1 /\ d2_typ == dt1),
	                                       bool2int(d2 in m1t2 /\ d2_typ == dt1),
	                                       bool2int(d2 in m2t1 /\ d2_typ == dt1),
	                                       bool2int(d2 in m2t2 /\ d2_typ == dt1),
	                                       bool2int(d2 in m3t1 /\ d2_typ == dt1),
	                                       bool2int(d2 in m3t2 /\ d2_typ == dt1),
                                           bool2int(d3 in m1t1 /\ d3_typ == dt1),
	                                       bool2int(d3 in m1t2 /\ d3_typ == dt1),
	                                       bool2int(d3 in m2t1 /\ d3_typ == dt1),
	                                       bool2int(d3 in m2t2 /\ d3_typ == dt1),
	                                       bool2int(d3 in m3t1 /\ d3_typ == dt1),
	                                       bool2int(d3 in m3t2 /\ d3_typ == dt1),
                                           bool2int(d4 in m1t1 /\ d4_typ == dt1),
	                                       bool2int(d4 in m1t2 /\ d4_typ == dt1),
	                                       bool2int(d4 in m2t1 /\ d4_typ == dt1),
	                                       bool2int(d4 in m2t2 /\ d4_typ == dt1),
	                                       bool2int(d4 in m3t1 /\ d4_typ == dt1),
	                                       bool2int(d4 in m3t2 /\ d4_typ == dt1)
	                                       ]} in sum(t0 in 1..24)(array0[t0]) == anzahl_dt1
;

constraint
	let {array[1..24] of var int: array1 = [bool2int(d1 in m1t1 /\ d1_typ == dt2),
	                                       bool2int(d1 in m1t2 /\ d1_typ == dt2),
	                                       bool2int(d1 in m2t1 /\ d1_typ == dt2),
	                                       bool2int(d1 in m2t2 /\ d1_typ == dt2),
	                                       bool2int(d1 in m3t1 /\ d1_typ == dt2),
	                                       bool2int(d1 in m3t2 /\ d1_typ == dt2),
                                           bool2int(d2 in m1t1 /\ d2_typ == dt2),
	                                       bool2int(d2 in m1t2 /\ d2_typ == dt2),
	                                       bool2int(d2 in m2t1 /\ d2_typ == dt2),
	                                       bool2int(d2 in m2t2 /\ d2_typ == dt2),
	                                       bool2int(d2 in m3t1 /\ d2_typ == dt2),
	                                       bool2int(d2 in m3t2 /\ d2_typ == dt2),
                                           bool2int(d3 in m1t1 /\ d3_typ == dt2),
	                                       bool2int(d3 in m1t2 /\ d3_typ == dt2),
	                                       bool2int(d3 in m2t1 /\ d3_typ == dt2),
	                                       bool2int(d3 in m2t2 /\ d3_typ == dt2),
	                                       bool2int(d3 in m3t1 /\ d3_typ == dt2),
	                                       bool2int(d3 in m3t2 /\ d3_typ == dt2),
                                           bool2int(d4 in m1t1 /\ d4_typ == dt2),
	                                       bool2int(d4 in m1t2 /\ d4_typ == dt2),
	                                       bool2int(d4 in m2t1 /\ d4_typ == dt2),
	                                       bool2int(d4 in m2t2 /\ d4_typ == dt2),
	                                       bool2int(d4 in m3t1 /\ d4_typ == dt2),
	                                       bool2int(d4 in m3t2 /\ d4_typ == dt2)
	                                       ]} in sum(t0 in 1..24)(array1[t0]) == anzahl_dt2
;

%% Dienstkardinalität
constraint
	let {array[1..6] of var int: array2 = [bool2int(d1 in m1t1),
	                                       bool2int(d1 in m1t2),
	                                       bool2int(d1 in m2t1),
	                                       bool2int(d1 in m2t2),
	                                       bool2int(d1 in m3t1),
	                                       bool2int(d1 in m3t2),
	                                       ]} in sum(t0 in 1..6)(array2[t0]) <= 1
;

constraint
	let {array[1..6] of var int: array3 = [bool2int(d2 in m1t1),
	                                       bool2int(d2 in m1t2),
	                                       bool2int(d2 in m2t1),
	                                       bool2int(d2 in m2t2),
	                                       bool2int(d2 in m3t1),
	                                       bool2int(d2 in m3t2),
	                                       ]} in sum(t0 in 1..6)(array3[t0]) <= 1
;

constraint
	let {array[1..6] of var int: array4 = [bool2int(d3 in m1t1),
	                                       bool2int(d3 in m1t2),
	                                       bool2int(d3 in m2t1),
	                                       bool2int(d3 in m2t2),
	                                       bool2int(d3 in m3t1),
	                                       bool2int(d3 in m3t2),
	                                       ]} in sum(t0 in 1..6)(array4[t0]) <= 1
;

constraint
	let {array[1..6] of var int: array5 = [bool2int(d4 in m1t1),
	                                       bool2int(d4 in m1t2),
	                                       bool2int(d4 in m2t1),
	                                       bool2int(d4 in m2t2),
	                                       bool2int(d4 in m3t1),
	                                       bool2int(d4 in m3t2),
	                                       ]} in sum(t0 in 1..6)(array5[t0]) <= 1
;

solve satisfy;

output [  show(m1t1), ",", show(m1t2), ",", show(m2t1), ",", show(m2t2), ",", show(m3t1), ",",show(m3t2) ] ;
