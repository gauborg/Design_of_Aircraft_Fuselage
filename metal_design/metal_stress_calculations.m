
function [stiffener_safety_factor,skin_safety_factor,total_weight] =...
    metal_stress_calculations(Af,t,t_skin,n)

if (t > t_skin)
    
% ------------------------ FUSELAGE BASIC DIMENSIONS ------------------------- %

    a = 20;                 % Frame Spacing %
    d = 40;                 % Diameter of Fuselage Section %
    A = pi*(d^2)/4;         % Cross-sectional Area of Fuselage %

% --------------------- MATERIAL MECHANICAL PROPERTIES ----------------------- %

    % FOR STIFFENER / 2024 T3 Aluminium Alloy %

    density = 0.086;          % Material Density  in lbs/sqrinch %
    E = 11.2e6;             % Elasticity value %
    cy = 53700;             % Compressive Yield %
    
% ------------------ END OF MATERIAL MECHANICAL PROPERTIES ------------------- %

% -------------------- STIFFENER DIMENSION CALCULATIONS ---------------------- %

    N = (n/2)+1;            % No. of stiffeners on half fuselage section %

    p = Af/t;
    bt = p/4;               % mean flange length %
    bw = 2 * bt;            % mean web length %

    L = bt + (t/2);         % Here, L = L1, because only one edge free %
    H = bw - t;             % Here, H = Height of Stiffner %

% ---------------- END OF STIFFENER DIMENSION CALCULATIONS ------------------- %

% --------------------- STIFFENER SPACING CALCULATIONS ----------------------- %

    angle = 360/n;           % Angle between stiffeners %
    b = pi *d * angle/360;   % Spacing between Stiffener %

% ----------------- END OF STIFFENER SPACING CALCULATIONS -------------------- %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

    % Crippling Stress Calculations

    ke = 0.342;                                             % One Edge is free %
    x = (bt + (bw/2))/(2*t);                                    % (b'/t) calculation %
    stiffener_crip_stress = (ke*(E*cy)^0.5)/(x^0.75);    % Needham's Formula %

    % Column Buckling Calculations %                    

    I1 = ((L*t^3)/12)+(L*t)*((H + t)/2)^2;
    I2 = t*(H^3)/12;
    I = 2*I1 + I2;                                      % Area Moment Calculations %

    ro = sqrt(I/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crip_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress = stiffener_crip_stress*...
        (1-(stiffener_crip_stress*((h^2)/(4*pi^2*E))));
    else
    stiffener_buckling_stress = (pi^2*E)/(h^2);
    end

% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %

% ---------------- SKIN CRITICAL BUCKLING STRESS CALCULATIONS ---------------- %

    % Calculation of Critical Skin Shear Buckling Stress %

    ratio = (a/b);

    if ratio >= 6
        K = 4.8;
    elseif ratio > 4 && ratio < 6
        K = 5;
    elseif ratio > 2 && ratio <= 4
        K = -0.5*ratio + 7;
    else
        K = -5*ratio + 16;
    end

    skin_critical_shear_buckle = K*E*(t_skin/b)^2; % Skin Critical Buckling Stress %

% ------------ END OF SKIN CRITICAL BUCKLING STRESS CALCULATIONS ------------- %

% --------------------- FUSELAGE STRESSES CALCULATIONS ----------------------- %

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
        y(i) = (d/2)*(cos(theta*pi/180)); % y co-ordinates calculated %
        theta = theta + angle;
        yAf(i) = y(i)*(Af);                  % yAf calculation %
        y2Af(i) = y(i)^2*(Af);               % y2Af calculation %
    end
    
    yAf(1) = y(1)*Af/2;
    y2Af(1) = (y(1)^2)*Af/2;

    yAf(N) = y(N)*Af/2;
    y2Af(N) = (y(N)^2)*Af/2;

    I = sum(y2Af);                            % Moment of Inertia %
    sum_yAf(1) = yAf(1);
    for i=2:N-1
        sum_yAf(i) = sum_yAf(i-1) + yAf(i);
    end

    for i = 1:N-1
        qb(i) = V * sum_yAf(i) / I;           % Shear Flow because of bending %
        q(i) = qb(i)+ qt;                     % Total Shear Flow %
        actual_shear_stress(i) = q(i)/t_skin; % Shear Stress Calculations %
    end

    for i = 1:N
        actual_bending_stress(i)=M*y(i)/(2*I);% Bending Stress Calculations %
    end

    % Finding out the Maximum Stresses %

    max_skin_shear_stress = max(actual_shear_stress);
    max_stiffener_bending_stress = max(actual_bending_stress);

% ------------------ END OF FUSELAGE STRESSES CALCULATIONS ------------------- %

% ---------------------- CALCUALTION OF SAFETY FACTORS ----------------------- %

    stiffener_safety_factor = stiffener_buckling_stress / max_stiffener_bending_stress;
    skin_safety_factor = skin_critical_shear_buckle / max_skin_shear_stress;

% ------------------- END OF SAFETY FACTORS CALCUALTIONS --------------------- %

% ----------------------- FUSELAGE WEIGHT CALCULATIONS ----------------------- %

    if (stiffener_safety_factor >= 1) && (skin_safety_factor >= 1.0)
        % Skin Weight Calculations %
        V_skin = pi * d * t_skin * a;
        weight_skin = density * V_skin;

        % Stiffner Weight Calculations %
        V_stiffener = Af * a;
        weight_stiffener = V_stiffener * n * density;
        total_weight = weight_skin + weight_stiffener;
    else
        total_weight = NaN;
    end
% ------------------- END OF FUSELAGE WEIGHT CALCULATIONS -------------------- %
else
    total_weight = NaN;
    stiffener_safety_factor = NaN;
    skin_safety_factor = NaN;
    b = NaN;
    max_skin_shear_stress = NaN;
end
end