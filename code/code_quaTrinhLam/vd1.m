clc;
clear;

file_train = xlsread('E:\Nhom8A\Excel\Hu_tonghop.xlsx');
file_test = xlsread('E:\Nhom8A\Excel\Hu_tonghop.xlsx');

vitri = 95;

%k = input('Nhap k: ');
k = 5;
distance = [];
phan_lop_class = [];
kc = 0;

for j = 1:length(file_train)
        for n = 1:7
            kc_thanhPhan = (abs(abs(file_test(vitri,n)) - abs(file_train(j,n))))^2;
            kc = kc + kc_thanhPhan;
        end
            distance = [distance sqrt(kc)]; 
            kc = 0;
            if(j <=100)
                phan_lop_class = [phan_lop_class 1]; 
            elseif (j>100 && j <= 200)
                phan_lop_class = [phan_lop_class 2];
            elseif (j>200 && j <= 300)
                phan_lop_class = [phan_lop_class 3];
            elseif (j>300 && j <= 400)
                phan_lop_class = [phan_lop_class 4];
            else
                phan_lop_class = [phan_lop_class 5];
            end
end
distance(:,vitri) = [];

