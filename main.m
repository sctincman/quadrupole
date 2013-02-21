[x,y,z] = meshgrid([-2.5:0.2:2.5], [-2.5:0.2:2.5], [-1.5:0.2:1.5]);

Q_thio = [-1.2822, 0.0, 0.0;
     0.0, 3.4629, 0.0;
     0.0, 0.0, -2.1807];

Q_benzo = [2.6959, 0.0, 0.0;
	   0.0, 1.9350, 0.0;
	   0.0, 0.0, -3.8775];

Q = Q_thio;

s = [];
for i=1:length(x(:))
  s = [s, quadrupole([x(:)(i),y(:)(i),z(:)(i)], Q)];
end

iso_value = 0.5;

S = [];
c = [];
X = [];
Y = [];
Z = [];
ms = max(max(s), abs(min(s)));
ms2 = mean(abs(s));
for i=1:length(s)
    if (abs(s(i)) > iso_value)
      scale = abs(s(i)) / ms2;
      cscale = ((1-scale));
      if (cscale < 0)
	 cscale = 0;
      end
      S = [S, scale*30];
      X = [X, x(:)(i)];
      Y = [Y, y(:)(i)];
      Z = [Z, z(:)(i)];
      if (s(i) > 0)
	c = [c; [cscale, cscale, 1]];
      else
	c = [c; [1, cscale, cscale]];
      end
    end
end

scatter3(X(:),Y(:),Z(:),[], c);


