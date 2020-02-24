I = imread('coins.jpg');
figure;
subplot(2,3,1); 
imshow(I);
title("Original Image");
I = rgb2gray(I);
s_pic =I;
l_pic =I;
subplot(2,3,2); 
imshow(I);
title("Gray Image");
I = im2bw(I);
subplot(2,3,3); 
imshow(I);
title("Binary Image");
I = imfill(I,'holes');
S =[ 1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1;
     1 1 1 1 1 1 1 1 1] ;
 R = I;
 dim = floor(9/2);
 e = R;
[row_e,col_e]=size(R);

for i=1:row_e-2*dim
    for j=1:col_e-2*dim
        N = R(i:i+2*dim,j:j+2*dim);
        N = N.*S;
        e(i+dim,j+dim) = min(N(:));
    end
end
 subplot(2,3,4); 
 imshow(e);
 title("Erosion on filled Image");

 [L, n] = bwlabel(e,8);
 test = L(:);
 
 
 [r, c]= size(test);
 disp("Total Coin: ");
 disp(n);
 count = zeros(n,1);
 temp = 0;
 for i = 1:n
     temp = 0;
     for j = 1:r
        if test(j)== i
           temp = temp+1; 
        end
     end
     count(i) = temp;
 end

 th = mean(count);
 small_coin = 0;
 large_coin =  0;
 for i = 1:n
     if count(i) < th
         small_coin = small_coin+1;
     else 
         large_coin = large_coin+1;
     end
     
 end

subplot(2,3,5); 
imshow(I);
title(['Large Coins = ',num2str(large_coin)]);
subplot(2,3,6);
imshow(I);
title(['Small Coins = ',num2str(small_coin)]);