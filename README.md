Sono lieto di presentare un progetto completo di Teoria dei Sistemi, realizzato durante i miei studi di Ingegneria Informatica presso l'Università di Tor Vergata.
Questo progetto si avvale ampiamente di MATLAB e Simulink per esplorare concetti avanzati di controllo automatico, stima di stato e controllo ottimale, strutturati in tre esercitazioni principali (Tirocinio 1, 3 e 4).
La prima parte del progetto si concentra sui sistemi a tempo discreto.
Utilizzando MATLAB, ho sviluppato algoritmi per calcolare la sequenza di controllo ottimale in grado di portare un sistema a uno stato target minimizzando rigorosamente il costo energetico.
Il nucleo del progetto, tuttavia, ruota attorno a un modello fisico a tempo continuo: due carrelli interagenti collegati da una molla e un ammortizzatore. Per questo sistema, ho inizialmente progettato diversi osservatori di stato asintotici – nello specifico, un osservatore lento, un osservatore veloce e un filtro di Kalman ottimale – per stimare con precisione la dinamica interna del sistema utilizzando solo misurazioni parziali.
Ho testato a fondo questi osservatori con disturbi esterni simulati e rumore di misura per valutarne l'affidabilità.
Successivamente, ho progettato compensatori dinamici a retroazione di uscita per garantire la stabilità asintotica del sistema e costringerlo a seguire con precisione traiettorie di riferimento complesse, come rampe e onde sinusoidali.
Un aspetto cruciale di questa fase è stata la simulazione di scenari realistici per verificare la robustezza dei sistemi di controllo in presenza di variazioni e incertezze dei parametri.
All'interno di questo repository, troverete una serie altamente strutturata di script MATLAB e modelli Simulink.
I file .m gestiscono i calcoli numerici più complessi, come la risoluzione di matrici di Gramian per il controllo ottimale e il calcolo dei guadagni di retroazione e dell'osservatore utilizzando le tecniche LQR e di posizionamento dei poli (Acker).
I file Simulink .slx contengono i diagrammi a blocchi utilizzati per simulare la dinamica a ciclo chiuso, completi di interruttori manuali per l'iniezione di rumore e oscilloscopi per visualizzare il tracciamento dello stato e gli errori di stima. In allegato, troverete anche il report PDF completo che illustra in dettaglio il quadro teorico, le derivazioni matematiche e i risultati delle simulazioni.
Grazie per l'attenzione.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
I am pleased to present a comprehensive project in Systems Theory,completed during my Computer Engineering studies at the University of Tor Vergata.
This project extensively utilizes MATLAB and Simulink to explore advanced concepts in automatic controls, state estimation, and optimal control, structured across three main assignments (Tirocinio 1, 3, and 4). 
The first part of the project focuses on discrete-time systems. 
Using MATLAB, I developed algorithms to calculate the optimal control sequence capable of driving a system to a target state while strictly minimizing the energetic cost. 
The core of the project, however, revolves around a continuous-time physical model: two interacting carts connected by a spring and a damper. For this system, I initially designed multiple asymptotic state observers—specifically, a slow observer, a fast observer, and an optimal Kalman filter—to accurately estimate the system's internal dynamics using only partial measurements. 
I thoroughly tested these observers against simulated external disturbances and measurement noise to evaluate their reliability.  
Subsequently, I designed dynamic output feedback compensators to ensure the asymptotic stability of the system and force it to precisely track complex reference trajectories, such as ramps and sinusoidal waves.
A critical aspect of this phase was simulating realistic scenarios to verify the robustness of the control systems under parameter variations and uncertainties.  
Inside this repository, you will find a highly structured set of MATLAB scripts and Simulink models.
The .m files handle the heavy numerical computations, such as solving Gramian matrices for optimal control, and calculating feedback and observer gains using LQR and pole placement (acker) techniques. 
The .slx Simulink files contain the block diagrams used to simulate the closed-loop dynamics, complete with manual switches for noise injection and scopes to visualize state tracking and estimation errors. Attached, you will also find the complete PDF report detailing the theoretical framework, mathematical derivations, and simulation results. 
Thank you for your attention.   
