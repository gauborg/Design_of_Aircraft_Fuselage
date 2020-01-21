function [total_weight] = composite_design(Af,t,t_skin,n)

if (t > t_skin)

% ------------------------ FUSELAGE BASIC DIMENSIONS ------------------------- %

    a = 20;                 % Frame Spacing %
    d = 40;                 % Diameter of Fuselage Section %
    A = pi*(d^2)/4;         % Cross-sectional Area of Fuselage %

% --------------------- MATERIAL MECHANICAL PROPERTIES ----------------------- %
    
    E = 30e6;                      % Elasticity Longitudinal Modulus E1 value %
    density = 0.05704;            % Material Density in lbs/sqrinch %
    
% ------------------ END OF MATERIAL MECHANICAL PROPERTIES ------------------- %

% -------------------- STIFFENER DIMENSION CALCULATIONS ---------------------- %

    N = (n/2)+1;                  % No. of stiffeners on half fuselage section %

    p = Af/t;
    bt = p/4                 % flange length %
    bw = 2 * bt              % mean web length %

    L = bt + (t/2)           % Here, L = L1, because only one edge free %
    H = bw - t               % Here, H = Total height of Stiffner %

% ---------------- END OF STIFFENER DIMENSION CALCULATIONS ------------------- %

% --------------------- STIFFENER SPACING CALCULATIONS ----------------------- %

    angle = 360/n;            % Angle between stiffeners %
    b = pi * d / n            % Spacing between Stiffener %

% ----------------- END OF STIFFENER SPACING CALCULATIONS -------------------- %

% --------------- STIFFENER CRITICAL BUCKLING CALCULATIONS ------------------- %

    % Crippling Stress Calculations

    ratio1 = (bt/t);                       % ratio of flange length to thickness %
    ratio2 = (bw/t);                       % ratio of web length to thickness %

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
    
    stiffener_crippling_stress = (crip_stress_web2 + crip_stress_flange1)/2;

    % Column Buckling Calculations %

    I1 = ((L*t^3)/12)+(L*t)*((H + t)/2)^2;
    I2 = t*(H^3)/12;
    I_stiff = 2*I1 + I2;                                         % Area Moment Calculations %

    ro = sqrt(I_stiff/Af);

    h1 = sqrt(2)*pi*sqrt(E/stiffener_crippling_stress);    % Critical Slenderness Ratio %
    h = (a/ro);                         % Slenderness Ratio for current dimensions %

    % Calculation of Critical Stiffener Buckling Stress %

    if h<=h1
    stiffener_buckling_stress = stiffener_crippling_stress*...
        (1-(stiffener_crippling_stress*((h^2)/(4*pi^2*E))))
    else
    stiffener_buckling_stress = (pi^2*E)/(h^2)
    end
    
% ------------- END OF STIFFENER CRITICAL BUCKLING CALCULATIONS -------------- %

% ---------------- SKIN CRITICAL BUCKLING STRESS CALCULATIONS ---------------- %

    % Calculation of Critical Skin Shear Buckling Stress %

    ratio = (a/b);

    if ratio<=1
        K = 8.2e7
    elseif ratio >1 && ratio <5
        K = (9.2-ratio)*1e7
    else
        K = 4.2e7
    end
    t_skin
    b
    K

    skin_critical_shear_buckle = K*(t_skin/b)^2 % Skin Critical Buckling Stress %

% ------------ END OF SKIN CRITICAL BUCKLING STRESS CALCULATIONS ------------- %

% --------------------- FUSELAGE STRESSES CALCULATIONS ----------------------- %

    V = 10000;              % Force Applied %
    M = -500000;             % Bending Moment %
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
    y
    yAf
    y2Af
    sum_yAf
    actual_shear_stress
    actual_bending_stress
    qb
    qt
    q

    % Finding out the Maximum Stresses %

    max_skin_shear_stress = max(actual_shear_stress);
    max_stiffener_bending_stress = max(actual_bending_stress);

% ------------------ END OF FUSELAGE STRESSES CALCULATIONS ------------------- %

% ---------------------- CALCUALTION OF SAFETY FACTORS ----------------------- %

    stiffener_safety_factor = stiffener_buckling_stress / max_stiffener_bending_stress
    skin_safety_factor = skin_critical_shear_buckle / max_skin_shear_stress

% ------------------- END OF SAFETY FACTORS CALCUALTIONS --------------------- %

% ----------------------- FUSELAGE WEIGHT CALCULATIONS ----------------------- %

    if (stiffener_safety_factor >= 1) && (skin_safety_factor >= 1)
        % Skin Weight Calculations %
        V_skin = pi * d * t_skin * a;
        weight_skin = density * V_skin

        % Stiffner Weight Calculations %
        V_stiffener = Af * a;
        weight_stiffener = V_stiffener * n * density
        total_weight = weight_skin + weight_stiffener;
    else
        total_weight = NaN;
    end
else
    total_weight = NaN;
    stiffener_safety_factor = NaN;
    skin_safety_factor = NaN;
end

% ------------------- END OF FUSELAGE WEIGHT CALCULATIONS -------------------- %

end