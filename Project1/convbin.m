%%%%%%%%%%%%%%%%%% convbin.m file %%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Convert image to a binary image.
%
% Input Variables:
%       f    2D image 
%
% Returned Results:
%       f       the result of convert image to a binary image.
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
function [f] = convbin(f)
  [m,n] = size(f);
  for i = 1:m
    for j = 1:n
      if f(i,j) > 127 
        f(i,j) = 255;
      else
        f(i,j) = 0;
      end
    end
  end
end  