clear all;
%Pergeseran Citra

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%Mengatur pergeseran
geserX = 45;
geserY = -45;

oriDouble = double(ori);
hasilGeser = zeros(size(oriDouble));

for y = 1 : tinggi
  for x = 1 : lebar
    
    xLama = x - geserX;
    yLama = y - geserY;
    
    if (xLama >= 1) && (xLama <= lebar) && (yLama >= 1) && (yLama <= tinggi)
      hasilGeser(y,x) = oriDouble(yLama, xLama);
    else
      hasilGeser(x,y) = 0;
    endif
  endfor
endfor

hasilGeser = uint8(hasilGeser);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilGeser);
