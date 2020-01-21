function composite_buckling_stress_with_thickness

% 2024 T3 Aluminium Alloy %

E = 30e6;             % Elasticity value %
cy = 50000;           % Compressive Yield %

t = [0.04:0.001:0.1];

Af = 0.06;
for j = 1:length(t)
    a = 20;
    p = Af/t(j);
    bt = p/4;               % flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t(j)/2);         % Here, L = L1, because only one edge free %
    H = bw - t(j);             % Here, H = Total height of Stiffner %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

    % Crippling Stress Calculations

    ratio1 = (bt/t(j));                         % ratio of flange length to thickness %
    ratio2 = (bw/t(j));                         % ratio of web length to thickness %

    % Calculation of Critical Stiffener Crippling Stress - Calculated from Graph %

    % Calculation of crippling stress for flange length (Assuming one free edge) %

    if (ratio1 > 60)
        crip_stress_flange1 = 10000;
    elseif (ratio1 <= 60) && (ratio1 > 55)
        crip_stress_flange1 = 11250;
    elseif (ratio1 <= 55) && (ratio1 > 50)
        crip_stress_flange1 = 13750;
    elseif (ratio1 <= 50) && (ratio1 > 45)
        crip_stress_flange1 = 16250;
    elseif (ratio1 <= 45) && (ratio1 > 40)
        crip_stress_flange1 = 18750;
    elseif (ratio1 <= 40) && (ratio1 > 35)
        crip_stress_flange1 = 22500;
    elseif (ratio1 <= 37.5) && (ratio1 > 35)
        crip_stress_flange1 = 25000;
    elseif (ratio1 <= 35) && (ratio1 > 32.5)
        crip_stress_flange1 = 27500;
    elseif (ratio1 <= 32.5) && (ratio1 > 30)
        crip_stress_flange1 = 29000;
    elseif (ratio1 <= 30) && (ratio1 > 28)
        crip_stress_flange1 = 31000;
    elseif (ratio1 <= 28) && (ratio1 > 26)
        crip_stress_flange1 = 33000;
    elseif (ratio1 <= 26) && (ratio1 > 24)
        crip_stress_flange1 = 35000;
    elseif (ratio1 <= 24) && (ratio1 > 22)
        crip_stress_flange1 = 37000;
    elseif (ratio1 <= 22) && (ratio1 > 20)
        crip_stress_flange1 = 39000;
    elseif (ratio1 <= 20) && (ratio1 > 19)
        crip_stress_flange1 = 41500;
    elseif (ratio1 <= 19) && (ratio1 > 18)
        crip_stress_flange1 = 43500;
    elseif (ratio1 <= 18) && (ratio1 > 17)
        crip_stress_flange1 = 45500;
    elseif (ratio1 <= 17) && (ratio1 > 16)
        crip_stress_flange1 = 47500;
    elseif (ratio1 <= 16) && (ratio1 > 15)
        crip_stress_flange1 = 49500;
    elseif (ratio1 <= 15) && (ratio1 > 14)
        crip_stress_flange1 = 52000;
    elseif (ratio1 <= 14) && (ratio1 > 13)
        crip_stress_flange1 = 56000;
    elseif (ratio1 <= 13) && (ratio1 > 12)
        crip_stress_flange1 = 59000;
    elseif (ratio1 <= 12) && (ratio1 > 11.5)
        crip_stress_flange1 = 63000;
    elseif (ratio1 <= 11.5) && (ratio1 > 11)
        crip_stress_flange1 = 66500;
    elseif (ratio1 <= 11) && (ratio1 > 10.5)
        crip_stress_flange1 = 69000;
    elseif (ratio1 <= 10.5) && (ratio1 > 10)
        crip_stress_flange1 = 72500;
    elseif (ratio1 <= 10) && (ratio1 > 9.5)
        crip_stress_flange1 = 76000;
    elseif (ratio1 <= 9.5)
        crip_stress_flange1 = 80000;
    end

    % Calculation of crippling stress for Web length (Assuming no free edge) %

    if (ratio2 > 100)
        crip_stress_web2 = 10000;
    elseif (ratio2 <= 100) && (ratio2 > 80)
        crip_stress_web2 = 16500;
    elseif (ratio2 <= 80) && (ratio2 > 60)
        crip_stress_web2 = 19000;
    elseif (ratio2 <= 60) && (ratio2 > 58)
        crip_stress_web2 = 21000;
    elseif (ratio2 <= 58) && (ratio2 > 56)
        crip_stress_web2 = 22000;
    elseif (ratio2 <= 56) && (ratio2 > 54)
        crip_stress_web2 = 24000;
    elseif (ratio2 <= 54) && (ratio2 > 52)
        crip_stress_web2 = 27000;   
    elseif (ratio2 <= 52) && (ratio2 > 50)
        crip_stress_web2 = 29500;
    elseif (ratio2 <= 50) && (ratio2 > 48)
        crip_stress_web2 = 32000;
    elseif (ratio2 <= 48) && (ratio2 > 46)
        crip_stress_web2 = 35000;
    elseif (ratio2 <= 46) && (ratio2 > 44)
        crip_stress_web2 = 38500;
    elseif (ratio2 <= 44) && (ratio2 > 42)
        crip_stress_web2 = 43000;
    elseif (ratio2 <= 42) && (ratio2 > 40)
        crip_stress_web2 = 46000;
    elseif (ratio2 <= 40) && (ratio2 > 39)
        crip_stress_web2 = 49000;
    elseif (ratio2 <= 39) && (ratio2 > 38)
        crip_stress_web2 = 52000;    
    elseif (ratio2 <= 38) && (ratio2 > 37)
        crip_stress_web2 = 54500;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 57500;   
    elseif (ratio2 <= 35) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 56000;
    elseif (ratio2 <= 36) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 34) && (ratio2 > 32)
        crip_stress_web2 = 64000;
    elseif (ratio2 <= 32) && (ratio2 > 30)
        crip_stress_web2 = 69000;
    elseif (ratio2 <= 30) && (ratio2 > 28)
        crip_stress_web2 = 73000;
    elseif (ratio2 <= 28) && (ratio2 > 26)
        crip_stress_web2 = 77000;
    elseif (ratio2 <= 26)
        crip_stress_web2 = 80000;
    end

    % Mean Crippling Stress Calculated %
    
    stiffener_crip_stress = (crip_stress_web2 + crip_stress_flange1)/2;

    % Column Buckling Calculations %                    

    I1 = ((L*t(j)^3)/12)+(L*t(j))*((H + t(j))/2)^2;
    I2 = t(j)*(H^3)/12;
    I = 2*I1 + I2;                                      % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress(j) = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress(j) = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
end

plot(t,stiffener_buckling_stress,'o-');
hold all;

Af = 0.07;
for j = 1:length(t)
    a = 20;
    p = Af/t(j);
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

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress(j) = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress(j) = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
end
figure(1);
plot(t,stiffener_buckling_stress,'o-');
hold all;





Af = 0.08;
for j = 1:length(t)
    a = 20;
    p = Af/t(j);
    bt = p/4;               % flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t(j)/2);         % Here, L = L1, because only one edge free %
    H = bw - t(j);             % Here, H = Total height of Stiffner %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

        % Crippling Stress Calculations

    ratio1 = (bt/t(j));                         % ratio of flange length to thickness %
    ratio2 = (bw/t(j));                         % ratio of web length to thickness %

    % Calculation of Critical Stiffener Crippling Stress - Calculated from Graph %

    % Calculation of crippling stress for flange length (Assuming one free edge) %

    if (ratio1 > 60)
        crip_stress_flange1 = 10000;
    elseif (ratio1 <= 60) && (ratio1 > 55)
        crip_stress_flange1 = 11250;
    elseif (ratio1 <= 55) && (ratio1 > 50)
        crip_stress_flange1 = 13750;
    elseif (ratio1 <= 50) && (ratio1 > 45)
        crip_stress_flange1 = 16250;
    elseif (ratio1 <= 45) && (ratio1 > 40)
        crip_stress_flange1 = 18750;
    elseif (ratio1 <= 40) && (ratio1 > 35)
        crip_stress_flange1 = 22500;
    elseif (ratio1 <= 37.5) && (ratio1 > 35)
        crip_stress_flange1 = 25000;
    elseif (ratio1 <= 35) && (ratio1 > 32.5)
        crip_stress_flange1 = 27500;
    elseif (ratio1 <= 32.5) && (ratio1 > 30)
        crip_stress_flange1 = 29000;
    elseif (ratio1 <= 30) && (ratio1 > 28)
        crip_stress_flange1 = 31000;
    elseif (ratio1 <= 28) && (ratio1 > 26)
        crip_stress_flange1 = 33000;
    elseif (ratio1 <= 26) && (ratio1 > 24)
        crip_stress_flange1 = 35000;
    elseif (ratio1 <= 24) && (ratio1 > 22)
        crip_stress_flange1 = 37000;
    elseif (ratio1 <= 22) && (ratio1 > 20)
        crip_stress_flange1 = 39000;
    elseif (ratio1 <= 20) && (ratio1 > 19)
        crip_stress_flange1 = 41500;
    elseif (ratio1 <= 19) && (ratio1 > 18)
        crip_stress_flange1 = 43500;
    elseif (ratio1 <= 18) && (ratio1 > 17)
        crip_stress_flange1 = 45500;
    elseif (ratio1 <= 17) && (ratio1 > 16)
        crip_stress_flange1 = 47500;
    elseif (ratio1 <= 16) && (ratio1 > 15)
        crip_stress_flange1 = 49500;
    elseif (ratio1 <= 15) && (ratio1 > 14)
        crip_stress_flange1 = 52000;
    elseif (ratio1 <= 14) && (ratio1 > 13)
        crip_stress_flange1 = 56000;
    elseif (ratio1 <= 13) && (ratio1 > 12)
        crip_stress_flange1 = 59000;
    elseif (ratio1 <= 12) && (ratio1 > 11.5)
        crip_stress_flange1 = 63000;
    elseif (ratio1 <= 11.5) && (ratio1 > 11)
        crip_stress_flange1 = 66500;
    elseif (ratio1 <= 11) && (ratio1 > 10.5)
        crip_stress_flange1 = 69000;
    elseif (ratio1 <= 10.5) && (ratio1 > 10)
        crip_stress_flange1 = 72500;
    elseif (ratio1 <= 10) && (ratio1 > 9.5)
        crip_stress_flange1 = 76000;
    elseif (ratio1 <= 9.5)
        crip_stress_flange1 = 80000;
    end

    % Calculation of crippling stress for Web length (Assuming no free edge) %

    if (ratio2 > 100)
        crip_stress_web2 = 10000;
    elseif (ratio2 <= 100) && (ratio2 > 80)
        crip_stress_web2 = 16500;
    elseif (ratio2 <= 80) && (ratio2 > 60)
        crip_stress_web2 = 19000;
    elseif (ratio2 <= 60) && (ratio2 > 58)
        crip_stress_web2 = 21000;
    elseif (ratio2 <= 58) && (ratio2 > 56)
        crip_stress_web2 = 22000;
    elseif (ratio2 <= 56) && (ratio2 > 54)
        crip_stress_web2 = 24000;
    elseif (ratio2 <= 54) && (ratio2 > 52)
        crip_stress_web2 = 27000;   
    elseif (ratio2 <= 52) && (ratio2 > 50)
        crip_stress_web2 = 29500;
    elseif (ratio2 <= 50) && (ratio2 > 48)
        crip_stress_web2 = 32000;
    elseif (ratio2 <= 48) && (ratio2 > 46)
        crip_stress_web2 = 35000;
    elseif (ratio2 <= 46) && (ratio2 > 44)
        crip_stress_web2 = 38500;
    elseif (ratio2 <= 44) && (ratio2 > 42)
        crip_stress_web2 = 43000;
    elseif (ratio2 <= 42) && (ratio2 > 40)
        crip_stress_web2 = 46000;
    elseif (ratio2 <= 40) && (ratio2 > 39)
        crip_stress_web2 = 49000;
    elseif (ratio2 <= 39) && (ratio2 > 38)
        crip_stress_web2 = 52000;    
    elseif (ratio2 <= 38) && (ratio2 > 37)
        crip_stress_web2 = 54500;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 57500;   
    elseif (ratio2 <= 35) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 56000;
    elseif (ratio2 <= 36) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 34) && (ratio2 > 32)
        crip_stress_web2 = 64000;
    elseif (ratio2 <= 32) && (ratio2 > 30)
        crip_stress_web2 = 69000;
    elseif (ratio2 <= 30) && (ratio2 > 28)
        crip_stress_web2 = 73000;
    elseif (ratio2 <= 28) && (ratio2 > 26)
        crip_stress_web2 = 77000;
    elseif (ratio2 <= 26)
        crip_stress_web2 = 80000;
    end

    % Mean Crippling Stress Calculated %
    
    stiffener_crip_stress = (crip_stress_web2 + crip_stress_flange1)/2;
    
    % Column Buckling Calculations %                    

    I1 = ((L*t(j)^3)/12)+(L*t(j))*((H + t(j))/2)^2;
    I2 = t(j)*(H^3)/12;
    I = 2*I1 + I2;                                      % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress(j) = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress(j) = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
end

figure(1);
plot(t,stiffener_buckling_stress,'o-');
hold all;

Af = 0.09;
for j = 1:length(t)
    a = 20;
    p = Af/t(j);
    bt = p/4;               % flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t(j)/2);         % Here, L = L1, because only one edge free %
    H = bw - t(j);             % Here, H = Total height of Stiffner %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

        % Crippling Stress Calculations

    ratio1 = (bt/t(j));                         % ratio of flange length to thickness %
    ratio2 = (bw/t(j));                         % ratio of web length to thickness %

    % Calculation of Critical Stiffener Crippling Stress - Calculated from Graph %

    % Calculation of crippling stress for flange length (Assuming one free edge) %

    if (ratio1 > 60)
        crip_stress_flange1 = 10000;
    elseif (ratio1 <= 60) && (ratio1 > 55)
        crip_stress_flange1 = 11250;
    elseif (ratio1 <= 55) && (ratio1 > 50)
        crip_stress_flange1 = 13750;
    elseif (ratio1 <= 50) && (ratio1 > 45)
        crip_stress_flange1 = 16250;
    elseif (ratio1 <= 45) && (ratio1 > 40)
        crip_stress_flange1 = 18750;
    elseif (ratio1 <= 40) && (ratio1 > 35)
        crip_stress_flange1 = 22500;
    elseif (ratio1 <= 37.5) && (ratio1 > 35)
        crip_stress_flange1 = 25000;
    elseif (ratio1 <= 35) && (ratio1 > 32.5)
        crip_stress_flange1 = 27500;
    elseif (ratio1 <= 32.5) && (ratio1 > 30)
        crip_stress_flange1 = 29000;
    elseif (ratio1 <= 30) && (ratio1 > 28)
        crip_stress_flange1 = 31000;
    elseif (ratio1 <= 28) && (ratio1 > 26)
        crip_stress_flange1 = 33000;
    elseif (ratio1 <= 26) && (ratio1 > 24)
        crip_stress_flange1 = 35000;
    elseif (ratio1 <= 24) && (ratio1 > 22)
        crip_stress_flange1 = 37000;
    elseif (ratio1 <= 22) && (ratio1 > 20)
        crip_stress_flange1 = 39000;
    elseif (ratio1 <= 20) && (ratio1 > 19)
        crip_stress_flange1 = 41500;
    elseif (ratio1 <= 19) && (ratio1 > 18)
        crip_stress_flange1 = 43500;
    elseif (ratio1 <= 18) && (ratio1 > 17)
        crip_stress_flange1 = 45500;
    elseif (ratio1 <= 17) && (ratio1 > 16)
        crip_stress_flange1 = 47500;
    elseif (ratio1 <= 16) && (ratio1 > 15)
        crip_stress_flange1 = 49500;
    elseif (ratio1 <= 15) && (ratio1 > 14)
        crip_stress_flange1 = 52000;
    elseif (ratio1 <= 14) && (ratio1 > 13)
        crip_stress_flange1 = 56000;
    elseif (ratio1 <= 13) && (ratio1 > 12)
        crip_stress_flange1 = 59000;
    elseif (ratio1 <= 12) && (ratio1 > 11.5)
        crip_stress_flange1 = 63000;
    elseif (ratio1 <= 11.5) && (ratio1 > 11)
        crip_stress_flange1 = 66500;
    elseif (ratio1 <= 11) && (ratio1 > 10.5)
        crip_stress_flange1 = 69000;
    elseif (ratio1 <= 10.5) && (ratio1 > 10)
        crip_stress_flange1 = 72500;
    elseif (ratio1 <= 10) && (ratio1 > 9.5)
        crip_stress_flange1 = 76000;
    elseif (ratio1 <= 9.5)
        crip_stress_flange1 = 80000;
    end

    % Calculation of crippling stress for Web length (Assuming no free edge) %

    if (ratio2 > 100)
        crip_stress_web2 = 10000;
    elseif (ratio2 <= 100) && (ratio2 > 80)
        crip_stress_web2 = 16500;
    elseif (ratio2 <= 80) && (ratio2 > 60)
        crip_stress_web2 = 19000;
    elseif (ratio2 <= 60) && (ratio2 > 58)
        crip_stress_web2 = 21000;
    elseif (ratio2 <= 58) && (ratio2 > 56)
        crip_stress_web2 = 22000;
    elseif (ratio2 <= 56) && (ratio2 > 54)
        crip_stress_web2 = 24000;
    elseif (ratio2 <= 54) && (ratio2 > 52)
        crip_stress_web2 = 27000;   
    elseif (ratio2 <= 52) && (ratio2 > 50)
        crip_stress_web2 = 29500;
    elseif (ratio2 <= 50) && (ratio2 > 48)
        crip_stress_web2 = 32000;
    elseif (ratio2 <= 48) && (ratio2 > 46)
        crip_stress_web2 = 35000;
    elseif (ratio2 <= 46) && (ratio2 > 44)
        crip_stress_web2 = 38500;
    elseif (ratio2 <= 44) && (ratio2 > 42)
        crip_stress_web2 = 43000;
    elseif (ratio2 <= 42) && (ratio2 > 40)
        crip_stress_web2 = 46000;
    elseif (ratio2 <= 40) && (ratio2 > 39)
        crip_stress_web2 = 49000;
    elseif (ratio2 <= 39) && (ratio2 > 38)
        crip_stress_web2 = 52000;    
    elseif (ratio2 <= 38) && (ratio2 > 37)
        crip_stress_web2 = 54500;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 57500;   
    elseif (ratio2 <= 35) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 56000;
    elseif (ratio2 <= 36) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 34) && (ratio2 > 32)
        crip_stress_web2 = 64000;
    elseif (ratio2 <= 32) && (ratio2 > 30)
        crip_stress_web2 = 69000;
    elseif (ratio2 <= 30) && (ratio2 > 28)
        crip_stress_web2 = 73000;
    elseif (ratio2 <= 28) && (ratio2 > 26)
        crip_stress_web2 = 77000;
    elseif (ratio2 <= 26)
        crip_stress_web2 = 80000;
    end

    % Mean Crippling Stress Calculated %
    
    stiffener_crip_stress = (crip_stress_web2 + crip_stress_flange1)/2;

    % Column Buckling Calculations %                    

    I1 = ((L*t(j)^3)/12)+(L*t(j))*((H + t(j))/2)^2;
    I2 = t(j)*(H^3)/12;
    I = 2*I1 + I2;                                      % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress(j) = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress(j) = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
end

figure(1);
plot(t,stiffener_buckling_stress,'o-');
hold all;

Af = 0.1;
for j = 1:length(t)
    a = 20;
    p = Af/t(j);
    bt = p/4;               % flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t(j)/2);         % Here, L = L1, because only one edge free %
    H = bw - t(j);             % Here, H = Total height of Stiffner %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

    % Crippling Stress Calculations
    % Crippling Stress Calculations

    ratio1 = (bt/t(j));                         % ratio of flange length to thickness %
    ratio2 = (bw/t(j));                         % ratio of web length to thickness %

    % Calculation of Critical Stiffener Crippling Stress - Calculated from Graph %

    % Calculation of crippling stress for flange length (Assuming one free edge) %

    if (ratio1 > 60)
        crip_stress_flange1 = 10000;
    elseif (ratio1 <= 60) && (ratio1 > 55)
        crip_stress_flange1 = 11250;
    elseif (ratio1 <= 55) && (ratio1 > 50)
        crip_stress_flange1 = 13750;
    elseif (ratio1 <= 50) && (ratio1 > 45)
        crip_stress_flange1 = 16250;
    elseif (ratio1 <= 45) && (ratio1 > 40)
        crip_stress_flange1 = 18750;
    elseif (ratio1 <= 40) && (ratio1 > 35)
        crip_stress_flange1 = 22500;
    elseif (ratio1 <= 37.5) && (ratio1 > 35)
        crip_stress_flange1 = 25000;
    elseif (ratio1 <= 35) && (ratio1 > 32.5)
        crip_stress_flange1 = 27500;
    elseif (ratio1 <= 32.5) && (ratio1 > 30)
        crip_stress_flange1 = 29000;
    elseif (ratio1 <= 30) && (ratio1 > 28)
        crip_stress_flange1 = 31000;
    elseif (ratio1 <= 28) && (ratio1 > 26)
        crip_stress_flange1 = 33000;
    elseif (ratio1 <= 26) && (ratio1 > 24)
        crip_stress_flange1 = 35000;
    elseif (ratio1 <= 24) && (ratio1 > 22)
        crip_stress_flange1 = 37000;
    elseif (ratio1 <= 22) && (ratio1 > 20)
        crip_stress_flange1 = 39000;
    elseif (ratio1 <= 20) && (ratio1 > 19)
        crip_stress_flange1 = 41500;
    elseif (ratio1 <= 19) && (ratio1 > 18)
        crip_stress_flange1 = 43500;
    elseif (ratio1 <= 18) && (ratio1 > 17)
        crip_stress_flange1 = 45500;
    elseif (ratio1 <= 17) && (ratio1 > 16)
        crip_stress_flange1 = 47500;
    elseif (ratio1 <= 16) && (ratio1 > 15)
        crip_stress_flange1 = 49500;
    elseif (ratio1 <= 15) && (ratio1 > 14)
        crip_stress_flange1 = 52000;
    elseif (ratio1 <= 14) && (ratio1 > 13)
        crip_stress_flange1 = 56000;
    elseif (ratio1 <= 13) && (ratio1 > 12)
        crip_stress_flange1 = 59000;
    elseif (ratio1 <= 12) && (ratio1 > 11.5)
        crip_stress_flange1 = 63000;
    elseif (ratio1 <= 11.5) && (ratio1 > 11)
        crip_stress_flange1 = 66500;
    elseif (ratio1 <= 11) && (ratio1 > 10.5)
        crip_stress_flange1 = 69000;
    elseif (ratio1 <= 10.5) && (ratio1 > 10)
        crip_stress_flange1 = 72500;
    elseif (ratio1 <= 10) && (ratio1 > 9.5)
        crip_stress_flange1 = 76000;
    elseif (ratio1 <= 9.5)
        crip_stress_flange1 = 80000;
    end

    % Calculation of crippling stress for Web length (Assuming no free edge) %

    if (ratio2 > 100)
        crip_stress_web2 = 10000;
    elseif (ratio2 <= 100) && (ratio2 > 80)
        crip_stress_web2 = 16500;
    elseif (ratio2 <= 80) && (ratio2 > 60)
        crip_stress_web2 = 19000;
    elseif (ratio2 <= 60) && (ratio2 > 58)
        crip_stress_web2 = 21000;
    elseif (ratio2 <= 58) && (ratio2 > 56)
        crip_stress_web2 = 22000;
    elseif (ratio2 <= 56) && (ratio2 > 54)
        crip_stress_web2 = 24000;
    elseif (ratio2 <= 54) && (ratio2 > 52)
        crip_stress_web2 = 27000;   
    elseif (ratio2 <= 52) && (ratio2 > 50)
        crip_stress_web2 = 29500;
    elseif (ratio2 <= 50) && (ratio2 > 48)
        crip_stress_web2 = 32000;
    elseif (ratio2 <= 48) && (ratio2 > 46)
        crip_stress_web2 = 35000;
    elseif (ratio2 <= 46) && (ratio2 > 44)
        crip_stress_web2 = 38500;
    elseif (ratio2 <= 44) && (ratio2 > 42)
        crip_stress_web2 = 43000;
    elseif (ratio2 <= 42) && (ratio2 > 40)
        crip_stress_web2 = 46000;
    elseif (ratio2 <= 40) && (ratio2 > 39)
        crip_stress_web2 = 49000;
    elseif (ratio2 <= 39) && (ratio2 > 38)
        crip_stress_web2 = 52000;    
    elseif (ratio2 <= 38) && (ratio2 > 37)
        crip_stress_web2 = 54500;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 57500;   
    elseif (ratio2 <= 35) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 37) && (ratio2 > 36)
        crip_stress_web2 = 56000;
    elseif (ratio2 <= 36) && (ratio2 > 34)
        crip_stress_web2 = 60000;
    elseif (ratio2 <= 34) && (ratio2 > 32)
        crip_stress_web2 = 64000;
    elseif (ratio2 <= 32) && (ratio2 > 30)
        crip_stress_web2 = 69000;
    elseif (ratio2 <= 30) && (ratio2 > 28)
        crip_stress_web2 = 73000;
    elseif (ratio2 <= 28) && (ratio2 > 26)
        crip_stress_web2 = 77000;
    elseif (ratio2 <= 26)
        crip_stress_web2 = 80000;
    end

    % Mean Crippling Stress Calculated %
    
    stiffener_crip_stress = (crip_stress_web2 + crip_stress_flange1)/2;

    % Column Buckling Calculations %                    

    I1 = ((L*t(j)^3)/12)+(L*t(j))*((H + t(j))/2)^2;
    I2 = t(j)*(H^3)/12;
    I = 2*I1 + I2;                                      % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress(j) = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress(j) = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %
end

figure(1);
plot(t,stiffener_buckling_stress,'o-');
hold all;
xlabel('Stiffener Thickness');
ylabel('Stiffener Buckling Stress');
title('Variation of Buckling Stress with Stiffener Thickness for constant area (COMPOSITE DESIGN)');

legend('Area = 0.06','Area = 0.07','Area = 0.08','Area = 0.09','Area = 0.1');


end