function g = g(x)
    a = -1/7;
    b = 2/7;
    if (x <= -1)
        g = b*x+(a+b);
    else
        if (x >= 1)
            g = b*x-(a+b);
        else
            g = a*x;
        end
    end
