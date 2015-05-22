sumdata=[];
sumdata1=[];
load 'data_batch_1.mat'
sumdata=[sumdata;data];
sumdata1=[sumdata1;labels];

load 'data_batch_2.mat'
sumdata=[sumdata;data];
sumdata1=[sumdata1;labels];

load 'data_batch_3.mat'
sumdata=[sumdata;data];
sumdata1=[sumdata1;labels];

load 'data_batch_4.mat'
sumdata=[sumdata;data];
sumdata1=[sumdata1;labels];

load 'data_batch_5.mat'
sumdata=[sumdata;data];
sumdata1=[sumdata1;labels];

fid = fopen('E:/Feartures.txt','w');
tic; %计算消耗时间
for t=1:500
    Red=sumdata(t,1:1024); 
     Green=sumdata(t,1025:2048); 
     Blue=sumdata(t,2049:3072);

 	Image(:,:,1)=reshape(Red,32,32); 
     Image(:,:,2)=reshape(Green,32,32);
 	Image(:,:,3)=reshape(Blue,32,32);

clear param;
%param.imageSize = [256 256]; % it works also with non-square images
param.orientationsPerScale = [8 8 8 8];
param.numberBlocks = 4;
param.fc_prefilt = 4;

[gist1, param] = LMgist(Image, '', param);
fprintf(fid,'%d ',sumdata1(t));
for ii=1:512   
  %fprintf(fid,'%d:%g %d:%g %d:%g %d:%g %d:%g %d:%g %d:%g %d:%g ',ii,gist1(1,ii),ii+2,gist1(1,ii+2),ii+3,gist1(1,ii+3),ii+4,gist1(1,ii+4),ii+5,gist1(1,ii+5),ii+6,gist1(1,ii+6),ii+7,gist1(1,ii+7));
    fprintf(fid,'%d:%g ', ii, gist1(1, ii));
end
 if (mod(t,100)==0)
     t
 end
    fprintf(fid,'\n');
% Visualization
end
fclose(fid);
fprintf('总计 consuming time %f minutes \n ',toc/60.0);


