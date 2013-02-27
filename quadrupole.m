% returns contributions to potential field from quadrupole
% x,y,z are the x,y,z coordinates that map to V,C
% V is the result at each point
function [x, y, z, V] = quadrupole(Q)
  [x,y,z] = meshgrid([-2.5:0.2:2.5], [-2.5:0.2:2.5], [-1.5:0.2:1.5]);

  V = arrayfun(@(x,y,z) Vr([x,y,z], Q), x, y, z);
%  V = [];
%  for i=1:length(x(:))
%    V = [V, quadrupole([x(:)(i),y(:)(i),z(:)(i)], Q)];
%  end
endfunction
