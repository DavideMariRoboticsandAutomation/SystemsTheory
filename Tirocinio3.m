clc
clear all
close all

%% autovalori immaginari puri
m1_1 = 2;                               %Massa 1
m1_2 = 2;                               %Massa 2
k1 = 1;                                 %Costante elastica della molla
c1 = 0;                                 %Attrito 
A1 = [0 0 1 0 ; 0 0 0 1; -k1/m1_1 k1/m1_1 -c1/m1_1 c1/m1_1; k1/m1_2 -k1/m1_2 c1/m1_2 -c1/m1_2];
B1 = [0 0 1/m1_1 0]';
C1 = [1 0 0 0];
M1 = [0 0 0 1/m1_2]';                      %Matrice del disturbo
syms lam;
pA1 = det(A1-lam*eye(4));
Ad1 = A1';
Bd1 = C1';
Cd1 = B1';
pAd1 = det(Ad1-(lam*eye(4)));

% convergenza lenta s<0
des1_1 = [-1 -0.7 -1.2 -3];                 %Vettore desiderarato
Fdlenta1 = acker(A1',C1',des1_1)
V1_1 = Fdlenta1'
% convergenza veloce s<<0
des1_2 = [-25 -13.5 -15.2 -20];             %Vettore desiderarato
Fdveloce1 = acker(A1',C1',des1_2)
V1_2 = Fdveloce1'
% filtro di Kalman
[Fout1, P1] = lqr(Ad1+0.15*eye(4), Bd1, 500*eye(4),eye(1))  %Q ha dimensione 4 e R ha dimensione 1 (Q grande più rumore)
V1_3 = Fout1'

H1_1 = A1-(V1_1*C1);
H1_2 = A1-(V1_2*C1);
H1_3 = A1-(V1_3*C1);
R1 = B1;

% Matrici reali
A1_R = [0 0 1 0 ; 0 0 0 1; -1.3/1.5 1.3/1.5 -0.8/1.5 0.8/1.5; 1.3/1.2 -1.3/1.2 0.8/1.2 -0.8/1.2];
B1_R = [0 0 1/1.5 0]';
C1_R = [1 0 0 0];
%% autovalori complessi coniugati(modo poco smorzato)
%k > (c^2)(m1+m2)/4 quindi c basso
m1_2 = 2;                                   %Massa 1
m2_2 = 2;                                   %Massa 2
k2 = 2;                                     %Costante elastica della molla
c2 = 1;                                     %Attrito
A2 = [0 0 1 0 ; 0 0 0 1; -k2/m1_2 k2/m1_2 -c2/m1_2 c2/m1_2; k2/m2_2 -k2/m2_2 c2/m2_2 -c2/m2_2];
B2 = [0 0 1/m1_2 0]';
C2 = [1 0 0 0];
M2 = [0 0 0 1/m2_2]';
syms lam;
pA2 = det(A2-lam*eye(4));
Ad2 = A2';
Bd2 = C2';
Cd2 = B2';
pAd2 = det(Ad2-(lam*eye(4)));

% convergenza lenta s<0
des2_1 = [-1 -0.7 -1.2 -3];                 %Vettore desiderarato
Fdlenta2 = acker (A2',C2',des2_1)             %Ackermann
V2_1 = Fdlenta2'
% convergenza veloce s<<0
des2_2 = [-25 -13.5 -15.2 -20];             %Vettore desiderarato
Fdveloce2 = acker (A2',C2',des2_2)            %Ackermann
V2_2 = Fdveloce2'
% filtro di Kalman
[Fout2, P2] = lqr (Ad2, Bd2, eye(4),eye(1))
V2_3 =Fout2'

H2_1 = A2-(V2_1*C2);
H2_2 = A2-(V2_2*C2);
H2_3 = A2-(V2_3*C2);
R2 = B2;

% Matrici reali
A2_R = [0 0 1 0 ; 0 0 0 1; -1.3/1.5 1.3/1.5 -0.8/1.5 0.8/1.5; 1.3/1.2 -1.3/1.2 0.8/1.2 -0.8/1.2];
B2_R = [0 0 1/1.5 0]';
C2_R = [1 0 0 0];

%% autivalori reali e distinti
% k < (c^2)(m1+m2)/4 
m1_3 = 2;                                   %Massa 1
m2_3 = 2;                                   %Massa 2
k3 = 0.4;                                   %Costante elastica della molla
c3 = 1;                                     %Attrito
A3 = [0 0 1 0 ; 0 0 0 1; -k3/m1_3 k3/m1_3 -c3/m1_3 c3/m1_3; k3/m2_3 -k3/m2_3 c3/m2_3 -c3/m2_3];
B3 = [0 0 1/m1_3 0]';
C3 = [1 0 0 0];
M3 = [0 0 0 1/m2_3]';
syms lam;
pA3 = det(A3-lam*eye(4));
Ad3 = A3';
Bd3 = C3';
Cd3 = B3';
pAd3 = det(Ad3-(lam*eye(4)));


% convergenza lenta s<0
des3_1 = [-1 -0.7 -1.2 -3];                 %Vettore desiderarato
Fdlenta3 = acker (A3',C3',des3_1)
V3_1 = Fdlenta3'

% convergenza veloce s<<0
des3_2 = [-25 -13.5 -15.2 -20];             %Vettore desiderarato
Fdveloce3 = acker (A3',C3',des3_2)          %Ackermann
V3_2 = Fdveloce3'

% filtro di Kalman
[Fout3, P3] = lqr (Ad3, Bd3, eye(4),eye(1))
V3_3 = Fout3'

H3_1 = A3-(V3_1*C3);
H3_2 = A3-(V3_2*C3);
H3_3 = A3-(V3_3*C3);
R3 = B3; 

% Matrici reali
A3_R = [0 0 1 0 ; 0 0 0 1; -1.3/1.5 1.3/1.5 -0.8/1.5 0.8/1.5; 1.3/1.2 -1.3/1.2 0.8/1.2 -0.8/1.2];
B3_R = [0 0 1/1.5 0]';
C3_R = [1 0 0 0];


