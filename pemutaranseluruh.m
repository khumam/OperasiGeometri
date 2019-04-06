clear all;
%Pemutaran citra seluruhnya

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%Besarnya sudut
sudut = 45;

%Titik tengah gambar
m = floor(tinggi/2);
n = floor(lebar/2);

%Besarnya radian
rad = pi * sudut/180;
cosa = cos(rad);
sina = sin(rad);

%Koordinat pojok
x11 = 1;     y11 = 1;
x12 = lebar; y12 = 1;
x13 = lebar; y13 = tinggi;
x14 = 1;     y14 = tinggi;

oriDouble = double(ori);

% Menentukan pojok
x21= ((x11-n) * cosa + (y11-m) * sina + n);
y21 = ((y11-m) * cosa -(x11-n) * sina + m);         
x22 = ((x12-n) * cosa + (y12-m) * sina + n);
y22 = ((y12-m) * cosa -(x12-n) * sina + m);         
x23 = ((x13-n) * cosa + (y13-m) * sina + n);
y23 = ((y13-m) * cosa -(x13-n) * sina + m);         
x24 = ((x14-n) * cosa + (y14-m) * sina + n);
y24 = ((y14-m) * cosa -(x14-n) * sina + m);
         
ymin = min([y21 y22 y23 y24]);
xmin = min([x21 x22 x23 x24]);
ymak = max([y21 y22 y23 y24]);
xmak = max([x21 x22 x23 x24]);

lebar_baru = round(xmak - xmin + 1);
tinggi_baru = round(ymak - ymin + 1);
tambahan_y = floor((tinggi_baru-tinggi)/2);
tambahan_x = floor((lebar_baru-lebar)/2);

hasilPerkecil = zeros(tinggi_baru, lebar_baru);
for y = 1 : tinggi
  for x = 1 : lebar
    hasilPerkecil(y+tambahan_y, x+tambahan_x) = ori(y, x);
  endfor
endfor

%Titik tengah gambar
m = floor(tinggi_baru/2);
n = floor(lebar_baru/2);

for y = 1 : tinggi_baru
    for x = 1 : lebar_baru    
        xBaru = round(((x-n) * cosa) + ((y-m) * sina) + n);        
        yBaru = round(((y-m) * cosa) - ((x-n) * sina) + m);         

        if (xBaru >= 1) && (xBaru <= lebar_baru) && (yBaru >= 1) && (yBaru <= tinggi_baru)
           hasilPutar(y, x) = hasilPerkecil(yBaru, xBaru);
        else   
           hasilPutar(y, x) = 0;
        endif
    endfor
endfor

hasilPutar = uint8(hasilPutar);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilPutar);