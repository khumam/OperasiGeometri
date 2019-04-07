clear all;
%twirl

ori = imread('/home/ccnkss/Documents/Kuliah/Citra/me.jpg');

dimensi = size(ori);
tinggi = dimensi(1);
lebar = dimensi(2);
xc = round(lebar / 2);
yc = round(tinggi / 2);
alpha = 43 * pi / 180;
rmaks = 0.5 * sqrt(xc^2 + yc ^ 2); % 1/2 diagonal citra

for y=1 : tinggi
  for x=1 : lebar
    r = sqrt((x-xc)^2+(y-yc)^2);
    beta = atan2(y-yc, x-xc) + alpha * (rmaks -r) / rmaks;
    x2 = xc + r * cos(beta);
    y2 = yc + r * sin(beta);
    
    if (x2>=1) && (x2<=lebar) && (y2>=1) &&(y2<=tinggi)
      
      % Lakukan interpolasi bilinear
      p = floor(y2);
      q = floor(x2);
      a = y2-p;
      b = x2-q;
      
      if (floor(x2)==lebar) || (floor(y2) == tinggi)
        hasilTwirl(y, x) = ori(floor(y2), floor(x2));
      else
        intensitas = (1-a)*((1-b)*ori(p,q) + b * ori(p, q+1)) + a *((1-b)* ori(p+1, q) + b * ori(p+1, q+1));
        hasilTwirl(y, x) = intensitas;
      end
    else
      hasilTwirl(y, x) = 0;
    end
  end
end

hasilTwirl = uint8(hasilTwirl);
figure(1);
subplot(1,2,1); imshow(ori);
subplot(1,2,2); imshow(hasilTwirl);