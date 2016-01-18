clear all
close all
clc
datapath = 'C:\Users\erdems\Desktop\Yüz Tanıma\Databases'; 
TestImage = 'C:\Users\erdems\Desktop\Yüz Tanıma\Test\4.jpg';
A = imread(TestImage);
FaceDetector = vision.CascadeObjectDetector();
BBOX = step(FaceDetector, A); 
resimsayisi = size(BBOX,1);
anaresim = zeros(1,resimsayisi);
tanit = []; 
for sayi=1:resimsayisi
    I2 = imcrop(A,BBOX(sayi,:));
    I2 = imresize (I2,[200 180]);   
    [taninma dbadi recog_img] = pcayontemi(datapath,I2);
    taninma
    dbadi
    recog_img
    anaresim(1,sayi) = dbadi;
    tanit(sayi) = taninma;
end

word = cell(1); 
for i=1:length(anaresim)
    olanbu = eslestir(anaresim(i), tanit(i));
    word(i) = {olanbu};
end
B = insertObjectAnnotation(A,'rectangle', BBOX, word,'TextBoxOpacity',0.8,'FontSize',30);
imshow(B);
