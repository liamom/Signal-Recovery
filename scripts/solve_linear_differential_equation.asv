%non matrix system of equations
syms f(t) g(t);
eqn1 = diff(f) == 3*f + 4*g;
eqn2 = diff(g) == -4*f + 3*g;
S = dsolve(eqn1, eqn2);
fSol(t) = S.f;
gSol(t) = S.g;

%matrix style
m = [ 3 4; -4 3];
x = [f; g];
eq = diff(x) == m*x;
nS = dsolve(eq)
nS.f
nS.g






