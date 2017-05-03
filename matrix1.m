function [matrix,sourcepos,goalpos] = matrix1
matrix = [1 1 1 1 1 1 1 1 1;
          1 5 0 0 0 0 0 0 1;
          1 0 0 0 0 0 0 0 1;
          1 0 0 0 1 1 1 0 1;
          1 0 0 0 0 0 0 2 1;
          1 1 1 1 1 1 1 1 1];
sourcepos = [2,2];
goalpos = [5,8];
end