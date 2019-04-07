clear all;
%ripple

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');

dimensi = size(ori);
tinggi = dimensi(1);
lebar = dimensi(2);

%menentukan ax,ay,tx,ty
ax = 10;
ay = 100;
tx = 250;
ty = 300;

for y=1 : tinggi
  for x=1 : lebar
    x2 = x + ax * sin(2 * pi * y / tx);
    y2 = y + ay * sin(2 * pi * x / ty);
    if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
      
      % Lakukan interpolasi bilinear
      p = floor(y2);q = floor(x2);
      a = y2-p;b = x2-q;
      
      if (floor(x2)==lebar) || (floor(y2) == tinggi)
        hasilRipple(y, x) = ori(floor(y2), floor(x2));
      else
        intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a *((1-b)* ori(p+1, q) + b * ori(p+1, q+1));
        hasilRipple(y, x) = intensitas;
      end
    else
      hasilRipple(y, x) = 0;
    end
  end
end

hasilRipple = uint8(hasilRipple);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilRipple);