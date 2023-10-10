low=imread('low.jpg');
gray1=low(:,:,1);

high=imread('high.jpg');
gray2=high(:,:,1);

hist1 = imhist(gray1); 
hist2 = imhist(gray2);

subplot(3,2,1), imshow(gray1);
subplot(3,2,2), imhist(gray1);
subplot(3,2,3), imshow(gray2);
subplot(3,2,4), imhist(gray2);

cdf1 = cumsum(hist1) / numel(gray1);
cdf2 = cumsum(hist2) / numel(gray2);

mapping = zeros(256,1,'uint8'); 
for idx = 1 : 256
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    mapping(idx) = ind-1;
end

[height, width] = size(gray1);
result=zeros(height,width,'uint8');
for x = 1: height
    for y = 1:width
             result(x,y) = mapping(gray1(x,y)+1);
    end
end

subplot(3,2,5), imshow(result);
subplot(3,2,6), imhist(result);