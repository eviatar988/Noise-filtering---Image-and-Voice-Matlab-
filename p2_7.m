[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('EVIATAR','EYAL');

%x1: 
padded_h1 = [imp_resp_image zeros(3,123);zeros(125,128)]; 
Y1 = fft_2d(dist_image_1); 
H1 = fft_2d(padded_h1); 
X1 = Y1./H1;
x1 = abs(Ifft_2d(X1)); 
figure 
imshow(x1); 
hold on; 
title('x1');

%x2: 
h2_padded = [imp_resp_image zeros(3,165);zeros(67,170)]; 
Y2 = fft_2d(dist_image_2); 
H2 = fft_2d(h2_padded); 
X2 = Y2./H2; 
x2 = abs(Ifft_2d(X2)); 

figure 
imshow(fftshift(x2)); 
hold on; 
title('x2');


function [Xk] = fft_2d(xn)
xn=fft(xn);
Xk=fft(xn.');
Xk=Xk.';
end

function [xn] = Ifft_2d(Xk)
xn=ifft(Xk);
xn=ifft(xn.');
xn=xn.';
end