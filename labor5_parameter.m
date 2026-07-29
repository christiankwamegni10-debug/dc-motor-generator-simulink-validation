%% werte
Ua = 10; %ankerspannung
La = 0.832 * 1e-3; %ankerinduktivitaet in (m)H
Ra = 7.73; %ankerwiderstand in ohm
Km = 43.9 * 1e-3; %maschinenkonstante (drehmomentkonstante) in (m)Nm/A
Phi = 1; %erregung (konstant und normiert)
%Rlast = 0.00632;%widerstand gluehbirne
Rlast = 128.72;
J_motor = 10.5 * 1/1000 * 1/1e4; %in kgm^2 (vorher gcm^2)
%daten schwungmasse
l_stab = 0.04; %laenge stab: 40mm
r_stab = 0.012/2; %duchmesser stab: 12mm
dicke_scheibe = 0.014; %scheibendicke: 14mm
r_scheibegross = 0.0955/2; %grosser durchmesser: 95.5mm
r_scheibeklein = 0.012/2; %kleiner durchmesser: 12mm
v_stab = pi * r_stab^2 * l_stab; %volumen stab
v_scheibe = (pi * r_scheibegross^2 * dicke_scheibe)- (pi * r_scheibeklein^2 * dicke_scheibe); %volumen scheibe
rho_alu = 2.7 * (1/1000) * (1e6/1); %dichte aluminium (kg/m^3),
urspruenglich g/cm^3
m_stab = rho_alu * v_stab; %masse stab (kg)
m_scheibe = rho_alu * v_scheibe; %masse scheibe (kg)
%% berechnung traegheitsmomente
J_stab = 1/2 * m_stab * r_stab^2; %kg*m^2
J_scheibe = 1/2 * m_scheibe * (r_scheibegross^2 + r_scheibeklein^2);
J_schwungmasse = J_stab + J_scheibe;
J_ges = 2*J_motor + J_schwungmasse