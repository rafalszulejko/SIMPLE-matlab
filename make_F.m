function F = make_F(u, v, mask, dx, dy, mu)
    [length, height] = size(mask);
    
    n = length*height;
    
    F = zeros(n, n);
    
    for a = 2:n-1
        [i, j] = n2ij(a, length, height);
        
        F(a, a-1) = - mu/(dx^2) - mu/(dy^2);
        
        F(a, a) = (u(ij2n(i, j+1)) - u(ij2n(i, j-1)))/dx + (v(ij2n(i+1, j)) - v(ij2n(i-1, j)))/dy + 2*mu/(dx^2) + 2*mu/(dy^2);
        
        F(a, a+1) = - mu/(dx^2) - mu/(dy^2); 
    end
end

