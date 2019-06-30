function [velocity, pressure] = setup(mesh, initial_v)
    velocity = initial_v * ((-1) * (mesh - 1));
    pressure = zeros(size(mesh));
end