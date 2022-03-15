
function I_new = I_crop(I)
[y x] = size(I);
    x1=1;
    y1=1;
    x2=x;
    y2=y;
    while ((I(:,x1))==0)
        x1=x1+1;
    end
 
    while ((I(:,x2))==0)
        x2=x2-1;
    end
    
    while ((I(y1,:))==0)
        y1=y1+1;
    end
    
    while ((I(y2,:))==0)
        y2=y2-1;
    end
    
    I = imcrop(I,[x1,y1,(x2-x1),(y2-y1)]);
    I=double(I/255);
    I_new = I;
end
    