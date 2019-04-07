clear all;
%Affine

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');
[tinggi, lebar] = size(ori);

%Menentukkan a11,a12,a21,a22,tx,dan ty
a11 = 1;
a12 = 0;
a21 = 1;
a22 = 1;
tx = 0;
ty = 0;

for y = 1 : tinggi
  for x = 1 : lebar
    x2 = a11 * x + a12 * y + tx;
    y2 = a21 * x + a22 * y + ty;
    
    if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
      
      % Lakukan interpolasi bilinear
      p = floor(y2);
      q = floor(x2);
      a = y2-p;
      b = x2-q;
      
      if (floor(x2)==lebar) || (floor(y2) == tinggi)
        hasilAffine(y, x) = ori(floor(y2), floor(x2));
      else
        intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a *((1-b)* ori(p+1, q) + b * ori(p+1, q+1));
        hasilAffine(y, x) = intensitas;
      endif
      else
        hasilAffine(y, x) = 0;
      endif
    endfor
endfor

hasilAffine = uint8(hasilAffine);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilAffine);
