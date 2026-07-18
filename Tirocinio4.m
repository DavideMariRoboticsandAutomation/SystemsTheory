clc             
clear all       
close all      

%% Definizione parametri di ingresso
M0 = 2;
M1 = 0.5;       
         
M2 = 2;         % Ampiezza del segnale sinusoidale
OM = 1;         % Frequenza del segnale sinusoidale
phase = 1;       

%% Variabili simboliche (tempo e variabile complessa)
syms lam s t;

r1 = M1*t + M0;             %rampa
r2 = M2*sin(OM*t + phase);  % Sinusoide

%% CASO 1: due autovalori immaginari puri quindi c=0
m1 = 3; m2 = 2; k = 1.5; c = 0;  % Parametri del sistema 

A1 = [0 0 1 0;0 0 0 1;-k/m1 k/m1 -c/m1 c/m1;k/m2 -k/m2 c/m2 -c/m2];
B1 = [0 0 1/m1 0]';   
C1 = [1 0 0 0];

disp('Autovalori immaginari puri:')
disp(eig(A1))

% Richiesta 2
poly_ref1 = 1;
gain_ref1 = 1;

Ab = A1; 
Bb = B1; 
Cb = C1;

Ad = Ab';         % Trasposta di A
Bd = Cb';         % Trasposta di C
Cd = Bb';         % Trasposta di B

%Compensatore
[F, ~]  = lqr(Ab, -Bb, 50*eye(4), eye(1)); 
[Fd, ~] = lqr(Ad, Bd, 50*eye(4), eye(1));

% Osservatore
V1 = Fd';        
As1 = Ab - V1*Cb + Bb*F;   % Dinamica osservatore + controllo in anello chiuso
Bs1 = V1;                  % Ingresso osservatore
Cs1 = -F;                  % Uscita 

zero_vec = zeros(size(As1,1),1);  
Ac1 = [As1];
Bc1 = [Bs1];
Cc1 = [Cs1];

%% CASO 2: due autovalori complessi coniugati

m1 = 1; m2 = 3; k = 2; c = 0.5;

A2 = [0 0 1 0;0 0 0 1;-k/m1 k/m1 -c/m1 c/m1;k/m2 -k/m2 c/m2 -c/m2];
B2 = [0 0 1/m1 0]';
C2 = [1 0 0 0];

disp('Autovalori complessi coniugati:')
disp(eig(A2))

% Richiesta 2
poly_ref2 = 1;
gain_ref2 = 1;

Ab2 = A2;
Bb2 = B2;
Cb2 = C2;

Ad = Ab2'; Bd = Cb2'; Cd = Bb2';
[F2, ~] = lqr(Ab2, -Bb2, 50*eye(4), eye(1));
[Fd, ~] = lqr(Ad, Bd, 50*eye(4), eye(1));

% Osservatore
V2 = Fd';
As2 = Ab2 - V2*Cb2 + Bb2*F2;
Bs2 = V2; 
Cs2 = -F2;

% Sistema osservatore
Ac2 = [As2];
Bc2 = [Bs2];
Cc2 = [Cs2];

%% PUNTO 4 del caso 2

poly_ref3 = (s^2 + (OM^2));
gain_ref3 = 1/poly_ref2;

Am = [0 -OM^2;1 0];
Bm = [1 0]';
Cm = [0 1];

zero_mat = zeros(size(Am,1), size(A2,1));
Ab22 = [Am zero_mat;B2*Cm A2];
Bb22 = [Bm' (B2*0)']'; 
Cb22 = [0*Cm C2];

Ad = Ab22'; Bd = Cb22'; Cd = Bb22';
[F3, ~] = lqr(Ab22, -Bb22, 500*eye(size(Ab22,1)), eye(1));
[Fd, ~] = lqr(Ad, Bd, 500*size(Ab22,1), eye(1));

% Autovalori in retroazione
eig(Ab22 + Bb22*F3);

% Osservatore
V22 = Fd';
As22 = Ab22 - V22*Cb22 + Bb22*F3;
Bs22 = V22; Cs22 = -F3;

% Sistema esteso con osservatore
zero_mat = zeros(size(As22,1), size(Am,1));
Ac22 = [As22 zero_mat;Bm*Cs22 Am];
Bc22 = [Bs22' (Bm*0)']';
Cc22 = [Cs22*0 Cm];

%% PUNTO 5
m1 = 1; m2 =3.5;  k =1.5;  c =0.4;
%m1=1; m2=3; k=2; c=0.5; % Parametri ideali

A2r = [0 0 1 0;0 0 0 1;-k/m1 k/m1 -c/m1 c/m1;k/m2 -k/m2 c/m2 -c/m2];
B2r = [0 0 1/m1 0]';
C2r = [1 0 0 0];
