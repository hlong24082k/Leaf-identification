clear clc;
[images, path] = uigetfile('*.jpg','Select','MultiSelect','on');
list = strcat(path, images);
[a,b]=size(list);
path1 = 'E:\Nhom8A\Ket_Qua\rau_ma_nhiphan\';

for i = 1:b
    img = imread(list{1,i});
    imwrite(img,strcat(path1,num2str(i),'.jpg'));
end
