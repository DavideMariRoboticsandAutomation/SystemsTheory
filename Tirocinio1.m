clc
close all
clear all
%% PUNTO 1
A = [1 0; 0 -1]; %Matrice di stato 
B = [1 1]';      %Vettore colonna d'ingresso
xf = [1 1]';    %Stato da raggiungere
v = 4;           %Passi di controllo
x0 = [0 0]';     %Stato iniziale
Pv = [];         %Inizializzazione di P in v passi
P = [];          %Matrice di raggiungibilità "classica"

for i=0:(v-1)              %Da 0 a 3
        Pv = [Pv A^i*B];   %concatenazione colonna per colonna
end

[righe colonne] = size(Pv); %Formazione di Pv

for i=0:righe               %Le righe sono 2 quindi i va da 0 a 2
        P = [P A^i*B];      %Si genera B, AB (2 colonne)
end

if rank(P) ~= righe         %Se il rango di P è diverso da 2 allora il sistema non è raggiungibile
        error('non raggiungibile');
end

%% Andamento J

G = Pv * Pv';     %Gramiana
Beta = inv(G)*xf; %Lambda = G alla meno 1 per xf
W = Pv'* Beta;    %Sequenza rovesciata degli ingressi ottimi
J = W'*W ;        %Costo minimo J (∑ u(k)^2)

%% PUNTO 2
figure(1);
hold on
grid on

for v = 2:1:20            %Prova "arrivi"
    Pv = [];              %Inizializzo di nuovo Pv
    for i = 0:(v-1)       %Costruisco Pv di dimensione 2xv
        Pv = [Pv A^i*B];
    end
    G = Pv * Pv';
    Beta = inv(G)*xf; 
    W = Pv'* Beta;
    J = W'*W;                          %Costo minimo per quel punto di arrivo
    v;                                 %Per vedere a quale passo ho quel valore
    plot (v, J, 'm-o', 'LineWidth',2); %Vedo un passo alla volta
end

xlabel('v')
ylabel('J')
title('Andamento del costo minimo J in funzione del numero di passi v', 'Color','b')
legend ('J(v)');
hold off

%% PUNTO 3
figure(2)
hold on
grid on

leg_str = {};                       %Vettore di stringe con l'angolo di ogni xf che poi passa tutto a legend
angles = [0, pi/4, pi/3, 2*pi/3];

for angle = angles
    O = [];                         %Vettore che memorizza J per tutti i passi
    xf = [sin(angle) cos(angle)]';  %Nuovo punto finale sulla circonferenza
    for v = 2:1:20
        Pv = [];
        for i = 0:(v-1)             %Costruzione di Pv
            Pv = [Pv A^i*B];
            
        end
    G = Pv * Pv';
    Beta = inv(G)*xf; 
    W = Pv'* Beta;
    J = W'*W;
    v  ; 
    O=[O J];                          %Aggiungo il nuovo costo al vettore
    
    end
    plot (2:20, O, '-o', 'Color', rand(1,3));                     %Metto 2:20 perchè altrimenti parte da 1
    leg_str{end+1} = sprintf ('\\theta = %.0f°', rad2deg(angle)); %Rad2deg evita i conti manuali
end

xlabel('v');
ylabel('J');
title ('Costo minimo al variare di v per diversi x_f');
legend (leg_str, 'Location', 'northeast');
hold off

%% Punto 4

figure(3)
hold on
grid on
axis equal

xf=[1 1]';
v=4;
Pv = [];                    %Ricostruisco Pv
P = [];

for i=0:(v-1)
        Pv = [Pv A^i*B];
end

G = Pv * Pv';
Beta = inv(G)*xf; 
W = Pv'* Beta;               %[u(v-1);...;u(0)]
J = W'*W ;

u = flipud(W);               %Ribalto la matrice per avere u(0)...u(v-1)

x = x0;                      %Stato corrente
X1 = x(1);
X2 = x(2);                   %Servono per il plot alla fine

for i = 1:v
    x = A*x +B*u(i);
    X1 = [X1 x(1)];
    X2 = [X2 x(2)];
end

plot (X1,X2, '-o','LineWidth',2)          %Traiettoria
plot(xf(1), xf(2), 'r*','MarkerSize', 8); %Opzionale: Punto finale
legend({'Traiettoria','x_f'}, 'Location','best');
title ('Traiettoria ottima nello spazio degli stati');
hold off

figure(4); %per visualizzare anche u(k)
stem(0:v-1, u , 'filled');
xlabel('k');
ylabel('u(k)');
grid on
title ('Sequenza di controllo ottima');
legend ({'u(k)'}, 'Location', 'best');
