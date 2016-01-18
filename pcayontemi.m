
function [taninma dbadi recognized_img]=pcayontemi(datapath,test_image)
D = dir(datapath); 
imgcount = 0;
for i=1 : size(D,1)
    if not(strcmp(D(i).name,'.')|strcmp(D(i).name,'..')|strcmp(D(i).name,'Thumbs.db'))
        imgcount = imgcount + 1;
    end
end
X = [];
for i = 1 : imgcount
    str = strcat(datapath,'\',int2str(i),'.jpg');
    img = imread(str);
    img = rgb2gray(img);
    [r c] = size(img);
    temp = reshape(img',r*c,1);  
    X = [X temp];                
end
m = mean(X,2);
imgcount = size(X,2);
A = [];
for i=1 : imgcount
    temp = double(X(:,i)) - m;
    A = [A temp];
end
L= A' * A;
[V,D]=eig(L); 
L_eig_vec = [];
for i = 1 : size(V,2) 
        L_eig_vec = [L_eig_vec V(:,i)];
end
eigenfaces = A * L_eig_vec; %
projectimg = [ ]; 
for i = 1 : size(eigenfaces,2)
    temp = eigenfaces' * A(:,i);
    projectimg = [projectimg temp];
end
test_image = test_image(:,:,1);
[r c] = size(test_image);
temp = reshape(test_image',r*c,1); 
temp = double(temp)-m; 
projtestimg = eigenfaces'*temp; 
euclide_dist = [ ];
for i=1 : size(eigenfaces,2)
    temp = (norm(projtestimg-projectimg(:,i)))^2;
    euclide_dist = [euclide_dist temp];
end
euclide_dist/1.0e+17
[euclide_dist_min recognized_index] = min(euclide_dist);
taninma = euclide_dist_min/1.0e+17;
dbadi = recognized_index;
recognized_img = strcat(int2str(recognized_index),'.jpg');
