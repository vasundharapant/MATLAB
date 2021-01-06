img=imread("bird.jpg");
% imshow(img);
img1=imresize(img,[128 64]);
% imshow(img_resize);
tommy=rgb2gray(img1);

gradientx=zeros(128,64,'double');
gradienty=zeros(128,64,'double');
for i=1:128
    for j=1:64        
        if (i==1)
            gradientx(i,j)=tommy(i+1,j)-255;           
        elseif (i==128)
            gradientx(i,j)=255-tommy(i-1,j);
        else
            gradientx(i,j)=(tommy(i+1,j)-tommy(i-1,j));
        end
        
        if (j==1)
            gradienty(i,j)=255-tommy(i,j+1);
  
        elseif (j==64)
            gradienty(i,j)=-255+tommy(i,j-1);
        else
            gradienty(i,j)=(tommy(i,j-1)-tommy(i,j+1));
        end
    end
end

finalgrad=zeros(128,64,'double');
for i=1:128
    for j=1:64                   
        finalgrad(i,j)=calc_grad(gradientx(i,j),gradienty(i,j));        
    end
end
imshow(img);pause(3);
imshow(tommy);pause(3);
imshow(gradientx);pause(3);
imshow(gradienty);pause(3);
imshow(finalgrad);