img=imread("img.jpg");
% imshow(img);
kutta=imresize(img,[128 64]);
% imshow(img_resize);
gradientx=zeros(128,64,3,'double');
gradienty=zeros(128,64,3,'double');
for i=1:128
    for j=1:64
        for k=1:3
            if (i==1)
                gradientx(i,j,k)=kutta(i+1,j,k)-255;           
            elseif (i==128)
                gradientx(i,j,k)=255-kutta(i-1,j,k);
            else
                gradientx(i,j,k)=(kutta(i+1,j,k)-kutta(i-1,j,k));
            end
            
            if (j==1)
                gradienty(i,j,k)=255-kutta(i,j+1,k);
      
            elseif (j==64)
                gradienty(i,j,k)=-255+kutta(i,j-1,k);
            else
                gradienty(i,j,k)=(kutta(i,j-1,k)-kutta(i,j+1,k));
            end
        end
    end
end
finalgrad=zeros(128,64,3,'double');
for i=1:128
    for j=1:64
        for k=1:3            
            finalgrad(i,j,k)=calc_grad(gradientx(i,j,k),gradienty(i,j,k));
        end
    end
end

imshow(img);pause(3);
imshow(kutta);pause(3);
imshow(gradientx);pause(3);
imshow(gradienty);pause(3);
imshow(finalgrad);