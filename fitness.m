function F=fitness(X) 
m=46;
%X=[3,2,1,2,1,3,3,6,3,2,1,2,1,2,2,2;
   %3,2,1,2,1,3,3,6,3,2,3,2,1,2,2,2];
for i = 1:size(X,1)
    idx = floor(X(i,:));
x = zeros(1,m+1);
%temp = [0,3,5,7,9,12,15,18,24,27,31,33,36,39,41,43];
temp = [0,3,5,7,9,12,15,18,22,26,30,33,36,39,41,44];
 x(idx(idx>0)+temp) = 1;
    %if x(9)~=x(41)
        %x(41)=x(9);
        %x(40)=1-x(41);%û����
    %end
    if (x(3)~=x(41))
        x(41)=x(3);
        x(40)=1-x(41);%û����
    end
    if (x(3)~=x(18))&&(x(3)==1)
        x(18)=1;
        x(16)=0;
        x(17)=0;
    elseif (x(3)~=x(18))&&(x(3)==0)
        x(18)=0;
        x(16)=round(rand(1));
        x(17)=1-x(16);
    end
    if (x(14)~=x(29))&&(x(29)==1)
        x(14)=x(29);
        x(13)=0;
        x(15)=0;
    elseif (x(14)~=x(29))&&(x(29)==0)
        x(14)=x(29);
        x(13)=round(rand(1));
        x(15)=1-x(13);
    end
    if (x(26)~=x(33))&&(x(26)==1)
        x(33)=x(26);
        x(31)=0;
        x(32)=0;
    elseif (x(26)~=x(33))&&(x(33)==1)
        x(26)=x(33);
        x(23)=0;
        x(24)=0;
        x(25)=0;
    end
    %if (x(25)==x(32))&&(x(25)==1)
        %x(32)=0;
        %x(33)=round(rand(1));
        %x(31)=1-x(33);
    %elseif (x(25)==1)&&(x(25)==0)
       % x(32)=1;
       % x(33)=0;
       % x(31)=0;  
    %end
    if  (x(1)==x(46))&&(x(1)==1)
        x(46)=0;
        x(45)=1;
    elseif (x(1)==x(46))&&(x(1)==0)
        x(46)=1;
        x(45)=0;
    end
    if (x(1)~=x(44))&&(x(1)==1)
        x(44)=1;
        x(42)=0;
        x(43)=0;
    elseif (x(1)~=x(44))&&(x(1)==0)
        x(44)=0;
        x(42)=round(rand(1));
        x(43)=1-x(42);
    end
    if (x(1)~=x(38))&&(x(1)==0)
        x(38)=0;
        x(37)=round(rand(1));
        x(39)=1-x(37);
    elseif (x(1)~=x(38))&&(x(1)==1)
        x(38)=1;
        x(37)=0;
        x(39)=0;
    end
    x(end)=1;
%F=zeros(m,3);
%X=[0,1,0,1,0,1,0,0,1,1,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1];
cost=[20;60;90;12;6;50;46;60;120;25;12;5;88;74;160;9.7;32;68;91.5;192;457;330;10;32;95;0;34;22;9.3;13;6;8;0;70;96;82;94;12;63;60;190;120;250;0;10;60;0];
%cost=[20;60;90;12;6;50;46;60;120;25;12;5;88;74;160;9.7;32;68;91.5;82;192;120;457;330;10;32;95;0;34;22;9.3;13;6;8;0;70;96;82;94;12;63;60;190;120;250;0;10;60;0];
time=[4,5,7,2,3,5,4,5,8,2,1,1,4,5,8,2,3,3,5,6,8,9,2,3,4,0.0001,1,1,2,2,2,2,0.0001,22,17,18,5,2,3,1,3,2,1,0.0001,2,7,0];
Performance=[2.2536;3.021;4.413;1.3316;1.1752;3.1117;2.6443;2.7841;4.3469;2.9276;1.5422;0.7678;3.2566;3.5556;4.4718;0.9294;2.4122;3.489;...
             2.5455;3.4893;4.4145;3.9573;1.1428;2.5224;4.5216;0;3.0849;2.6397;1.5473;2.1687;0.3005;0.9015;0;3.1578;4.0938;...
             3.6306;3.7023;1.2287;2.6271;2.9253;4.3389;4.0068;4.9488;0;1.0088;3.116;0];
%The first function 
F(i,1)=x*cost;
%The second function
B=[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
   0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
   0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0;%M5
   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
   0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
   0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
   0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0;%M9
   0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
   0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
   0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;%M12
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;%M13
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;%M14
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0;
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1;];
nu=size(B,2);
rr=x.*time;
CC=rr(rr~=0)';
pp=repmat(CC,1,nu);
C=pp.*B;
%C=timehandle(x,A,m);
n1=size(C,2);
ST=zeros(1,n1);
  for k=2:n1
      tt=0;
      for l=1:(k-1)
          if (C(l,k)>0)&&(C(l,k))~=0.0001
              tt=[tt,C(l,k)+ST(l)];
          elseif C(l,k)==0.0001
              C(l,k)=0;
              tt=[tt,C(l,k)+ST(l)];
          end
      end
      ST(k)=max(tt);
  end
  F(i,2)=ST(n1);
%The third function
%F(i,3)=-(x*Performance-26.5234)/(56.6129-26.5234);
F(i,3)=-x*Performance;
%F(i,3)=-(x*Performance);
end