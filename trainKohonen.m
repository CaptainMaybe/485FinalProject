function W = trainKohonen(P, T)

train_num = size(P);
train_num = train_num(1);

r = 784;
s = 10;
W = rand(s, r);


for i = 1:train_num
    [,winner] = 
    W = updateKohonen(W, P(), alpha, winner);
end