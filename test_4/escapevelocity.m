function [escape_steps] = escapevelocity(z0, c, N)
    z = z0;
    for i = 1:N
        z = z^2 + c;
        absz = abs(z);
        if absz > 2
            escape_steps = i;
            return;
        end
    end
    % 如果迭代结束后仍未逃逸，返回 N
    escape_steps = N;
end
