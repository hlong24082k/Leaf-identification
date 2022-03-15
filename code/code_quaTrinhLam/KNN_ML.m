clc;
clear;

la_lot = xlsread('E:\Nhom8A\project_cuoiki\Excel\Hu_moments_la_lot.xlsx');
rau_ngo = xlsread('E:\Nhom8A\project_cuoiki\Excel\Hu_moments_rau_ngo.xlsx');
rau_hung = xlsread('E:\Nhom8A\project_cuoiki\Excel\Hu_moments_rau_hung.xlsx');
rau_ma = xlsread('E:\Nhom8A\project_cuoiki\Excel\Hu_moments_rau_ma.xlsx');
rau_muong = xlsread('E:\Nhom8A\project_cuoiki\Excel\Hu_moments_rau_muong.xlsx');



%creat test file
%1-10: la lot
%11-20: rau ngo
%21-30: rau hung
%31-40: rau ma
%41-50: rau muong
test_file = [la_lot(1:10,:);rau_ngo(1:10,:);rau_hung(1:10,:);rau_ma(1:10,:);rau_muong(1:10,:)];

%creat train file
train_file = [la_lot(11:100,:);rau_ngo(11:100,:);rau_hung(11:100,:);rau_ma(11:100,:);rau_muong(11:100,:)];

%phan class
%1: la lot 
%2: rau ngo
%3: rau hung
%4: rau ma
%5: rau muong
k = input('Nhap k: ');
distance = [];
phan_lop_class = [];
kc = 0;

i = 13
    for j = 1:length(train_file)
        for n = 1:7
            kc_thanhPhan = (abs(abs(test_file(i,n)) - abs(train_file(j,n))))^2;
            kc = kc + kc_thanhPhan;
        end
            distance = [distance sqrt(kc)]; 
            kc = 0;
            if(j <=80)
                phan_lop_class = [phan_lop_class 1]; 
            elseif (j>80 && j <= 160)
                phan_lop_class = [phan_lop_class 2];
            elseif (j>160 && j <= 240)
                phan_lop_class = [phan_lop_class 3];
            elseif (j>240 && j <= 320)
                phan_lop_class = [phan_lop_class 4];
            else
                phan_lop_class = [phan_lop_class 5];
            end
    end


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
     disp('day la la lot');
 elseif (output == 2)
     disp('day la rau ngo');
 elseif (output == 3)
     disp('day la rau hung');
 elseif (output == 4)
     disp('day la rau ma');
 else
     disp('day la rau muong');
 end