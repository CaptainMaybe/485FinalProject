
function t_new = convertT(t_old)
    s = size(t_old);
    t_new = gpuArray(zeros(s(1), 10));
    for i = 1:s
        for j = 0:9
            if j == t_old(i)
                t_new(i, j + 1) = 1;
            end
        end     
    end