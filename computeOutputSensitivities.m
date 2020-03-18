function s2 = computeOutputSensitivities(a, t, n2)
    % Sm = -2(t - a) * F'M(nm)
    %m is the layer number
    F = zeros(length(n2),length(n2));
    for i = 1:length(n2)
        F(i, i) = dtansig(n2(i), a(i));
    end
    %F is 3x3, n is 3 x 1
	s2 = -2 * F * (t - a);