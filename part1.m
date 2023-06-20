% Example usage
x = [1, 4, 2, 9];
X = my_fft(x);
reconstructed_x = my_ifft(X);

disp('Original signal:');
disp(x);
disp('FFT:');
disp(X);
disp('Reconstructed signal:');
disp(reconstructed_x);


% -----------------------------------------------------
%Q1

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

%---------------------------------------------------------------------
