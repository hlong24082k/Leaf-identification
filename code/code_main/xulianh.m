

function anh = xulianh(nguong, im)
    im = rgb2gray(im);
        for x = 1:size(im,1)
            for y = 1:size(im,2)
                if im(x,y) < nguong
                im(x,y) = 255;
                else im(x,y) = 1;
                end
            end
        end
        anh = im;
    end