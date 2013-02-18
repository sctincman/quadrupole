ticks = [-.0:0.1:2.0];
[x,y,z] = meshgrid(ticks, ticks, ticks);

% Q for thiophene
Q_thio = [-1.2822, 0.0, 0.0;
     0.0, 3.4629, 0.0;
     0.0, 0.0, -2.1807];

[x,y,z] = meshgrid([-2.5:0.2:2.5], [-2.5:0.2:2.5], [-1.5:0.2:1.5]);

Q_benzo = [2.6959, 0.0, 0.0;
	   0.0, 1.9350, 0.0;
	   0.0, 0.0, -3.8775];

Q = Q_benzo;

s = [];
for i=1:length(x(:))
  s = [s, quadrupole([x(:)(i),y(:)(i),z(:)(i)], Q)];
end

S = [];
c = [];
ms = max(max(s), abs(min(s)));
for i=1:length(s)
    S = [S, abs(s(i))*(15/ms)];
    if (s(i) > 0)
      c = [c; 43 + (21*(s(i)/ms))];
    else
      c = [c; 21 + (21*(s(i)/ms))];
    end
end

clf;
scatter3(x(:),y(:),z(:),[], c);
colormap('jet');

