classdef Solver
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        %timeVals = array of times meurments were taken
        %mesurments = array of mesurment vectors
        %   [[1 2 3; 1 4 5]]
        function r = solver(timeVals, mesurements)
            n = length(mesurments(1));% number of variables
            m = length(mesurements); % number of mesurments
            
            if(n.^2 >= m - 1)
               error('not enough mesurments to calculate'); 
            end
            
            primes = zeros(m-1, n);
            for i = 1:m-1
                for j = 1:n
                   primes(i,j) = (mesurements(i+1) - mesurements(i))/(timeVals(i+1) - timeVals(i));
                end
            end
            
            a = sym(sym('Q%d%d', n),'real');
            
            eqs = [];
            
            for i = 1:primes
               eqs(i) = primtes(1) == a*mesurements(i);
            end
            
            r = dsolve(eqs);
        end
    end
    
end

