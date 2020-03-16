function [W_m, b_m] = updateWeightAndBiases(W, b, s, a, r)
	%Wm(k+1) = Wm(k) - r(sm* aM+1)'
	%bm(k+1) = bm(k) - r(sm)
	%r = learning rate
 	%k = ? iteration?
  W_m = W  - r*(s * a');
  b_m = b -r*s;
  