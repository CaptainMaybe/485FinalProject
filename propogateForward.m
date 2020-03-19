function [n1, n2, a, a1] = propogateForward(p, W1, W2, b1, b2)
	%a0 = p
	%a1 = logsig(W1*a0 + b1)
	%a2 = logsig(W2*a1 + b2)
	n1 = W1*p + b1;
    a1 = logsig(n1);
    n2 = W2*a1 + b2;
    a = logsig(n2);