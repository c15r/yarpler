%% siehe weiter unten

include "globals.mzn";

int: end_anzahl_d1 = 1;
int: end_anzahl_d2 = 1;
int: end_anzahl_d3 = 1;
int: end_anzahl_d4 = 1;
int: end_anzahl_d5 = 1;

var set of {1, 2, 3, 4, 5}: m1_dienste;
int: m1_id = 1;
var set of {1, 2, 3, 4, 5}: m2_dienste;
int: m2_id = 2;
var set of {1, 2, 3, 4, 5}: m3_dienste;
int: m3_id = 3;

int: dt1_id = 1;

set of int: d1_forbidden = {4,5};
set of int: d2_forbidden = {3};
set of int: d3_forbidden = {2};
set of int: d4_forbidden = {1,5};
set of int: d5_forbidden = {1,4};

int: d1_typ = 1;
int: d1_id = 1;

int: d2_typ = 1;
int: d2_id = 2;

int: d3_typ = 1;
int: d3_id = 3;

int: d4_typ = 1;
int: d4_id = 4;

int: d5_typ = 1;
int: d5_id = 5;

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

constraint let {
    array[1..3] of var int: array4 = [
        bool2int(d4_id in m1_dienste),
	bool2int(d4_id in m2_dienste),
	bool2int(d4_id in m3_dienste)
    ]} in true
    /\ sum(t0 in 1..3)(array4[t0])  == end_anzahl_d4
;

constraint let {
    array[1..3] of var int: array5 = [
        bool2int(d5_id in m1_dienste),
	bool2int(d5_id in m2_dienste),
	bool2int(d5_id in m3_dienste)
    ]} in true
    /\ sum(t0 in 1..3)(array5[t0])  == end_anzahl_d5
;

%% Ausschliessen von unmöglichen Kombinationen
%% @Xa: ist es möglich die letzte Anweisung mit subset und diff etwas einfacher zu handeln?
constraint not(d1_id in m1_dienste) \/ (d1_id in m1_dienste /\ m1_dienste subset (m1_dienste diff d1_forbidden));
constraint not(d2_id in m1_dienste) \/ (d2_id in m1_dienste /\ m1_dienste subset (m1_dienste diff d2_forbidden));
constraint not(d3_id in m1_dienste) \/ (d3_id in m1_dienste /\ m1_dienste subset (m1_dienste diff d3_forbidden));
constraint not(d4_id in m1_dienste) \/ (d4_id in m1_dienste /\ m1_dienste subset (m1_dienste diff d4_forbidden));
constraint not(d5_id in m1_dienste) \/ (d5_id in m1_dienste /\ m1_dienste subset (m1_dienste diff d5_forbidden));

constraint not(d1_id in m2_dienste) \/ (d1_id in m2_dienste /\ m2_dienste subset (m2_dienste diff d1_forbidden));
constraint not(d2_id in m2_dienste) \/ (d2_id in m2_dienste /\ m2_dienste subset (m2_dienste diff d2_forbidden));
constraint not(d3_id in m2_dienste) \/ (d3_id in m2_dienste /\ m2_dienste subset (m2_dienste diff d3_forbidden));
constraint not(d4_id in m2_dienste) \/ (d4_id in m2_dienste /\ m2_dienste subset (m2_dienste diff d4_forbidden));
constraint not(d5_id in m2_dienste) \/ (d5_id in m2_dienste /\ m2_dienste subset (m2_dienste diff d5_forbidden));

constraint not(d1_id in m3_dienste) \/ (d1_id in m3_dienste /\ m3_dienste subset (m3_dienste diff d1_forbidden));
constraint not(d2_id in m3_dienste) \/ (d2_id in m3_dienste /\ m3_dienste subset (m3_dienste diff d2_forbidden));
constraint not(d3_id in m3_dienste) \/ (d3_id in m3_dienste /\ m3_dienste subset (m3_dienste diff d3_forbidden));
constraint not(d4_id in m3_dienste) \/ (d4_id in m3_dienste /\ m3_dienste subset (m3_dienste diff d4_forbidden));
constraint not(d5_id in m3_dienste) \/ (d5_id in m3_dienste /\ m3_dienste subset (m3_dienste diff d5_forbidden));

solve satisfy
;

output [ "" , "m1_dienste=" , show(m1_dienste) , " "   , "m2_dienste=" , show(m2_dienste) , " ", "m3_dienste=" , show(m3_dienste) , " "  ];

