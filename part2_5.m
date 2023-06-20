%PART 2.5
%[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('EVIATAR','EYAL')


% Plot dist_image_1
%subplot(2, 2, 1);
%imshow(dist_image_1);
%title('dist\_image\_1');

% Plot dist_image_2
%subplot(2, 2, 2);
%imshow(dist_image_2);
%title('dist\_image\_2');

% Plot noised_image
%subplot(2, 2, 3);
%imshow(noised_image);
%title('noised\_image');

% Plot imp_resp_image
%subplot(2, 2, 4);
%imshow(imp_resp_image);
%title('imp\_resp\_image');

% compute THE DTFT of H0
n=2;
h0=[ 0;0;0.0909];
w=[0 2*pi/6 4*pi/6 8*pi/6];
H0=exp(-1i*w'*n)*h0';
%disp(H0)
%-----------------------------------------------------------
%Q2.6 
%subplot(2,1,1)
w = [1 zeros(1, 28) 1]; %  creat w[n] from 2 delta
stem(0:length(w)-1, w); 
title('w[n]');
xlabel('n'); 
ylabel('w[n]'); 

% cyclic convolution with h0
cyclic_conv = cconv(h0, w, 32); 

% result of convolution
%subplot(2,1,2);
stem(0:length(cyclic_conv)-1, cyclic_conv);
title('after convolution');
xlabel('n'); 
ylabel('The cyclic convolution'); 

%Q2.7)

%x1:
h1_padded = [imp_resp_image zeros(3,123);zeros(125,128)];



