function [t, w] = RKO4(f, a, b, N, alpha_vect)
    m = length(alpha_vect);
    h = (b-a)/N;
    t(1) = a;
    for i = 1:m
        w(i,1) = alpha_vect(i);
    end
    for i = 2:N+1
        K1 = h * f(t(i-1), w(:,i-1));
        K2 = h * f(t(i-1) + h/2, w(:,i-1) + K1/2);
        K3 = h * f(t(i-1) + h/2, w(:,i-1) + K2/2);
        K4 = h * f(t(i-1) + h, w(:,i-1) + K3);
        w(:,i) = w(:,i-1) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i) = a + (i-1)*h;
    end
end