%% siehe weiter unten

include "globals.mzn";

int: end_anzahl_d1 = 1;
int: end_anzahl_d2 = 2;
int: end_anzahl_d3 = 2;

var 0..2: anzahl_verletzungen_m1d1;
var 0..2: anzahl_verletzungen_m1d2;
var 0..2: anzahl_verletzungen_m1d3;
var 0..2: anzahl_verletzungen_m2d1;
var 0..2: anzahl_verletzungen_m2d2;
var 0..2: anzahl_verletzungen_m2d3;
var 0..2: anzahl_verletzungen_m3d1;
var 0..2: anzahl_verletzungen_m3d2;
var 0..2: anzahl_verletzungen_m3d3;
int: verletzungen = 0;

var set of {1, 2, 3}: m1_dienste;
int: m1_id = 1;
var set of {1, 2, 3}: m2_dienste;
int: m2_id = 2;
var set of {1, 2, 3}: m3_dienste;
int: m3_id = 3;

int: dt1_id = 1;

int: zf1 = 1;
int: zf1_start = 0;
int: zf1_stop = 4;
int: zf2 = 2;
int: zf2_start = 5;
int: zf2_stop = 8;

int: d1_typ = 1;
int: d1_id = 1;
int: d1_zf = zf1;

int: d2_typ = 1;
int: d2_id = 2;
int: d2_zf = zf1;

int: d3_typ = 1;
int: d3_id = 3;
int: d3_zf = zf2;

%% Jeder Dienst nur einmal, nicht beachten ;)
constraint let {
    array[1..3] of var int: array1 = [
        bool2int(d1_id in m1_dienste),
	bool2int(d1_id in m2_dienste),
	bool2int(d1_id in m3_dienste)
    ]} in true
    /\ sum(t0 in 1..3)(array1[t0])  == end_anzahl_d1
;

constraint let {
    array[1..3] of var int: array2 = [
        bool2int(d2_id in m1_dienste),
	bool2int(d2_id in m2_dienste),
	bool2int(d2_id in m3_dienste)
    ]} in true
    /\ sum(t0 in 1..3)(array2[t0])  == end_anzahl_d2
;

constraint let {
    array[1..3] of var int: array3 = [
        bool2int(d3_id in m1_dienste),
	bool2int(d3_id in m2_dienste),
	bool2int(d3_id in m3_dienste)
    ]} in true
    /\ sum(t0 in 1..3)(array3[t0])  == end_anzahl_d3
;

%% Ausschliessen von unmöglichen Kombinationen

%% Dienst 1 gesetzt alle Mitarbeiter
constraint
	let {array[1..2] of var int: array4 = [
	        bool2int(d1_id in m1_dienste /\ d2_id in m1_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
	        bool2int(d1_id in m1_dienste /\ d3_id in m1_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
	in sum(t0 in 1..2)(array4[t0]) == anzahl_verletzungen_m1d1
;

constraint
	let {array[1..2] of var int: array5 = [
	        bool2int(d1_id in m2_dienste /\ d2_id in m1_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
	        bool2int(d1_id in m2_dienste /\ d3_id in m1_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
	in sum(t0 in 1..2)(array5[t0]) == anzahl_verletzungen_m2d1
;

constraint
	let {array[1..2] of var int: array6 = [
	        bool2int(d1_id in m3_dienste /\ d2_id in m1_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
	        bool2int(d1_id in m3_dienste /\ d3_id in m1_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
	in sum(t0 in 1..2)(array6[t0]) == anzahl_verletzungen_m3d1
;

%% Dienst 2 gesetzt alle Mitarbeiter
constraint
 	let {array[1..2] of var int: array7 = [
 	        bool2int(d2_id in m1_dienste /\ d1_id in m1_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
 	        bool2int(d2_id in m1_dienste /\ d3_id in m1_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
 	in sum(t0 in 1..2)(array7[t0]) == anzahl_verletzungen_m1d2
;

constraint
	let {array[1..2] of var int: array8 = [
	        bool2int(d2_id in m2_dienste /\ d1_id in m2_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
	        bool2int(d2_id in m2_dienste /\ d3_id in m2_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
	in sum(t0 in 1..2)(array8[t0]) == anzahl_verletzungen_m2d2
;

constraint
	let {array[1..2] of var int: array9 = [
	        bool2int(d2_id in m3_dienste /\ d1_id in m3_dienste /\ not((zf1_start < zf1_start /\ zf1_stop < zf1_start) \/ (zf1_start > zf1_start /\ zf1_stop > zf1_start))),
	        bool2int(d2_id in m3_dienste /\ d3_id in m3_dienste /\ not((zf1_start < zf2_start /\ zf1_stop < zf2_start) \/ (zf1_start > zf2_start /\ zf1_stop > zf2_start)))]}
	in sum(t0 in 1..2)(array9[t0]) == anzahl_verletzungen_m3d2
;

%% Dienst 3 gesetzt alle Mitarbeiter
constraint
    let {array[1..2] of var int: array10 = [
	        bool2int(d3_id in m1_dienste /\ d2_id in m1_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start))),
	        bool2int(d3_id in m1_dienste /\ d3_id in m1_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start)))]}
	in sum(t0 in 1..2)(array10[t0]) == anzahl_verletzungen_m1d3
;

constraint
	let {array[1..2] of var int: array11 = [
	        bool2int(d3_id in m2_dienste /\ d2_id in m2_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start))),
	        bool2int(d3_id in m2_dienste /\ d3_id in m2_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start)))]}
    in sum(t0 in 1..2)(array11[t0]) == anzahl_verletzungen_m2d3
;

constraint
	let {array[1..2] of var int: array12 = [
        bool2int(d3_id in m3_dienste /\ d2_id in m3_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start))),
        bool2int(d3_id in m3_dienste /\ d3_id in m3_dienste /\ not((zf2_start < zf1_start /\ zf2_start < zf1_start) \/ (zf2_start > zf1_start /\ zf2_start > zf1_start)))]}
    in sum(t0 in 1..2)(array12[t0]) == anzahl_verletzungen_m3d3
;

constraint verletzungen == anzahl_verletzungen_m1d1 + anzahl_verletzungen_m2d1 + anzahl_verletzungen_m3d1 + anzahl_verletzungen_m1d2 + anzahl_verletzungen_m2d2 + anzahl_verletzungen_m3d2 + anzahl_verletzungen_m1d3 + anzahl_verletzungen_m2d3 + anzahl_verletzungen_m3d3
;

solve satisfy;

output [ "verletzungen=" , show(verletzungen) , "\n" , "m1_dienste=" , show(m1_dienste) , " "   , "m2_dienste=" , show(m2_dienste) , " ", "m3_dienste=" , show(m3_dienste) , " "  ];

