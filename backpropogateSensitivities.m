function s_prev = backpropogateSensitivities(W, s, n)
	%Sm = F'm* (nm) * (W2)' * S2'
	F = zeros(length(n), length(n));
    for i = 1:length(n)
        F(i, i) = lsderiv(n(i));
    end
    s_prev = F * (W' *s);