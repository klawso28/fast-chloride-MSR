set title "cylMCFR radius 19.0, height 100.0, reflector 25.0" 
%______________surface definitions__________________________________
surf 1  cylz  0.0 0.0 19.0  0.0  100.0    % fuel 
surf 2  cylz  0.0 0.0 44.0 -25.0 125.0    % reflector

%______________cell definitions_____________________________________
cell 30  re refl       1 -2       % reflector
cell 80  0  fill re    1 -2 
cell 50  fs fuelsalt  -1          % fuel salt
cell 85  0  fill fs   -1    
cell 99  0  outside    2 

% Fuel salt: 66.66%NaCl + 33.34%UCl3, U enrichment 0.93
mat fuelsalt  -3.16391796 rgb 240 30 30 burn 1 tmp  900.000
 11023.09c  -0.100274788825    %  Na-23
 17035.09c  -0.289847995589    %  Cl-35
 17037.09c  -0.096758222661    %  Cl-37
 92234.09c  -0.004225929437    %  U-234
 92235.09c  -0.476858378996    %  U-235
 92236.09c  -0.002202896269    %  U-236
 92238.09c  -0.029831788223    %  U-238

% MgO reflector
mat refl -3.5 tmp 873.0 rgb 75 75 75
 12024.06c 1.0
 8016.06c 1.0

set mvol fuelsalt 0 226822.98958918  % Fuel salt volume

set pop 550000 240 40  % N pop and criticality cycles
set bc 1  % vacuum
set power 300000.0  % Power, 300 thermal kW

ene ecco 4 nj19
set gcu re fs  % group constant generation in unis fs and re
set nfg ecco
set micro nj20

det default n 
    dn 1 
    0 44 25  % 25 radial bins, 0 to 44
    0 360 1  % 1 angual bin, 0 to 360 deg
    -25 125 75  % 75 axial bin, 0 to 100 
    de ecco

% Data Libraries
set acelib "/opt/JEFF-3.3/sss_jeff33.xsdir"
set declib "/opt/JEFF-3.3/jeff33.dec"
set nfylib "/opt/JEFF-3.3/jeff33.nfy"

% Plots
plot 3 1500 1500
plot 2 1500 1500
