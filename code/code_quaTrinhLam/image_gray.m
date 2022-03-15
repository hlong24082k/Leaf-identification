clear clc;
[images, path] = uigetfile('*.jpg','Select','MultiSelect','on');
list = strcat(path, images);
[a,b]=size(list);
path1 = 'E:\Nhom8A\tong_hop\rau_ngo_gray\';

for i = 1:b
    img = imread(list{1,i});
    img_gray = gray(img);
    imwrite(img_gray,strcat(path1,images{i}));
end


function img_gray = gray(img)
    img1 = rgb2gray(img);
    t = graythresh(img1);
    [x, y] = size(img1);
    img1 = (img1 <t*255)*255;
    img1 = imfill(img1,'holes');
    for i=1:x
        for j =1:y
            if img1(i,j) == 255
                img1(i,j) = 128;
            end
        end
    end
    img_gray = mat2gray(img1,[0,255]);
end