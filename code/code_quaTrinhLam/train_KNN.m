clc;
clear;

file_train = xlsread('E:\Nhom8A\Excel\Hu_tonghop.xlsx');
file_test = xlsread('E:\Nhom8A\Excel\Hu_tonghop.xlsx');
out1 = [];
for vitri = 1:size(file_test,1)
    out = KNN_img(vitri,file_train,file_test);
    out1(vitri,:) = out;
end
filename = 'ketqua_train_KNN_k_1.xlsx';
xlswrite(filename,out1,1,'B1');


function out = KNN_img(vitri,file_train,file_test)
%k = input('Nhap k: ');
k = 1;
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
phan_lop_class(:,vitri) = [];

%sap xep tang dan
for i = 1:(length(distance) - 1)
    for j = (i+1):length(distance)
        if(distance(i) > distance(j))
            tg = distance(i);
            distance(i) = distance(j);
            distance(j) = tg;
            gg = phan_lop_class(i);
            phan_lop_class(i) = phan_lop_class(j);
            phan_lop_class(j) = gg;
        end
    end
end

%tim so lan xuat hien cua moi class 
class1 = 0;
class2 = 0;
class3 = 0;
class4 = 0;
class5 = 0;

class = [];
for i = 1:k
    class = [class phan_lop_class(i)];
    if(phan_lop_class(i) == 1)
        class1 = class1 + 1;
    elseif(phan_lop_class(i) == 2)
        class2 = class2 + 1;
    elseif(phan_lop_class(i) == 3)
        class3 = class3 + 1;
    elseif(phan_lop_class(i) == 4)
        class4 = class4 + 1;
    else
        class5 = class5 + 1;
    end
end
class;
%output
decision = [class1 class2 class3 class4 class5];

max = decision(1);
output = 1;
for i = 2:5
    if(decision(i) > max)
        max = decision(i);
        output = i;
    end
end
 if(output == 1)
    out = 1;
 elseif (output == 2)
    out = 2;
 elseif (output == 3)
    out = 3;
 elseif (output == 4)
    out = 4;
 else
    out = 5;
 end
end