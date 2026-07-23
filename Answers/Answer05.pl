car(toyota, model(corolla), engine(1600), color(blue, white, yellow)).
car(honda, model(civic), engine(1800), color(red)).
car(nissan, model(altima), engine(2000), color(black, grey)).

?- car(Brand, _, _, color(C1, C2, C3)), (C1=blue; C2=blue; C3=blue).

?- car(Brand, _, _, color(C1, C2, C3)), (C1=blue; C2=blue; C3=blue).

?- car(toyota, _, engine(Capacity), _).

