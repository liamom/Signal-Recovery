function r = Solver2(tv, mm)
    t = size(mm);
    n = t(2);% number of variables
    m = t(1); % number of mesurments
    
    if(n >= m )
       %error('not enough mesurments to calculate'); 
       %interpolateExtraValues(tv,mm);
    end

    primes = zeros(n.^2,1);
    for i = 1:n+1
       for j = 1:n
           if(m-1 >= i) 
            primes(j + n*(i-1)) = (mm(i+1,j) - mm(i,j))/(tv(i+1) - tv(i));
           else
            primes(j + n*(i-1)) = interpolateExtraValues(tv,mm, i, j); 
           end
       end
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

function r = interpolateExtraValues(tv,mm, messurment, variable)

    p = polyfit(tv,  mm( :, variable)', 3);
    d = polyder(p);
    r = polyval(d,tv(messurment));
end