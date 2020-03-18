function s_prev = backpropogateSensitivities(W, s, n, a)
	%Sm = F'm* (nm) * (W2)' * S2'
	F = zeros(length(n), length(n));
    for i = 1:length(n)
        F(i, i) = dtansig(n(i), a(i));
    end
    s_prev = F * (W' *s);