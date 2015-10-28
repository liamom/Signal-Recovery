function r = Solver2(tv, mm)
    t = size(mm);
    n = t(2);% number of variables
    m = t(1); % number of mesurments
    
    if((n.^2 - 1) ~= m )
       error('not enough mesurments to calculate'); 
    end

    primes = zeros(n.^2,1);
    for i = 1:n.^2
        j = mod(i-1,n)+1;
        primes(i) = (mm(j+1) - mm(j))/(tv(j+1) - tv(j));
    end

    matrix = zeros(n.^2);
    
    for i = 0:n-1
        for j = i*n:n + i*n -1
            k = mod(j*n, n.^2);
            matrix(j+1:j+1,k+1:k+n) = mm(i+1:i+1,:);
        end
    end
    
    r = linsolve(matrix, primes);
end