clear  all;
%Perbesaran citra

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%skala besaran (Untuk pengecilan gunakan angka di bawah 1 di atas 0. 
besaranX = 0.2;
besaranY = 0.2;

tinggiBaru = tinggi * besaranX;
lebarBaru = lebar * besaranY;

oriDouble = double(ori);

hasilBesar = zeros(tinggiBaru, lebarBaru);
for y = 1 : tinggiBaru
    y2 = ((y-1) / besaranY) + 1;
  
  for x=1 : lebarBaru
    x2 = ((x-1) / besaranX) + 1;
    hasilBesar(y, x) = ori(floor(y2), floor(x2));
  endfor
endfor

hasilBesar = uint8(hasilBesar);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilBesar);