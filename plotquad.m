%convenience function to plot quadrupole contributions to electric potential
% iso-value is the cutoff for what to plot
function plotquad(Q, iso_value)
  [x,y,z,V] = quadrupole(Q);
  S = [];
  c = [];
  X = [];
  Y = [];
  Z = [];
%  ms = max(max(V(:)), abs(min(V(:))));
  mV = mean(abs(V)(:));
  for i=1:length(V(:))
    if (abs(V(:)(i)) > iso_value)
      scale = abs(V(:)(i)) / mV;
      cscale = ((1-scale));
      if (cscale < 0)
	cscale = 0;
      end
      S = [S, scale*30];
      X = [X, x(:)(i)];
      Y = [Y, y(:)(i)];
      Z = [Z, z(:)(i)];
      if (V(:)(i) > 0)
	c = [c; [cscale, cscale, 1]];
      else
	c = [c; [1, cscale, cscale]];
      end
    end
  end

scatter3(X(:),Y(:),Z(:),[], c);
endfunction
