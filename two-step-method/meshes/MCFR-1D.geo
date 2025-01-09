r1 = 200;
r2 = r1+50;
H = 450; 
lc = 4;

Point(1) = {0, 0, 0, lc};   // fuel boottom left  corner (center of core)
Point(2) = {r1, 0, 0, lc};  // fuel bottom  right corner 
Point(3) = {0, H, 0, lc};   // fuel top     left  corner
Point(4) = {r1, H, 0, lc};  // fuel top     right corner

Point(5) = {r2, 0, 0, lc};  // refl bottom  right corner 
Point(6) = {r2, H, 0, lc};  // refl top     right corner 

Line(1) = {1,2};  // fuel bottom
Line(2) = {1,3};  // fuel left
Line(3) = {2,4};  // fuel right  // refl left
Line(4) = {3,4};  // fuel top

Line(5) = {2,5};  // refl bottom
Line(6) = {5,6};  // refl right
Line(7) = {4,6};  // refl top

// fuel
Line Loop(8) = {1,3,-4,-2};
Plane Surface(9) = {8};

// refl
Line Loop(10) = {5,6,-7,-3};
Plane Surface(11) = {10};

// structure 
Transfinite Surface{9};
Transfinite Surface{11};
Recombine Surface{9};
Recombine Surface{11};

refl_surface[] = {11};
refl_bottom[] = {5};
refl_top[] = {7};
outer_wall[] = {6};

fuel_surface[] = {9};
fuel_top[] = {4};
fuel_bottom[] = {1};
fuel_right[] = {3};

Physical Surface("fs") = { fuel_surface[] };
Physical Surface("re") = { refl_surface[] };

Physical Line("fuel_top")    = { fuel_top[]    };
Physical Line("refl_top")    = { refl_top[]    };
Physical Line("fuel_bottom") = { fuel_bottom[] };
Physical Line("refl_bottom") = { refl_bottom[] };
Physical Line("outer_wall")  = { outer_wall[]  };
Physical Line("fuel_bound")  = { fuel_right[]  }; 