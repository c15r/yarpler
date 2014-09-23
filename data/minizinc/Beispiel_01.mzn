include "globals.mzn";

%% Dienst definitionen
int: id_dienst_frei = 0;
int: id_dienst_1 = 1;
int: id_dienst_2 = 2;

%% Dienstschlüssel über 5 Tage für alle Mitarbeiter
int: anzahl_dienst_1 = 3;
int: anzahl_dienst_2 = 7;

%% Mitarbeiter Tage mit möglichen Diensten
var 0..2: m0t0;
var 0..2: m0t1;
var 0..2: m0t2;
var 0..2: m0t3;
var 0..2: m0t4;
var 0..2: m1t0;
var 0..2: m1t1;
var 0..2: m1t2;
var 0..2: m1t3;
var 0..2: m1t4;

%% Nach D1 darf kein D2 kommen
constraint 
 (m0t0!=id_dienst_1 \/ m0t1!=id_dienst_2) /\
 (m0t1!=id_dienst_1 \/ m0t2!=id_dienst_2) /\
 (m0t2!=id_dienst_1 \/ m0t3!=id_dienst_2) /\
 (m0t3!=id_dienst_1 \/ m0t4!=id_dienst_2) /\
                                       
 (m1t0!=id_dienst_1 \/ m1t1!=id_dienst_2) /\
 (m1t1!=id_dienst_1 \/ m1t2!=id_dienst_2) /\
 (m1t2!=id_dienst_1 \/ m1t3!=id_dienst_2) /\
 (m1t3!=id_dienst_1 \/ m1t4!=id_dienst_2)
;

%% Erzwinge Verteilung
constraint global_cardinality([m0t0, m0t1, m0t2, m0t3, m0t4, m1t0, m1t1, m1t2, m1t3, m1t4],[id_dienst_1, id_dienst_2],[anzahl_dienst_1,anzahl_dienst_2]);

solve satisfy;

output [ "Mitarbeiter 0 = ", show(m0t0), ",", show(m0t1), ",", show(m0t2), ",", show(m0t3), ",", show(m0t4), "\nMitarbeiter 1 = ", show(m1t0), ",", show(m1t1), ",", show(m1t2), ",", show(m1t3), ",", show(m1t4), "\n" ] ;
