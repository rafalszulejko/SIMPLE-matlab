function [i, j] = n2ij(n, length, height)
    if(n > length*height)
        error('n too big for the dimensions provided');
    end
    
    i = ceil(n/length);
    j = n - length*floor(n/length);
end