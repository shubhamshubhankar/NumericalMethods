% GEM Implementation in Matlab
function [A, B] = GEM(A, B)
    
    [numRows,numCols] = size(A);
    I = zeros(numRows, numCols);
    
    %For loop over the Matrix A for applying the GEM
    for k = 1 : numRows - 1
        for i = k + 1 : numRows
            I(i, k) = A(i, k)/A(k, k);
            for j = k : numCols
                 A(i, j) = A(i, j) - I(i, k) * A(k, j);
            end 
            B(i) = B(i) - I(i, k)* B(k);
        end
    end

end % End of function