clear all;
%transformasi spherical

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');

%Tentukan rho
rho = 1.8;

dimensi = size(ori);
tinggi = dimensi(1);
lebar = dimensi(2);
xc = round(lebar / 2);
yc = round(tinggi / 2);
rmaks = xc;  % 1/2 lebar gambar

for y=1 : tinggi
  for x=1 : lebar
    r = sqrt((x-xc)^2+(y-yc)^2);
    z = sqrt(rmaks^2-r^2);
    bx = (1 -1/rho) * asin((x-xc) / sqrt((x-xc)^2+z^2));
    by = (1 -1/rho) * asin((y-yc) / sqrt((y-yc)^2+z^2));
    
    if r <= rmaks
      x2 = x -z * tan(bx);
      y2 = y -z * tan(by);
    else
      x2 = x;
      y2 = y;
    end
    
    if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
      
      % Lakukan interpolasi bilinear
      p = floor(y2);
      q = floor(x2);
      a = y2-p;
      b = x2-q;
      
      if (floor(x2)==lebar) || (floor(y2) == tinggi)
        hasilSph(y, x) = ori(floor(y2), floor(x2));
      else
        intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a * ((1-b) * ori(p+1, q) + b * ori(p+1, q+1));
        hasilSph(y, x) = intensitas;
      end
    else
      hasilSph(y, x) = 0;
    end
  end
end

hasilSph = uint8(hasilSph);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilSph);