clc
clear all
close all
warning off;

f = VideoReader("Zeal.mp4")
n = f.NumberOfFrames;

faceDetector=vision.CascadeObjectDetector;
pic=200;
temp=1;
for img=1:n 
    b= read(f, img)
    bboxes =step(faceDetector,b);
    if(sum(sum(bboxes))~=0)
    if(temp>pic)
        break;
    else
    cr=imcrop(b,bboxes(1,:));
    cr=imresize(cr,[227 227]);
    filename=strcat(num2str(temp),'.bmp');
    imwrite(cr,filename);
    temp=temp+1;
    imshow(cr);
    drawnow;
    end
    else
        imshow(b);
        drawnow;
    end
end