function newP = latInhibSquare(p)
    % assumes s is not some stupid low number
    s = size(p);
    s = sqrt(s(1));
    square = reshape(p,[s,s]);
    convM = ones(3,3);
    convM(2,2) = 0;
    sub = conv2(square,convM,'same');
    div = ones(s,s);
    div = conv2(div,convM,'same');    
    square = square - (1.0 .* sub) ./ div;
    newP = reshape(square,size(p));
    