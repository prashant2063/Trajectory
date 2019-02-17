clear 
clc
close all

m = 0.00971984;                 %Mass of bullet in kg
v = 887;                        %Muzzle Velocity of the bullet in m/s
dia = 0.008;                    %Diameter of the bullet in m
rho = 1.225;                    %Density of air in kg/m^3
c = 0.295;                      %Drag coefficient of bullet
A = 3.14*dia*dia/4;             %Area of bullet head
d =rho*c*A/2;                   %Drag due to air
theta = 0;                      
target = input('Please input the distance of target (in m) : ');
if target <= 2500
    while theta<=45
        clear x;
        clear x1;
        clear y;
        clear y1;
        vx = v*cosd(theta);
        vy = v*sind(theta);
        t=0;
        g = 9.81;
        dt = 0.1;
        x(1)=0;
        x1(1)=0;
        y(1)=1;
        y1(1)=1;
        i=1;
        while min(y1)>=1
            i=i+1;
            t = t + dt;
            x(i) = v*cosd(theta)*t;
            y(i) = v*sind(theta)*t - (g*t^2)/2;

            v1 = sqrt(vx^2 + vy^2);
            ax = -d*v1*vx/m;
            ay = -g - d*v1*vy/m;
            x1(i) = x1(i-1) + vx*dt + (ax*dt^2)/2;
            y1(i) = y1(i-1) + vy*dt + (ay*dt^2)/2;
            vx = vx + ax*dt;
            vy = vy + ay*dt;
        end
        if max(x1) >= target
            X = sprintf('We have to fire at an angle = %f',theta);
            disp(X);
            break;
        end
        theta = theta + 0.1;
    end        
    plot(x,y,'b') ,hold on;
    plot(x1,y1,'r') , hold off;
    daspect([1 1 1]);
    xlabel('Horizontal Distance (m)');    
    ylabel('Vertical Distance (m)');      
    title('Projectile Motion Paths');
else
    display('The target cannot be reached.');
end
    
    
    
    
    
   
    
    
    
    
    

