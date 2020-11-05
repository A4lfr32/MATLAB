% Alfredo Maussa

function [y] = duncion(x)

    format long;
    S=300;
    m=0.25;
    g=-32.17;
    k=0.1;
    %y = 2*e^(2*x)+cos(x-1)+6*x^2-4;
    y = g*(m/k)-g*m^2*exp(-k*x/m)/(k*m);

end