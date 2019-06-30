function [u, v, p] = solve(mask, u0, v0, p0, dx, dy, rho, mu, conv, max_iterations)

    u = u0;
    v = v0;
    p = p0;
    
    
    while true
        F = make_F(u, v, mask);
        u_star = linsolve(F, f_x);
        v_star = linsolve(F, f_y);

        u_old = u;
        v_old = v;

        p_star = linsolve (-B * D \ B', -B* [u_star; v_star]);

        V = [u_star; v_star] - D \ B' * p_star;

        u = V(1:length(V)/2);
        v = V(length(V)/2 + 1:end);

        p = p_star;

        apply_bc(u, v, mask);

        u_res = max(abs(u - u_old));
        v_res = max(abs(v - v_old));
        
        iterations = iterations + 1;
        
        if (iteration > max_iterations || (u_res > conv && v_res > conv))
            break
        end
    end

end