testdata=[];
testlabel=[];

load 'test_batch.mat'
testdata=[testdata;data];
testlabel=[testlabel;labels];

fidd=fopen('E:/test_feartures.txt','w');
tic;
for t=1:10000
    R=testdata(t,1:1024);
    G=testdata(t,1025:2048);
    B=testdata(t,2049:3072);
    
    A(:,:,1)=reshape(R,32,32);
    A(:,:,2)=reshape(G,32,32);
    A(:,:,3)=reshape(B,32,32);
    
    
    clear param;
%param.imageSize = [256 256]; % it works also with non-square images
param.orientationsPerScale = [8 8 8 8];
param.numberBlocks = 4;
param.fc_prefilt = 4;

[gist, param] = LMgist(A, '', param);
fprintf(fidd,'%d ',testlabel(t));
for i=1:512
    
    fprintf(fidd,'%d:%g ',i,gist(1,i));
    
end
if(mod(t,100)==0)
    t
end
fprintf(fidd,'\n');

end
fprintf('×Ü¼Æ consuming time %f minutes \n ',toc/60.0);






