image = imread('sample.png');
[length, width, channels] = size(image);

negative_image = zeros(length, width, channels);



for i = 1:length
    for j = 1:width
        for k = 1:channels
            intensity = image(i, j, k);
            negative_intensity = 255 - intensity;
            negative_image(i, j, k) = negative_intensity;
        end
    end
end

imshow(uint8(negative_image));
