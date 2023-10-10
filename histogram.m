rgb_image = imread("sample.png");
gray_image = rgb2gray(rgb_image);
imshow(rgb_image);
list = zeros(1, 256);
[length, width] = size(gray_image);
for i = 1:length
    for j = 1:width
        intensity = gray_image(i, j);
        list(intensity + 1) = list(intensity + 1) + 1;
    end
end


bar(0:255, list);
xlabel('Intensitas Piksel');
ylabel('Frekuensi');
title('Histogram Gambar Grayscale');