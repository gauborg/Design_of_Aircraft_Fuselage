function Metal_Design_Graphs

% ------------------------ FUSELAGE BASIC DIMENSIONS ------------------------- %
tic;

Af = [0.08:0.002:0.1];        % Stiffener Cross-section Range %

t = [0.04:0.001:0.054];

t_skin = [0.032:0.002:0.05];   % Skin Thickness Range %

n = [22:2:54];                 % Stiffener Number Range %

nc = 0;
for i = 1:length(Af)
    for j = 1:length(t)
        for k = 1:length(t_skin)
            for l = 1:length(n)
                [stiffener_safety_factor(i,j,k,l),skin_safety_factor(i,j,k,l),w(i,j,k,l)]...
                    = metal_stress_calculations(Af(i),t(j),t_skin(k),n(l));
%                 figure(1);
%                 plot(Af(i),w(i,j,k,l),'o');            % Skin Area with total weight %
%                 hold on;
%                 figure(2);
%                 plot(t(j),w(i,j,k,l),'o');             % Stiffener Thickness with total weight %
%                 hold on;
%                 figure(3);
%                 plot(t_skin(k),w(i,j,k,l),'*');        % Skin Thickness with total weight %
%                 hold on;
%                 figure(4);
%                 plot(n(l),w(i,j,k,l),'*');             % No of stiffeners with total weight %
%                 hold on;
%                 figure(5);
%                 plot3(t(j),t_skin(k),w(i,j,k,l),'x');  % 3D Plot %
%                 hold on;
%                 figure(6);
%                 plot(t(j),stiffener_safety_factor(i,j,k,l),'o');   % Stiffener Safety factor with thickness %
%                 hold on;
%                 figure(7);
%                 plot(t_skin(k),skin_safety_factor(i,j,k,l),'o');   % Skin Safety Factor with Skin Thickness %
%                 hold on;
%                 figure(1);
%                 plot(t(j),skin_safety_factor(i,j,k,l),'x');
%                 hold on;

                nc = nc + 1;
            end
        end
    end
end
% figure(1);
% xlabel('Stiffener Area (inches)');ylabel('Weight (lbs)');
% title('Weight vs Stiffener Area');
% 
% figure(2);
% xlabel('Stiffener Thickness (inches)');ylabel('Weight (lbs)');
% title('Weight vs Stiffener Thickness');
% 
% figure(3);
% xlabel('Skin Thickness (inches)');ylabel('Weight (lbs)');
% title('Weight vs Skin Thickness');
% 
% figure(4);
% xlabel('No. of Stiffeners');ylabel('Weight (lbs)');
% title('Weight vs No. of Stiffeners');

% figure(5);
% xlabel('Stiffener Thickness');ylabel('Skin Thickness');zlabel('Weight');
% 
% figure(6);
% xlabel('Stiffener Thickness (inch)');ylabel('Stiffener Safety Factor');
% title('Stiffener Safety Factor vs Stiffener Thickness');
% 
% figure(7);
% xlabel('Skin Thickness (inch)');ylabel('Skin Safety Factor');
% title('Skin Safety Factor vs Skin Thickness');

figure(1);
xlabel('Stiffener Thickness (inch)');ylabel('Skin Safety Factor');
title('Skin Safety Factor vs No. of Stiffeners');


[optimum_weight,Z] = min(w(:))   % Minimum Weight Calculated %

[I,J,K,L] = ind2sub(size(w),Z);

% ------------ FINDING NO OF STIFFENERS, STIFFENER AREA, SKIN THK ------------ %

Optimum_Stiffener_Cross_Section_Area = Af(I)
Optimum_Stiffener_Thickness = t(J)
Optimum_Skin_Thickness = t_skin(K)
Optimum_No_of_Stiffeners = n(L)

toc;

end