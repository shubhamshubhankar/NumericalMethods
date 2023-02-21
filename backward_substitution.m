% Back substitution Implementation in Matlab for Upper Triangular matrix
% Initializing the 3X3 matrix with the default values.

A = [3 -1 2; 0 1 -5; 0 0 2];
B = [4 -4 2];
X = [0 0 0];
determinant = det(A);

if determinant == 0
    fprintf("The system has no solutions\n");
end

[numRows,numCols] = size(A);

%fprintf("numRows: %d, numCols: %d\n", numRows, numCols);

% For loop over the Matrix A for doing Upper triangular case
for i = numRows:-1:1
        % For the first condition in the last row(as only one element is
        % present.
        if i == numRows 
            X(i) = B(i)/A(i,i);
        else
            sum = 0;
            % Summing up A(i, j) * X(j) from the previous computations.
            for j = numCols:-1:i+1
                sum = sum + A(i,j) * X(j);
                %fprintf("(%d, %d) A(i, j): %f X(j): %f\n", i, j, A(i,j), X(j));
            end
            %Substracting this sum from the B(i) and dividing by the
            %current A(i,i).
            X(i) = (B(i) - sum)/A(i,i);
        end
end

disp(X);