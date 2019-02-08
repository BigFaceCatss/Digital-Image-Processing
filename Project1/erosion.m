%%%%%%%%%%%%%%%%%% erosion.m file %%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Erose the image by a given structuring element.
%
% Input Variables:
%       f       input image
%       B       structuring element
%
% Returned Results:
%       r       the result of ersosing f by B.
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
function [r] = erosion(f, B)
  [m,n] = size(f);
  [a,b] = size(B);
  r = uint8(zeros(m,n));
  s = fix(size(B)/2);
  for i = 1 : m-a+1
    for j = 1 : n-b+1
      if f(i:i+a-1,j:j+b-1).*B == B
        r(i+s(1),j+s(2)) = 255;
      else
        r(i+s(1),j+s(2)) = 0;
      end
    end
  end
end