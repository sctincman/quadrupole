%R in angstroms, Q in Debye-Angstrom
function Vr = quadrupole(R, Q)
  k =  8.9876e+09;
  sum = 0;
  nR = norm(R);
  if (nR != 0)
    unit_v = R / nR;
    for i=1:3
      for j=1:3
	sum = sum + (Q(i,j) * 3.3356e-30 * 1e-10 * unit_v(i) * unit_v(j));
      end
    end
    Vr = (k / ((norm(R)*1e-10)^3)) * sum;
  else
    Vr = 0;
  end
endfunction


