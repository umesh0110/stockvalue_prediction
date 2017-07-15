clear all
close=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','f2:f246');
close=transpose(close);
xd=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','j2:j246');
%xd=transpose(xd);
open=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','c2:c246');
open=transpose(open);
low=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','e2:e246');
low=transpose(low);
high=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','d2:d246');
high=transpose(high);
x=[open(2:201);low(2:201);high(2:201);close(1:200)];
t=close(2:201);
net = feedforwardnet(10);
%net=cascadeforwardnet(10);
net = configure(net,x,t);
net.trainFcn='trainbr';
net = train(net,x,t);
net = train(net,x,t);
%testdc=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','f201:f246');
%testdo=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','c201:c246');
%testdh=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','d201:d246');
%testdl=xlsread('C:\Users\sacin varma\Documents\vit\data warehousing and data mining\project progress\dataset.xlsx','e201:e246');
testd(1)=close(201);
for(i=201:244)
    testd(i-199)=net([open(i+1);low(i+1);high(i+1);testd(i-200)]);
end
testdc=net([open(201:245);low(201:245);high(201:245);close(200:244)]);
s=size(testd);
figure('name','neural networks taking predicted values as input');
plot(testd(2:s(2)),'r')
hold on
plot([close(202:245)],'b')
ylabel('Share Price');
xlabel('Opening Data');
legend('Actual Price','Predicted Price');
hold off
figure('name','neural networks taking past close values as input');
plot(testdc(2:s(2)),'r')
hold on
plot([close(202:245)],'b')
ylabel('Share Price');
xlabel('Opening Data');
legend('Actual Price','Predicted Price');
hold off


me=0;
for i=1:44
    me=me+abs(close(i+201)-testd(i+1));
    
end
me=me/44;
fprintf('neural networks using predicted close mean error =%d\n',me);
me=0;
for i=1:44
    me=me+abs(close(i+201)-testdc(i+1));
    
end
me=me/44;
fprintf('neural networks using past close mean error =%d\n',me);


%%umesh regression
dataset=[open(1:200);low(1:200);high(1:200)];
y=[close(1:200)];
yt=transpose(y);
X = [ones(size(open(1:200))); open(1:200); high(1:200); low(1:200)]; 
xt=transpose(X);
b = regress(yt,xt);
Xf = [ones(size(open(201:245))); open(201:245); high(201:245); low(201:245)];
xft=transpose(Xf);
closefin=xft*b;

figure('name','regression');
plot(closefin,'r')
hold on
plot(close((201:245)),'b')
ylabel('Share Price');
xlabel('Opening Data');
legend('Actual Price','Predicted Price');
hold off

me=0;
for i=1:44
    me=me+abs(close(i+200)-closefin(i));
    
end
me=me/45;
fprintf('regression mean error =%d\n',me);

%%abinay
dataset=[open;low;high;close];
a=[open(1:200);low(1:200);high(1:200)];
b=close(1:200);
X=transpose(a);
Y=transpose(b);
Md1 = TreeBagger(20,X,Y,'Method','regression');
predX = X;
mpgMean = predict(Md1,predX);

%figure(3);
%plot(close,'o');
%hold on
%plot(mpgMean,'g');
%xlabel('Opening Data');
%legend('Data','Mean Response','First quartile','Median','Third quartile');

c=[open(201:245);low(201:245);high(201:245)];
d=close(201:245);
predX1=transpose(c);
Y1=transpose(d);
mpgMean1 = predict(Md1,predX1);

Y1;
mpgMean1;

figure('name','random forest');
plot(d,'r');
hold on
plot(mpgMean1,'b');
ylabel('Share Price');
xlabel('Opening Data');
legend('Actual Price','Predicted Price');

me=0;
for i=1:45
    me=me+abs(d(i)-mpgMean1(i));
end
me=me/45;
fprintf('random forest mean error =%d\n',me);

%%display plots
figure('name','algorithms comparision');
hold on
plot(mpgMean1,'g');
plot(closefin,'r');
plot(testd(1:s(2)),'b');
plot(testdc(1:s(2)),'m')
plot([close(201:245)],'k');
legend('random forest','regression','neural networks using predicted close','neural networks using past close','actual');
hold off
