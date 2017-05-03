%%%%%%Initializations%%%%%
[matrix, sourcepos, goalpos] = matrix4 %Select the world 
currentpos = sourcepos;
cost = zeros(size(matrix));%We initialize a cost matrix
m1 = [goalpos(1) goalpos(2)];%We store the position of goal while we study its adjacent cells
cost(goalpos(1), goalpos(2)) = 2;%We give the goal a cost of 2
adjacent = [ 1 0; 0 1; -1 0; 0 -1;1 1;-1 -1;1 -1;-1 1];  % We initialize a matrix of immediate adjacents
display = true;

matrix
imagesc(matrix)
if display 
    disp('click/press any key');
    waitforbuttonpress; 
end

%%%%%Start of the wavefront algorithm%%%%%
while size(m1,1) ~= 0
  % For each cell adjacent to the current one check its particularities
  for k=1:size(adjacent,1)
    % Calculate index for current adjacent cell:
    adj = m1(1,:)+adjacent(k,:);
    % Check the existance of the adjacent cell in the map
    if min(adj) < 1
      continue
    end
    if adj(1) > size(cost,1)
      continue
    end
    if adj(2) > size(cost,2)
      continue
    end
    % Check if the adjacent cell is an obstacle 
    if matrix(adj(1), adj(2)) == 1
      continue
    end
    % Check if the adjacent cell hasn't been already visited
    if cost(adj(1), adj(2)) ~= 0
      continue
    end
    % Set the cost and add the adjacent to the m1 set
    cost(adj(1), adj(2)) = cost(m1(1,1), m1(1,2)) + 1;
    m1(size(m1,1)+1,:) = adj;
  end
  m1 = m1(2:end,:);
end

matrix = cost

imagesc(matrix)
if display 
    disp('click/press any key');
    waitforbuttonpress; 
end

%%%%%Calculate the best cost path and find the way to the goal
for i=1:size(matrix,1)
    for j=1:size(matrix,2)
        if matrix(i,j) == 0
            matrix(i,j) = 1; %Redraw the boundaries and obstacles of the matrix
        end
    end 
end

goal = matrix(sourcepos(1),sourcepos(2));

%Iterate over the matrix till attainance of the goal
while goal>2
    %Check every cost of adjacent cells and mark the cell as visited if it
    %belongs to the final path
    if matrix(currentpos(1),currentpos(2))>matrix(currentpos(1),currentpos(2)+1)&&...
            matrix(currentpos(1),currentpos(2)+1)>1
       currentpos = [currentpos(1), currentpos(2)+1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1),currentpos(2)-1) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)+1,currentpos(2))&&...
            matrix(currentpos(1)+1,currentpos(2))>1
       currentpos = [currentpos(1)+1, currentpos(2)]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)-1,currentpos(2)) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)+1,currentpos(2)+1)&&...
            matrix(currentpos(1)+1,currentpos(2)+1)>1
       currentpos = [currentpos(1)+1, currentpos(2)+1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)-1,currentpos(2)-1) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)-1,currentpos(2))&&...
            matrix(currentpos(1)-1,currentpos(2))>1
       currentpos = [currentpos(1)-1, currentpos(2)]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)+1,currentpos(2)) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1),currentpos(2)-1)&&...
            matrix(currentpos(1),currentpos(2)-1)>1
       currentpos = [currentpos(1), currentpos(2)-1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1),currentpos(2)+1) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)-1,currentpos(2)-1)&&...
            matrix(currentpos(1)-1,currentpos(2)-1)>1
       currentpos = [currentpos(1)-1, currentpos(2)-1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)+1,currentpos(2)+1) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)-1,currentpos(2)+1)&&...
            matrix(currentpos(1)-1,currentpos(2)+1)>1
       currentpos = [currentpos(1)-1, currentpos(2)+1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)+1,currentpos(2)-1) = 40;
       
    elseif matrix(currentpos(1),currentpos(2))>matrix(currentpos(1)+1,currentpos(2)-1)&&...
            matrix(currentpos(1)+1,currentpos(2)-1)>1
       currentpos = [currentpos(1)+1, currentpos(2)-1]; 
       goal = matrix(currentpos(1),currentpos(2))
       matrix(currentpos(1)-1,currentpos(2)+1) = 40;
    end
end

%This is just for visual issues of the imagesc function
%We set all non-visited 
for i=1:size(matrix,1)
    for j=1:size(matrix,2)
        if matrix(i,j) > 2 && matrix(i,j) < 40
            matrix(i,j) = 10;
        end
    end 
end

matrix(sourcepos(1),sourcepos(2)) = 5;
matrix(goalpos(1),goalpos(2)) = 2;

matrix
imagesc(matrix)
