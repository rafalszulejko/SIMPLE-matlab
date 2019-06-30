function inverted = onebitnot(array)
    [m, n] = size(array);
    
    inverted = ones(m, n);
    
    for i = 1:m
        for j = 1:n
            if array(i, j) == 1
                inverted(i, j) = 0;
            end
        end
    end

end

