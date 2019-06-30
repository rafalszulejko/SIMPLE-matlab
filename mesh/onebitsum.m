function array = binary_sum(A, B)
    [n, m] = size(A);
    
    array = zeros(n, m);
    
    for i = 1:n
        for j = 1:m
            if A(i, j) + B(i, j) > 0
                array(i, j) =  1;
            end  
        end
    end
end

