function img_nhiphan = nhiphan(img)
    anh = rgb2gray(img);
    anh = imbinarize(anh); %nen trang - vat den
    img_nhiphan = imcomplement(anh);  %nen den - vat trang
end
    