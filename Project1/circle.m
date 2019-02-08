%%%%%%%%%%%%%%%%%% circle.m file %%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Create a circle.
%
% Input Variables:
%       radius    number 
%
% Returned Results:
%       r       the matrix of a circle.
%
% Restrictions/Notes:
%       This function requires an 8-bit image as input.
%
% The following functions are called:
%      none
%
% Author:       Yifan Guo
% Date:         1/25/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r] = circle(radius)
  r = uint8(zeros(2*radius-1,2*radius-1));
  s = radius^2;
  for i = 1:radius*2-1
    for j = 1:radius*2-1
      if (i-radius)^2+(j-radius)^2<=s
        r(i,j) = 255;
      end
    end
  end
end