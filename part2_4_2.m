% Q2-7)
[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('EVIATAR','EYAL');

%X1:
h1_padded = [imp_resp_image zeros(3,123);zeros(125,128)];
DFT_y1 = d_fft(dist_image_1); 
DFT_h1 = d_fft(h1_padded); 
DFT_x1 = DFT_y1/DFT_h1; 
x_n1 = d_ifft(DFT_x1); 
x_n1 = abs(x_n1); 
figure ;
imshow(x_n1);
hold on; 
title('x_1[m,n]');

%--------------------------------------------------------
%imshow(matrix)
%imshow(d_fft(matrix))
%imshow(d_ifft(d_fft(matrix)))
%--------------------------------------------------------

function X = d_fft(x)
n = 32;   % Number of rows
m = 64;   % Number of columns

	% Perform FFT on COLUMNS
    fft_columns = zeros(n,m);  

    for col = 1:m
        fft_columns(:, col) = my_fft(x(:, col));    
    end

    % Perform FFT on rows
    X = zeros(n, m);
    for row = 1:n
        X(row, :) = my_fft(fft_columns(row, :));
    end

end


function x = d_ifft(X)
n = 32;   % Number of rows
m = 64;   % Number of columns

	% Perform IFFT on COLUMNS
    ifft_columns = zeros(n, m);  
    for col = 1:m
        ifft_columns(:, col) = my_ifft(X(:,col));
    end

    % Perform IFFT on rows
    x = zeros(n, m);
    for row = 1:n
        x(row, :) = my_ifft(ifft_columns(row, :));
    end
end
%---------------------------------------------------------
function X = my_fft(x)
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

function x = my_ifft(X)
    N = numel(X);
    
    if N == 1
        x = X;
    else
        X_conj = conj(X);
        x_conj = my_fft(X_conj);
        x = conj(x_conj)/N;
    end
end

%---------------------------------------------------------

%Q2.7)



