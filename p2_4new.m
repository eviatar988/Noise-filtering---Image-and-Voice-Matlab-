[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('EVIATAR','EYAL');

%x1: 
h1_padded = [imp_resp_image zeros(3,123);zeros(125,128)]; 
DFT_y1 = my_fft(dist_image_1); 
DFT_h1 = my_fft(h1_padded); 
DFT_x1 = DFT_y1./DFT_h1; x_n1 = my_ifft(DFT_x1); 
x_n1 = abs(x_n1); 
figure 
imshow(x_n1); 
hold on; 
title('x1');

%x2: 
h2_padded = [imp_resp_image zeros(3,165);zeros(67,170)]; 
DFT_y2 = my_fft(dist_image_2); 
DFT_h2 = my_fft(h2_padded); 
DFT_x2 = DFT_y2./DFT_h2; 
x_n2 = my_ifft(DFT_x2); 
x_n2 = abs(x_n2); 
figure 
imshow(fftshift(x_n2)); 
hold on; 
title('x2');


function [X] = my_fft(x)
    N = numel(x);
    
    if N == 1
        X = x;
    else
        x_even = my_fft(x(1:2:end));
        x_odd = my_fft(x(2:2:end));
        
        factor = exp(-2i*pi*(0:N/2-1)/N);
        X = [x_even + factor.*x_odd, x_even - factor.*x_odd];
    end
end

function [x] = my_ifft(X)
    N = numel(X);
    
    if N == 1
        x = X;
    else
        X_conj = conj(X);
        x_conj = my_fft(X_conj);
        x = conj(x_conj)/N;
    end
end