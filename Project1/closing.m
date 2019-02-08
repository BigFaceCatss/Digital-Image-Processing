%%%%%%%%%%%%%%%%%% closing.m file %%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Complete the closing transformation.
%
% Input Variables:
%       f    2D image 
%       B    structuring element
%
% Returned Results:
%       r       the reult of closed by B.
%
% Restrictions/Notes:
%       This function requires an 8-bit image as input.
%
% The following functions are called:
%       erosion.m       perform the erosion transfermation
%       dilation.m      perform the dilation transfermation
% Author:       Yifan Guo
% Date:         1/25/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r] = closing(f,B)
  r = dilation(f,B);
  r = erosion(r,B);
end