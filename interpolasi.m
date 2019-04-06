clear all;
%Interpolasi

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
        xBaru = x * cosA + y * sinA;        
        yBaru = y * cosA - x * sinA;        

        if (xBaru >= 1) && (xBaru <= lebar) && (yBaru >= 1) && (yBaru <= tinggi)
          
           % Lakukan interpolasi bilinear 
           p = floor(yBaru);
           q = floor(xBaru);
           a = yBaru-p;
           b = xBaru-q;

           if (xBaru == lebar) || (yBaru == tinggi)
              hasilInterpolasi(y, x) = F(floor(yBaru), floor(xBaru));
           else
              intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a *((1-b)* ori(p+1, q) + b * ori(p+1, q+1));
              hasilInterpolasi(y, x) = intensitas;
           endif
        else
           hasilInterpolasi(y, x) = 0;
        endif
    endfor
endfor

hasilInterpolasi = uint8(hasilInterpolasi);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilInterpolasi);