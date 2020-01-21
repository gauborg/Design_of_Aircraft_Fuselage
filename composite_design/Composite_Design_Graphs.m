function Composite_Design_Graphs

% ------------------------ FUSELAGE BASIC DIMENSIONS ------------------------- %
tic;

Af = [0.076:0.002:0.1];        % Stiffener Cross-section Range %

t = [0.04:0.001:0.054];        % Stiffener Thickness Range %

t_skin = [0.032:0.002:0.05];   % Skin Thickness Range %

n = [20:2:48];                 % Stiffener Number Range %

nc = 0;
for i = 1:length(Af)
    for j = 1:length(t)
        for k = 1:length(t_skin)
            for l = 1:length(n)
                [stiffener_safety_factor(i,j,k,l),skin_safety_factor(i,j,k,l),w(i,j,k,l)]...
                    = composite_stress_calculations(Af(i),t(j),t_skin(k),n(l));
                figure(1);
                plot(Af(i),w(i,j,k,l),'o');
                hold on;
                figure(2);
                plot(t(j),w(i,j,k,l),'o');
                hold on;
                figure(3);
                plot(t_skin(k),w(i,j,k,l),'*');
                hold on;
                figure(4);
                plot(n(l),w(i,j,k,l),'*');
                hold on;
%                 figure(5);
%                 plot(t(j),stiffener_safety_factor(i,j,k,l),'o');   % Stiffener Safety factor with thickness %
%                 hold on;
%                 figure(6);
%                 plot(t_skin(k),skin_safety_factor(i,j,k,l),'o');   % Skin Safety Factor with Skin Thickness %
%                 hold on;
%                 figure(7);
%                 plot(n(l),skin_safety_factor(i,j,k,l),'x');
%                 hold on;
%                   figure(8);
%                   plot(t(j),skin_safety_factor(i,j,k,l),'x');
%                   hold on;

                nc = nc + 1;
            end
        end
    end
end
figure(1);
xlabel('Stiffener Area (sqr. inches)');ylabel('Weight (lbs)');
title('Weight vs Stiffener Area for Composite Design');

figure(2);
xlabel('Stiffener Thickness (inches)');ylabel('Weight (lbs)');
title('Weight vs Stiffener Thickness for Composite Design');

figure(3);
xlabel('Skin Thickness (inches)');ylabel('Weight (lbs)');
title('Weight vs Skin Thickness for Composite Design');

figure(4);
xlabel('No. of Stiffeners');ylabel('Weight (lbs)');
title('Weight vs No. of Stiffeners for Composite Design');

% figure(5);
% xlabel('Stiffener Thickness (inches)');ylabel('Stiffener Safety Factor');
% title('Stiffener Safety Factor vs Stiffener Thickness');
% 
% figure(6);
% xlabel('Skin Thickness (inches)');ylabel('Skin Safety Factor');
% title('Skin Safety Factor vs Skin Thickness');
% 
% figure(7);
% xlabel('No. of Stiffeners');ylabel('Skin Safety Factor');
% title('Skin Safety Factor vs No. of Stiffeners');

% figure(8);
% xlabel('Stiffener Area (sqr. inches)');ylabel('Skin Safety Factor');
% title('Skin Safety Factor vs Stiffener Area');

[optimum_weight,Z] = min(w(:));   % Minimum Weight Calculated %

[I,J,K,L] = ind2sub(size(w),Z);

% ------ FINDING STIFFENER NOs, STIFFENER AREA, STIFFENER THK, SKIN THK ------ %

Optimum_Stiffener_Cross_Section_Area = Af(I)
Optimum_Stiffener_Thickness = t(J)
Optimum_Skin_Thickness = t_skin(K)
Optimum_No_of_Stiffeners = n(L)

optimum_weight


toc;

% ------------ FINDING NO OF STIFFENERS, STIFFENER AREA, SKIN THK ------------ %

end