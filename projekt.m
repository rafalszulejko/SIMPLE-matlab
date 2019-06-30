%old version

clear; clc;

rho = 1000;
p0 = 1000;

%% initialization
[mask, length, width] = cyl_in_channel(100, 60, 20, 20, 20, 0.3);

initial_u = 10;
u_inlet = zeros(size(mask));
u_inlet(2:end - 1, 1) = initial_u*ones(width-2, 1);

%velocity field
u = zeros(size(mask));
v = u;

%pressure field
p = u;
np = u;

%residuals
res_u = ones(size(mask));
res_v = res_u;


%% solver

n = 0;

while max_res_u > 0.01 || max_res_v > 0.01
    
    u_star = momentum_u(u, v, p);
    v_star = momentum_v(u, v, p);
    u_old = u;
    v_old = v;
    
    
    
    res_u = abs(nu - u);
    max_res_u = max(res_u);
    
    res_v = abs(nv - v);
    max_res_v = max(res_v);
    

    clc;
    n = n + 1;
    fprintf("Iterations: n");
    fprintf("Maximum residuals:\nHorizontal velocity:%d\nVertical velocity:%d\nPressure:%d", max_res_u, max_res_v);
    
end
