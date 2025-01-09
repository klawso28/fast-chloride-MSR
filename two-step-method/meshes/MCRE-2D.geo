r1 = 19; // cm
r2 = r1+25;
H = 100;
H2 = H+25;
ref_bot = -25;
lc = 4;

Point(1) = {0, 0, 0, lc};   // fuel boottom left  corner
Point(2) = {r1, 0, 0, lc};  // fuel bottom  right corner 
Point(3) = {0, H, 0, lc};   // fuel top     left  corner
Point(4) = {r1, H, 0, lc};  // fuel top     right corner

Point(5) = {0, ref_bot, 0, lc};   // refl bottom  left corner 
Point(6) = {0, H2, 0, lc};        // refl top     left corner 
Point(7) = {r2, ref_bot, 0, lc};  // refl bottom  right corner 
Point(8) = {r2, H2, 0, lc};       // refl top     right corner 

Line(1) = {1,2};  // fuel bottom
Line(2) = {1,3};  // fuel left
Line(3) = {2,4};  // fuel right  // refl left
Line(4) = {3,4};  // fuel top

Line(8) = {3,6};  // top refl (left side)
Line(9) = {5,1};  // bot refl (left side)

// fuel
Line Loop(10) = {1,3,-4,-2};
Plane Surface(11) = {10};

// structure fuel
Transfinite Surface{11};
Recombine Surface{11};

Line(5) = {5,7};  // refl bottom
Line(6) = {7,8};  // refl right
Line(7) = {6,8};  // refl top

Line Loop(112) = {-4,8,7,-6,-5,9,1,3};  // whole refl
Plane Surface(113) = {112};
Recombine Surface{113};

refl_surface[] = {113};

refl_bottom[] = {5};
refl_top[] = {7};
outer_wall[] = {6};

RecombineMesh;

fuel_surface[] = {11};
fuel_top[] = {4};
fuel_bottom[] = {1};
fuel_right[] = {3};

Physical Surface("fs") = { fuel_surface[] };
Physical Surface("re") = { refl_surface[] };

Physical Line("fuel_top")    = { fuel_top[] };
Physical Line("refl_top")    = { refl_top[] };
Physical Line("fuel_bottom") = { fuel_bottom[] };
Physical Line("refl_bottom") = { refl_bottom[] };
Physical Line("outer_wall")  = { outer_wall[] }; 
Physical Line("fuel_bound")  = { fuel_right[] }; 