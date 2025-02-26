function att1 = TestingModelFinal(c)
load myNet1;
faceDetector=vision.CascadeObjectDetector;
name = ["Ramisa","Ramim","Zeal","Anindya","Tasmin","Samiyee"];
n = length(name);
att = zeros(1,n);
att1 = strings;
idx=1;
for idx = 1:50

    e=c.snapshot;

    bboxes =step(faceDetector,e);

    if(sum(sum(bboxes))~=0)

        es=imcrop(e,bboxes(1,:));

        es=imresize(es,[227 227]);

        label=classify(myNet1,es);
        for i=1:n
            if strcmp(name(i),char(label)) == 1
                j = i;
                att(1,j) = 1;
                break
            end
        end
        for i=1:n
            if att(1,i) == 1
                att1(i) = "present";
            else att1(i) = "absent";
            end
        end
    end
    idx = idx + 1;
end
clear('cam')
