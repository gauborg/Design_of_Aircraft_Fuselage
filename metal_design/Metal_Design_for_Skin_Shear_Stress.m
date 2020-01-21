function Metal_Design_for_Skin_Shear_Stress

fprintf('All units in psi,inches and lbs !!!');
% ----------------------- MATERIAL PROPERTIES --------------------------- %

t_skin = [0.032:0.001:0.08];

for k = 1:length(t_skin)
    
    % FOR CONSTANT STIFFENER NUMBER AND STIFFENER DIMENSIONS %
    
    % 2024 T3 Aluminium Alloy %
    Af = 0.066;
    t = 0.05;
    n = 38;
    
    E = 10.6e6;             % Elasticity value %
    cy = 70000;             % Compressive Yield %

    N = (n/2)+1;            % No. of stiffeners on half fuselage section %

    % ------------------ STIFFENER DIMENSION CALCULATIONS ------------------- %

    p = Af/t;
    bt = p/4;               % flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t/2);          % Here, L = L1, because only one edge free %
    H = bw - t;              % Here, H = Total height of Stiffner %

    % -------------- END OF STIFFENER DIMENSION CALCULATIONS ---------------- %

    % ------------------- STIFFENER SPACING CALCULATIONS -------------------- %

    a = 20;                 % Frame Spacing %
    d = 40;                 % Diameter of Fuselage Section %
    A = pi*(d^2)/4;         % Cross-sectional Area of Fuselage %

    angle = 360/n;          % Angle between stiffeners %
    b = pi * d * angle/360;   % Spacing between Stiffener %

    % --------------- END OF STIFFENER SPACING CALCULATIONS ----------------- %

    % -------------- STIFFENER CRITICAL BUCKLING CALCULATIONS --------------- %

    % Crippling Stress Calculations
    ke = 0.342;             % One Edge is free %
    x = (bt + bw)/(2*t);    % (b'/t) calculations %
    stiffener_crip_stress = (ke*(E*cy)^0.5)/(x^0.75);   % Needham's Formula %

    % Column Buckling Calculations %                    

    I1 = ((L*t^3)/12)+(L*t)*((H + t)/2)^2;
    I2 = t*(H^3)/12;
    I = 2*I1 + I2;          % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);% Critical Slenderness Ratio %
    h = (a/ro);                     % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %
    if h<=h1
    stiffener_buckling_stress = stiffener_crip_stress*(1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress = (pi^2*E)/(h^2);
    end

    % ----------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS ----------- %

    % ---------------- SKIN CRITICAL BUCKLING CALCULATIONS ------------------ %

    % Calculation of Critical Skin Shear Buckling Stress %

    ratio = (a/b);

    if ratio > 7.0
        K = 4.825;
    elseif (6.0 <= ratio) && (ratio < 7.0)
        K = 4.875;
    elseif (5.6 <= ratio) && (ratio < 6.0)
        K = 4.90;
    elseif (5.4 <= ratio) && (ratio < 5.6)
        K = 4.91;
    elseif (5.2 <= ratio) && (ratio < 5.4)
        K = 4.935;
    elseif (4.8 <= ratio) && (ratio < 5.2)
        K = 4.95;    
    elseif (4.4 <= ratio) && (ratio < 4.8)
        K = 4.975;
    elseif (4.0 <= ratio) && (ratio < 4.4)
        K = 5.0;
    elseif (3.75 <= ratio) && (ratio < 4.0)
        K = 5.075;    
    elseif (3.5 <= ratio) && (ratio < 3.75)
        K = 5.2;
    elseif (3.0 <= ratio) && (ratio < 3.5)
        K = 5.3;  
    elseif (2.5 <= ratio) && (ratio < 3.0)
        K = 5.5;
    elseif (2.0 <= ratio) && (ratio < 2.5)
        K = 5.75;
    elseif (1.8 <= ratio) && (ratio < 2.0)
        K = 6.0;
    elseif (1.5 <= ratio) && (ratio < 1.8)
        K = 6.5;
    elseif (1.1 <= ratio) && (ratio < 1.5)
        K = 7.8;
    end

    skin_critical_shear_buckle = K*E*(t_skin(k)/b)^2; % Skin Critical Buckling Stress %

    % ------------- END OF SKIN CRITICAL BUCKLING CALCULATIONS -------------- %

    % ------------------- FUSELAGE STRESSES CALCULATIONS -------------------- %

    V = 10000;              % Force Applied %
    M = 500000;             % Bending Moment %
    T = 200000;             % Torque Applied %

    qt = T/(2*A);           % Shear Flow because of Torque %

    q = zeros(N-1,1);       % Total Shear Flows %
    qb = zeros(N-1,1);      % Shear Flows because of bending %
    yAf = zeros(N,1);       % yAf Matrix Created %
    y2Af = zeros(N,1);      % yA2f Matrix Created %
    y = zeros(N,1);         % y co-ordinates matrix%
    sum_yAf = zeros(N-1,1);
    actual_bending_stress = zeros(N,1);  % Bending Stress in Stiffeners %
    actual_shear_stress = zeros(N-1,1);  % Shear Stress in skin section %

    theta = 0;                           % Temporary variable defined %

    for i = 1:N
        y(i) = (d/2)*(sin((90-theta)*pi/180)); % y co-ordinates calculated %
        theta = theta + angle;
        yAf(i) = y(i)*(Af);                  % yAf calculation %
        y2Af(i) = y(i)^2*(Af);               % y2Af calculation %
    end

    I = sum(y2Af);                            % Moment of Inertia %
    sum_yAf(1) = yAf(1);
    for i=2:N-1
        sum_yAf(i) = sum_yAf(i-1) + yAf(i);
    end

    for i = 1:N-1
        qb(i) = V * sum_yAf(i) / I;           % Shear Flow because of bending %
        q(i) = qb(i)+ qt;                     % Total Shear Flow %
        actual_shear_stress(i) = q(i)/t_skin(k); % Shear Stress Calculations %
    end
    actual_shear_stress;
    for i = 1:N
        actual_bending_stress(i)=M*y(i)/(2*I);% Bending Stress Calculations %
    end
    actual_bending_stress;
    % Finding out the Maximum Stresses %

    max_skin_shear_stress(k) = max(actual_shear_stress);
    max_stiffener_bending_stress = max(actual_bending_stress);

    % --------------- END OF FUSELAGE STRESSES CALCULATIONS ----------------- %
    plot(t_skin(k),max_skin_shear_stress(k),'x');
    hold on;
end

figure(1);
title('Variation of Skin Shear Stress with Skin Thickness');
xlabel('Skin Thickness');ylabel('Skin Shear Stress');

end