clear all;
%Flip Y

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%tentukan orientasi cermin mau dicerminkan secara
%horizontal (h)
%atau
%vertical (v)

orientasi = 'h';
  
if orientasi == 'h'
  for y = 1 : tinggi
    for x = 1 : lebar
      xCermin = lebar -x + 1;
      yCermin = y;
      hasilFlip(y, x) = ori(yCermin, xCermin);
    endfor
   endfor
endif
  
if orientasi == 'v'
  for y = 1 : tinggi
    for x = 1 : lebar
      xCermin = x;
      yCermin = tinggi - y + 1;
      hasilFlip(y, x) = ori(yCermin, xCermin);
    endfor
   endfor
endif
  
hasilFlip = uint8(hasilFlip);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilFlip);