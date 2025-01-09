set title "cylMCFR radius 200.0, height 450.0, reflector 50.0" 
%______________surface definitions__________________________________
surf 1  cylz  0.0 0.0 200.0  0.0  450.0      % fuel 
surf 2  cylz  0.0 0.0 250.0 -50.0 500.0    % reflector

%______________cell definitions_____________________________________
cell 30  re refl       1 -2       % radial reflector
cell 80  0  fill re    1 -2 
cell 50  fs fuelsalt  -1          % fuel salt
cell 85  0  fill fs   -1    
cell 99  0  outside    2 

% Fuel salt: 66.66%NaCl + 33.34%UCl3, U enrichment 0.13
mat fuelsalt  -3.16391796 rgb 240 30 30 burn 1 tmp  900.000
 11023.09c  -0.098337444134    %  Na-23
 17035.09c  -0.037401056437    %  Cl-35
 17037.09c  -0.355833072311    %  Cl-37
 92234.09c  -0.000579308373    %  U-234
 92235.09c  -0.065369773818    %  U-235
 92236.09c  -0.000301982386    %  U-236
 92238.09c  -0.442177362542    %  U-238

% Lead reflector
mat refl -10.4 tmp 873.0 rgb 75 75 75
 82204.06c 0.014
 82206.06c 0.241
 82207.06c 0.221
 82208.06c 0.524

set mvol fuelsalt 0 113097335.52923256  % Fuel salt volume

set pop 450000 240 40  % N pop and criticality cycles
set power 1800000000.0  % Power, 1.8 thermal GW
set bc 1  % vacuum

ene anl27 4 nj4
set gcu re fs  % group constant generation in unis fs and re
set nfg anl27
set micro nj20

det default n 
    dn 1 
    0 250 50  % 50 radial bins, 0 to 250
    0 360 1  % 1 angual bin, 0 to 360 deg
    -50 500 50  % 100 axial bin, -50 to 500 
    de anl27

% Data Libraries
set acelib "/opt/JEFF-3.3/sss_jeff33.xsdir"
set declib "/opt/JEFF-3.3/jeff33.dec"
set nfylib "/opt/JEFF-3.3/jeff33.nfy"

% Plots
plot 3 1500 1500
plot 2 1500 1500
