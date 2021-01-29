


close all
clear all

xPos = 0; %xpos
Vx = 0;   %velocity
sumVel =0;    %Sum to calc drift vel

t =0;   %time
F =1;    %Force
m = 1;  %Mass

dt = 1;

nt = 100;

x =0;

a = F/m;

dvx = a*dt;

t = 1:100;

numSims =10;


V = zeros(1,nt);
xPos = zeros(1,nt);
driftVel = zeros(1,nt);

C = {'k','b','r','g','y',[.5 .6 .7],[.8 .2 .6]}; % Cell array of colours.


tao = 1;

for j =1:numSims


for i = 2:nt
    
    
    P = 1 - exp(-(rand()/1));
    
    r = rand();
    
    if r < P
        
        Vx = 0;
        
    end
    
    
    Vx = Vx + dvx;
    
    V(i) = Vx;
    
    sumVel = sumVel + Vx;
    driftVel(i) = sumVel/i;
    
    
    
    dx = Vx*dt;
    
    x = x + dx;
    
    xPos(i) = x;
    
    
    figure(1)
    subplot(3,1,1)
    plot(t(1:i),V(1:i),'color',C{j})
   plot(t(1:i), driftVel(1:i),'color',C{j},'marker','x')
    %plot(t,V)
   % plot(t, driftVel,'rx')
    title(['Drift Veloctiy: ' , num2str(driftVel(i))])
    xlabel('time')
    ylabel('velocity')
    hold on

     subplot(3,1,2)
    plot(xPos(1:i),V(1:i),'color',C{j})
    xlabel('position')
    ylabel('velocity')
    hold on 

   subplot(3,1,3)
   plot(t(1:i),xPos(1:i),'color',C{j})
   hold on 
   xlabel('time')
   ylabel('position')
    pause(.000001)
    
    
end

sumVel=0;
Vx =0;
x =0;

end

