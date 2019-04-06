clear all;
%Pemutaran citra

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%Besarnya sudut
sudut = 10;

%Besarnya radian
rad = pi * sudut/180;
cosA = cos(rad);
sinA = sin(rad);

oriDouble = double(ori);

for y = 1 : tinggi
    for x = 1 : lebar    
        xBaru = round(x * cosA + y * sinA);        
        yBaru = round(y * cosA - x * sinA);         

        if (xBaru >= 1) && (xBaru <= lebar) && (yBaru >= 1) && (yBaru <= tinggi)
           hasilPutar(y, x) = oriDouble(yBaru, xBaru);
        else   
           hasilPutar(y, x) = 0;
        endif
    endfor
endfor

hasilPutar = uint8(hasilPutar);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilPutar);