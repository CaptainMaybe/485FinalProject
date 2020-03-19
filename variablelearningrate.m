if old_e > 0 && e > old_e * percent
    w1 = wo1;
    w2 = wo2;
    b1 = bo1;
    b2 = bo2;
    if lr < 2
        lr = lr .* dlr;
    end
else
    if e < old_e
        lr = lr .*  ulr;
    end
    if lr < 0.00001
        lr = lt;
    end
    old_e = e;
end