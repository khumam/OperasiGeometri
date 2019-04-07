clear all;
%Bilinear

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');

dimensi =size(ori);
tinggi = dimensi(1);
lebar = dimensi(2);

%menentukan a1 - a4
a1 = 1.2;
a2 = 0.1;
a3 = 0.005;
a4 = -45;

%Menentukan b1-b4
b1 = 0.1;
b2 = 1;
b3 = 0.005;
b4 = 30;

for y=1 : tinggi
  for x=1 : lebar
    x2 = a1 * x + a2 * y + a3 * x * y + a4;
    y2 = b1 * x + b2 * y + b3 * x * y + b4;
    
    if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
      
      % Lakukan interpolasi bilinear
      p = floor(y2);
      q = floor(x2);
      a = y2-p;
      b = x2-q;
      if (floor(x2)==lebar) || (floor(y2) == tinggi)
        hasilBil(y,x) = ori(floor(y2), floor(x2));
      else
        intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a *((1-b)* ori(p+1, q) + b * ori(p+1, q+1));
        hasilBil(y, x) = intensitas;
      end
    else
      hasilBil(y, x) = 0;
    end
  end
end

hasilBil = uint8(hasilBil);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilBil);