function anh_nhiphan = K_means(img);

cform=makecform('srgb2lab');
lab_img=applycform(img,cform);
ab=double(lab_img(:,:,2:3));

nrows=size(ab,1);
ncols=size(ab,2);
ab1=reshape(ab,nrows*ncols,2);

ncolors=2;
[cluster_idx,cluster_center]=kmeans(ab1,ncolors,'distance','sqEuclidean','Replicates',3);

pixel_labels=reshape(cluster_idx,nrows,ncols);
segmented=cell(1,3);
rbg=repmat(pixel_labels,[1,1,3]); 
for k=1:ncolors ;
    color=img;  
    color(rbg~=k)=0; 
    segmented{k}=color;
end;

count1 = 0;
count2 = 0;
for i = 1:100
    if(segmented{1}(1,i) == 0)
        count1 = count1 + 1;
    end
end
for i = 1:100
    if(segmented{2}(1,i) == 0)
        count2 = count2 + 1;
    end
end

if (count1 < count2)
    img_new = segmented{1};
else
    img_new = segmented{2};
end

anh_nhiphan = xulianh(50,img_new);

end




    


