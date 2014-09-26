include "globals.mzn";

%% Definition zweier Konstanten
int: anzahl_1 = 1;
int: anzahl_2 = 1;

%% Vergleich der beiden Konstanten
constraint
	anzahl_1 == anzahl_2
;

solve satisfy;