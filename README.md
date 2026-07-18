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
