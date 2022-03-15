link = input('Nhap dia chi anh can nhan dang: ','s');

%read image link
img = imread(link);

%convert binary image
img_nhiphan = K_means(img);

%Hu_moments
img_nhiphan = double(img_nhiphan/255);
img_hu_moment = hu_moments(img_nhiphan);

%test
la_lot = xlsread('E:\Nhom8A\Excel\Hu_moments_la_lot.xlsx');
rau_ngo = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_ngo.xlsx');
rau_hung = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_hung.xlsx');
rau_ma = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_ma.xlsx');
rau_muong = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_muong.xlsx');

file = [la_lot(:,:);rau_ngo(:,:);rau_hung(:,:);rau_ma(:,:);rau_muong(:,:)];

out1 = KNN_img(img_hu_moment,file);
disp(out1);