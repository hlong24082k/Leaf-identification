clear clc;
[image, path] = uigetfile('*.jpg','Select','MultiSelect','on');
list = strcat(path, image);
[a,b]=size(list);

path1 = 'E:\Nhom8A\tong_hop\rau_muong_xulianh\'; %dien path de luu anh sau tien xu li

for i=1:b
    im= imread(list{1,i});
    
    im2 = flipdim(im,2);
    im3 = flipdim(im,1);
    im4 = flipdim(im2,1);
    
    a = strsplit(image{i},'.');
    imwrite(im2,strcat(path1,a{1},'_2.jpg'));
    imwrite(im3,strcat(path1,a{1},'_3.jpg'));
    imwrite(im4,strcat(path1,a{1},'_4.jpg'));    
end