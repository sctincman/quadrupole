%R in angstroms, Q in Debye-Angstrom
function vr = Vr(R, Q)
  k =  8.9876e+09;
  sum = 0;
  nR = norm(R);
  if (nR != 0)
    unit_v = R / nR;
    for i=1:3
      for j=1:3
	sum = sum + (Q(i,j) * 3.3356e-40 * unit_v(i) * unit_v(j));
      end
    end
    vr = (k / ((nR*1e-10)^3)) * sum;
  else
    vr = 0;
  end
endfunction


