%timeVals = array of times meurments were taken
%mesurments = array of mesurment vectors
%   [[1 2 3; 1 4 5]]
function r = Solver(timeVals, mesurements)
    t = size(mesurements);
    n = t(2);% number of variables
    m = t(1); % number of mesurments

    if((n.^2 - 1) ~= m )
       error('not enough mesurments to calculate'); 
    end

    primes = zeros(m-1, n);
    for i = 1:m-1
        for j = 1:n
           primes(i,j) = (mesurements(i+1) - mesurements(i))/(timeVals(i+1) - timeVals(i));
        end
    end

    a = sym(sym('X%d%d', n),'real');
    
    eq1 = primes(1:n)' == a * mesurements(1:1,:)';
    eq2 = primes(n:n+n)' == a * mesurements(2:2,:)';

    eqs = [eq1, eq2];
    
    v = solve(eqs);
    
    rval = zeros(n);
    
    for i = 1:n
        for j = 1:n
            s = 'v.X';
            s = strcat(s ,int2str(i)); 
            s = strcat(s ,int2str(j)); 
            rval(i,j) = eval(s);
        end
    end 
    
    r = rval;
end