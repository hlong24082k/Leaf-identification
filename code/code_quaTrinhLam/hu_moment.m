clear clc;
[images, path] = uigetfile('*.jpg','Select','MultiSelect','on');
list = strcat(path, images);
[a,b]=size(list);
Hu = [];
for i=1:b
    a= imread(list{1,i});    
    a= double(a/255);
    %a = double(a)
    hu_moments_vector  = hu_moments( a );
    Hu(i,:) = hu_moments_vector;
end
Hu



function  hu_moments_vector  = hu_moments( image )
[height, width] = size(image);
% define a co-ordinate system for image 
xgrid = repmat((-floor(height/2):1:ceil(height/2)-1)',1,width);
ygrid = repmat(-floor(width/2):1:ceil(width/2)-1,height,1);
[x_bar, y_bar] = centerOfMass(image,xgrid,ygrid);
% normalize coordinate system by subtracting mean
xnorm = x_bar - xgrid;
ynorm = y_bar - ygrid;

mu_11 = central_moments( image ,xnorm,ynorm,1,1);
mu_20 = central_moments( image ,xnorm,ynorm,2,0);
mu_02 = central_moments( image ,xnorm,ynorm,0,2);
mu_21 = central_moments( image ,xnorm,ynorm,2,1);
mu_12 = central_moments( image ,xnorm,ynorm,1,2);
mu_03 = central_moments( image ,xnorm,ynorm,0,3);
mu_30 = central_moments( image ,xnorm,ynorm,3,0);

S1   = mu_20 + mu_02;
S2   = (mu_20 - mu_02)^2 + 4*mu_11;
S3   = (mu_30 - 3*mu_12)^2 + (mu_03 - 3*mu_21)^2;
S4   = (mu_30 + mu_12)^2 + (mu_03 + mu_21)^2;
S5   = (mu_30 - 3*mu_12)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (3*mu_21 - mu_03)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_03 + mu_21)^2);
S6   = (mu_20 - mu_02)*((mu_30 + mu_12)^2 - (mu_21 + mu_03)^2) + 4*(mu_30 + mu_12)*(mu_21 + mu_03);
S7   = (3*mu_21 - mu_03)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (mu_30 - 3*mu_12)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_03 + mu_21)^2);
S1 = log(abs(S1));
S2 = log(abs(S2));
S3 = log(abs(S3));
S4 = log(abs(S4));
S5 = log(abs(S5));
S6 = log(abs(S6));
S7 = log(abs(S7));

hu_moments_vector = [S1, S2, S3, S4, S5, S6, S7];
end
% calculate scale invariant central moments
function cm = central_moments( image ,xnorm,ynorm,p,q)
    
    cm = sum(sum((xnorm.^p).*(ynorm.^q).*image));
    cm_00 = sum(sum(image)); 
    cm = cm/(cm_00^(1+(p+q)/2));
    
end
% calculate centcer of mass
function [x_bar, y_bar] = centerOfMass(image,xgrid,ygrid)
    eps = 10^(-6); 
    
    x_bar = sum(sum((xgrid.*image)))/(sum(image(:))+eps);
    y_bar = sum(sum((ygrid.*image)))/(sum(image(:))+eps);
end