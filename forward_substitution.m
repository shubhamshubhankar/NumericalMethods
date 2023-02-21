% Forward Substitution Implementation in Matlab for Lower Triangular matrix

% Open the input file
fileID = fopen('forward_substitution_input.txt','r');

% Read the dimensions of the matrix A
dims = fscanf(fileID,'%d %d',[1 2]);

% Read the values and store them in a matrix A
A = fscanf(fileID,'%d',[dims(1) dims(2)]);
A = transpose(A);

B = fscanf(fileID,'%d',[dims(1)]);

% Close the file
fclose(fileID);

[numRows,numCols] = size(A);

X = zeros(numRows,1);

determinant = det(A);

if determinant == 0
    fprintf("The system has no solutions\n");
end

%fprintf("numRows: %d, numCols: %d\n", numRows, numCols);

% For loop over the Matrix A for doing Upper triangular case
for i = 1: numRows
        % For the first condition in the last row(as only one element is
        % present.
        if i == numRows 
            X(i) = B(i)/A(i,i);
        else
            sum = 0;
            % Summing up A(i, j) * X(j) from the previous computations.
            for j = 1 : i
                sum = sum + A(i,j) * X(j);
                %fprintf("(%d, %d) A(i, j): %f X(j): %f\n", i, j, A(i,j), X(j));
            end
            %Substracting this sum from the B(i) and dividing by the
            %current A(i,i).
            X(i) = (B(i) - sum)/A(i,i);
        end
end

disp(X);