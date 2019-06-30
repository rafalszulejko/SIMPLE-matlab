function [msh, L, W] = cyl_in_channel(length, width, center_x, center_y, diameter, elem_size)
    
    if diameter > length | diameter > width | center_x - diameter/2 < 0 | center_x+ diameter/2 > length | center_y - diameter/2 < 0 | center_y + diameter/2 > width
        fprintf("The cylinder intersects with the walls of the channel.\n");
        return;
    end

    L = round(length/elem_size);
    W = round(width/elem_size);
    
    fprintf("Channel size changed to %g x %g from %g x %g(%d x %d elements).\n", L*elem_size, W*elem_size, length, width, L, W);
    
    Cx = round(center_x/elem_size);
    Cy = round(center_y/elem_size);
    d = round(diameter/(2*elem_size))*2;
    
    fprintf("Cylinder diameter and position of center were changed to %g, (%g, %g) from %g, (%g, %g).\n", d*elem_size, Cx*elem_size, Cy*elem_size, diameter, center_x, center_y);
    
    msh = ones(W, L);
    
    msh(Cy - d/2:Cy + d/2 - 1, Cx - d/2:Cx + d/2 - 1) = cyl(d);
    
    msh(1, :) = zeros(1, L);
    msh(:, 1) = zeros(W, 1);
    msh(end, :) = zeros(1, L);
   % msh(:, end) = zeros(W, 1);
end

