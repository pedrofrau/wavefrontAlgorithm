function [matrix,sourcepos,goalpos] = matrix2
matrix = [1 1 1 1 1 1 1 1 1;
          1 0 0 0 0 5 0 0 1;
          1 0 0 0 1 0 0 0 1;
          1 0 0 0 1 1 1 0 1;
          1 0 0 0 0 2 0 0 1;
          1 1 1 1 1 1 1 1 1];
sourcepos = [2,6];
goalpos = [5,6];
end