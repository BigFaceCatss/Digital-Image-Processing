%%%%%%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Pick the samllest and largest disks in an image.
%
% Input Variables:
%       image    2D image 
%         
%
% Processing Flow:
%       1. Load the input image.
%       2. Change it to binary image.
%       3. Calculate the complement of image.
%       4. Use close/open filter to denoise
%       5. Perform Hit-or-Miss transfermation on image to 
%           pick the largest and smallest disks.
%
% The following functions are called:
%       convbin.m       convert the original image to pure binary
%       circle.m        generate a circle image
%       erosion.m       perform the erosion transfermation
%       dilation.m      perform the dilation transfermation
%       opening.m       perform the opening transfermation
%       closing.m       perform the closing transfermation
%
%
%Author:       Yifan Guo
% Date:         1/25/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
F = imread('RandomDisks-P10.jpg');
F = F(:,:,1);
% convert the original image to a binary image.
fbin = convbin(F);
fbinc = uint8(255-fbin);
% create a small circle to opening and closing.
a = uint8([0,1,0;1,1,1;0,1,0] * 255);
% use opening and closing operation to remove the salt and pepper noise.
f = opening(fbinc,a);
f = closing(f,a);
% show the result of denoise.
figure(1)
imshow(F),title('original image');
figure(2)
imshow(fbin),title('binary image');
figure(3)
imshow(255-f),title('denoise');

% pick the largest disks 
A = circle(30);
B = 255-A;
p1 = erosion(f,A);
p2 = 255-erosion(255-f,B);
p3 = p1.*p2;
fl = dilation(p3,A);
figure(4)
imshow(255-fl),title('largest disks');

% pick the smallest disks
A = circle(8);
B = 255-circle(10);
p1 = erosion(f,A);
p2 = erosion(255-f,B);
p3 = p1.*p2;
fs = dilation(p3,A);
figure(5)
imshow(255-fs),title('smallest disks');

% combine the largest and smallest disks
fls = fl+fs;
figure(6)
imshow(255-fls),title('smallest and largest disks');