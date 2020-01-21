function Stiffener_Dimension_Graphs

% 2024 T3 Aluminium Alloy %

E = 10.6e6;             % Elasticity value %
cy = 50000;             % Compressive Yield %

Af = [0.06:0.001:0.1];
t = [0.04:0.001:0.06];

for i = 1:length(Af)
    for j = 1:length(t)
        
        a = 20;
        p = Af(i)/t(j);
        bt = p/4;               % flange length %
        bw = 2 * bt;            % mean web length %

        L = bt + (t(j)/2);         % Here, L = L1, because only one edge free %
        H = bw - t(j);             % Here, H = Total height of Stiffner %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

        % Crippling Stress Calculations

        ke = 0.342;                                             % One Edge is free %
        x = (bt + bw)/(2*t(j));                                    % (b'/t) calculation %
        stiffener_crip_stress = (ke*(E*cy)^0.5)/(x^0.75);       % Needham's Formula %

        % Column Buckling Calculations %                    

        I1 = ((L*t(j)^3)/12)+(L*t(j))*((H + t(j))/2)^2;
        I2 = t(j)*(H^3)/12;
        I = 2*I1 + I2;                                      % Area Moment Calculations %

        ro = sqrt(I/Af(i));

        h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
        h = (a/ro);                         % Slenderness Ratio for current dimensions %

        % Calculation of Critical Stiffener Buckling Stress %

        if h<=h1
        stiffener_buckling_stress(i,j) = stiffener_crip_stress*...
            (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
        else
        stiffener_buckling_stress(i,j) = (pi^2*E)/(h^2);
        end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
        plot3(t(j),Af(i),stiffener_buckling_stress(i,j),'o');
        hold on;
        
    end
end
figure(1);
xlabel('Stiffener Area (sqr. inches)');ylabel('Stiffener Thickness (inches)');
zlabel('Stiffener Critical Buckling Stress (psi)');
title('Critical Buckling Stress vs Stiffener Thickness and Stiffener Area');
