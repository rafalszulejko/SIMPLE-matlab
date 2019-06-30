function array = cyl(diameter)
    radius = diameter/2;
    p = 1 - (radius - 1);
    
    x = 0;
    y = radius - 1;
    
    nx = x;
    ny = y;
    
    array = zeros(radius, radius);
    
    while y > x
        x = nx;
        y = ny;
        
        array(x + 1, 1:y + 1) = ones(1, y+1);
        
        if p > 0
           ny = y - 1;
        else
            ny = y;
        end
        
        nx = x + 1;
        
        p = p + 2*(x + 1) + ny^2 - y^2 - ny + y + 1;
    end
    
    array = onebitsum(array, array');
    
    array = [fliplr(flipud(array)), flipud(array); fliplr(array), array];
    
    array = onebitnot(array);
    
end

