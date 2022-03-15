 clear clc;
[image, path] = uigetfile('*.jpg','Select','MultiSelect','on');
list = strcat(path, image);
[a,b]=size(list);

path1 = 'E:\Nhom8A\tong_hop\rau_ngo_xulianh\';


for i=1:b
    img= imread(list{1,i});
    anh1 = rgb2gray(img);
    anh1 = anh1 + 50;
    
    anh2 = imbinarize(anh1); %nen trang - vat den
    anh2 = imcomplement(anh2);  %nen den - vat trang
 
    imwrite(anh2,strcat(path1,image{i}));
end