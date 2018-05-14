utf-8
clear
clc
format long;
v=1;
M=4;
N=1000;%%%%%%%������
f0=21*10^3;%%%%%%%%%%%�ź�����ŵ�Ƶ��
f1=11*10^3;
f2=15*10^3;
omiga0=2*pi*f0;%%%%%%%�ź�����ŵĽ�Ƶ��
omiga1=2*pi*f1;
omiga2=2*pi*f2;
sita0=0.8; %�źŷ���
sita1=0.4; %���ŷ���1
sita2=2.1; %���ŷ���2
for t=1:N           %%%%%%%%%%%%�ź�
    adt(t)=sin(omiga0*t/(N*f0));
    a1t(t)=sin(omiga1*t/(N*f1));
    a2t(t)=sin(omiga2*t/(N*f2));
end
for i=1:M    %%%%%%%%%%%%�źŵĵ���ʸ�����������ʽ
    ad(i,1)=exp(j*(i-1)*pi*sin(sita0));
    a1(i,1)=exp(j*(i-1)*pi*sin(sita1));
    a2(i,1)=exp(j*(i-1)*pi*sin(sita2));
end
R=zeros(M,M);
for t=1:N
 x=adt(t)*ad+a1t(t)*a1+a2t(t)*a2; %���ж��źŵ�������Ӧ
     R=R+x*x';%�źŵ�Э�������
end
R=R/N;%%%%%%%%%Э����������п�������ƽ��
miu=1/(ad'*inv(R)*ad);%%%%%%���ò����LMS�㷨�Ĺ�ʽ�������Ҽǲ�̫�壬������������Ȩֵ�����������ʽ�����Ȼ���Ȩ
w=miu*inv(R)*ad;
%%%%%%�γɲ���%%%%%%%%%%%%%%%%%%%
for sita=0:pi/100:pi
    for i=1:M
        x_(i,1)=exp(j*(i-1)*pi*sin(sita));
    end
    y(1,v)=w'*x_;%%%%%%%���źŽ��м�Ȩ����������
    v=v+1;
end
y_max=max(y(:));%%%%%%%%%%%%%%%��һ��
y_1=y/y_max;
y_db=20*log(y_1);
 
sita=0:pi/100:pi;
plot(sita,y)
Xlabel('sitaa')
Ylabel('��������db')
%%4��Ԫ������������Ӧ�����γ�
%Ŀ��
clear
clc
format long;
v=1;
M=4;%��Ԫ��
N=100;
f0=21*10^3;
omiga0=2*pi*f0;
sita0=0.6;%�źŷ��� 
for t=1:N
    adt(t)=sin(omiga0*t/(N*f0));    
end
for i=1:M
    ad(i,1)=exp(j*(i-1)*pi*sin(sita0));
end
R=zeros(4,4);
r=zeros(4,1);
for t=1:N
    x=adt(t)*ad;
    R=R+x*x.';
end
R=R/N;
miu=1/(ad.'*inv(R)*ad);
w=miu*inv(R)*ad;
for sita=0:pi/100:pi/2
    for i=1:M
        a(i,1)=exp(j*(i-1)*pi*sin(sita));
    end
    y(1,v)=w.'*a;
    v=v+1;
end
sita=0:pi/100:pi/2;
plot(sita,y)
xlabel('sita')
ylabel('��������db')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%�ҵĳ���%%%%%%%%%%%%%%%
function jieshousignal
%�����ź�����1��
%�����ź�����4��
%�������֪
%�������֪
%��λ����֪
clc;
clear all;
close all;
%//��������===========================================
www1=0;
www2=0;
www3=0;
% for rrr=1:16000
signal_num=1;  %signal number
noise_num=5;   %interference number
R0=0.6;          %Բ�İ뾶
SP=2000;       %Sample number
N=8;           %��Ԫ��
snr=-10;         %Signal-to-Noise
sir1=10;      %Signal-to-Interference one 
sir2=10;      %Signal-to-Interference two 
sir3=10;      %Signal-to-Interf
sir4=10;
sir5=10;
%//================noise Power-to-signal Power==================== 
factor_noise_1=10.^(-sir1/10);
factor_noise_2=10.^(-sir2/10);
factor_noise_3=10.^(-sir3/10);
factor_noise_4=10.^(-sir4/10);
factor_noise_5=10.^(-sir5/10);
factor_noise_targe=10.^(-snr/10);
% //======================== ===============
d1=85*pi/180;%%����1�ķ�λ��
d2=100*pi/180;%����2�ķ�λ��
d3=147*pi/180;%����3�ķ�λ��
d4=200*pi/180;%����4�ķ�λ��
d5=250*pi/180;%����5�ķ�λ��
d6=150*pi/180;%Ŀ��ķ�λ��
e1=15*pi/180;%%����1�ĸ�����
e2=25*pi/180;%����2�ĸ�����
e3=85*pi/180;%����3�ĸ�����
e4=50*pi/180;%����4�ĸ�����
e5=70*pi/180;%����5�ĸ�����
e6=85*pi/180;%Ŀ��ĸ�����
% //====================Ŀ���ź�==========================
t=1:1:SP;
fc=2e7;
Ts=1/(3e10);
S0=5*cos(2*pi*fc*t*Ts);%Ŀ���ź�
for kk=1:N
    phi_n(kk)=2*pi*(kk-1)/N;
end
%//====================����ʸ��==========================================
A=[conj(exp(j*2*pi*R0*cos(d6-phi_n)*sin(e6)));conj(exp(j*2*pi*R0*cos(d1-phi_n)*sin(e1)));conj(exp(j*2*pi*R0*cos(d2-phi_n)*sin(e2)));conj(exp(j*2*pi*R0*cos(d3-phi_n)*sin(e3)));conj(exp(j*2*pi*R0*cos(d4-phi_n)*sin(e4)));conj(exp(j*2*pi*R0*cos(d5-phi_n)*sin(e5)))]';
A1=[conj(exp(j*2*pi*R0*cos(d1-phi_n)*sin(e1)));conj(exp(j*2*pi*R0*cos(d2-phi_n)*sin(e2)));conj(exp(j*2*pi*R0*cos(d3-phi_n)*sin(e3)));conj(exp(j*2*pi*R0*cos(d4-phi_n)*sin(e4)));conj(exp(j*2*pi*R0*cos(d5-phi_n)*sin(e5)))]';
% //==========================================================Power of the interference 
% // depending on the signal power and SIR
Ps1=0;
Ps2=0;
Ps3=0;
Ps4=0;
Ps5=0;
S1=zeros(1,SP);
S2=zeros(1,SP);
S3=zeros(1,SP);
S4=zeros(1,SP);
S5=zeros(1,SP);
Ps0=S0*S0'/SP;  % signal power
Ps1=Ps0*factor_noise_1;
Ps2=Ps0*factor_noise_2;
Ps3=Ps0*factor_noise_3;
Ps4=Ps0*factor_noise_4;
Ps5=Ps0*factor_noise_5;
% //==========================�����źŵ��������=========================
S1=normrnd(0,sqrt(Ps1/2),1,SP)+j*normrnd(0,sqrt(Ps1/2),1,SP);
S2=normrnd(0,sqrt(Ps2/2),1,SP)+j*normrnd(0,sqrt(Ps2/2),1,SP);
S3=normrnd(0,sqrt(Ps3/2),1,SP)+j*normrnd(0,sqrt(Ps3/2),1,SP);
S4=normrnd(0,sqrt(Ps4/2),1,SP)+j*normrnd(0,sqrt(Ps4/2),1,SP);
S5=normrnd(0,sqrt(Ps5/2),1,SP)+j*normrnd(0,sqrt(Ps5/2),1,SP);
%//
S=[S0;S1;S2;S3;S4;S5];
SS1=[S1;S2;S3;S4;S5];
 X=A*S;%�źżӸ���
 XX2=A1*SS1;         %���յ��ĸ��� 
 Pw_noise=sqrt(Ps0*factor_noise_targe/2);
 a1=randn(N,SP);
 a2=randn(N,SP);
 a1=a1/norm(a1);
 a2=a2/norm(a2);
 W=Pw_noise*(a1+sqrt(-1)*a2);
 X=X+W;
%  //--------------------------SMI�㷨----------------------------------------
Rd=X*S0'/SP;
R=X*X'/(SP*1);
Wc_SMI=pinv(R)*Rd./(Rd'*pinv(R)*Rd);%Ȩ����
Wc_SMI=Wc_SMI/norm(Wc_SMI);
Y_SMI=Wc_SMI'*X;      %SMI�㷨�ָ��������ź�
%//-------------------------------------GS�㷨------------------
m=1;
for i=1:400:2000
   X2(:,m)=XX2(:,i);
   m=m+1;
end
a=zeros(1,8);
phi_n=zeros(1,8);
phi=0:pi/180:2*pi;
theta=0:pi/180:pi/2;
for kk=1:8
    a(kk)=1;
    phi_n(kk)=2*pi*(kk-1)/8;
end
x1=zeros(1,8);
x2=zeros(1,8);
x3=zeros(1,8);
x4=zeros(1,8);
x5=zeros(1,8);
x1=X2(:,1)';
x2=X2(:,2)';
x3=X2(:,3)';
x4=X2(:,4)';
x5=X2(:,5)';
Z1=x1;
Z1_inner_product=Z1.*conj(Z1);
Z1_mode=sqrt(sum(Z1_inner_product));
Y1=Z1./Z1_mode;
Inner_product=sum(x2.*conj(Y1));
Z2=x2-Inner_product*Y1;
Z2_inner_product=sum(Z2.*conj(Z2));
Z2_mode=sqrt(Z2_inner_product);
Y2=Z2./Z2_mode;
Inner_product1=sum(x3.*conj(Y1));
Inner_product2=sum(x3.*conj(Y2));
Z3=x3-Inner_product1*Y1-Inner_product2*Y2;
Z3_inner_product=sum(Z3.*conj(Z3));
Z3_mode=sqrt(Z3_inner_product);
Y3=Z3./Z3_mode;
Inner_product1_0=sum(x4.*conj(Y1));
Inner_product2_0=sum(x4.*conj(Y2));
Inner_product3_0=sum(x4.*conj(Y3));
Z4=x4-Inner_product1_0*Y1-Inner_product2_0*Y2-Inner_product3_0*Y3;
Z4_inner_product=sum(Z4.*conj(Z4));
Z4_mode=sqrt(Z4_inner_product);
Y4=Z4./Z4_mode;
Inner_product1_1=sum(x5.*conj(Y1));
Inner_product2_1=sum(x5.*conj(Y2));
Inner_product3_1=sum(x5.*conj(Y3));
Inner_product4_1=sum(x5.*conj(Y4));
Z5=x5-Inner_product1_1*Y1-Inner_product2_1*Y2-Inner_product3_1*Y3-Inner_product4_1*Y4;
Z5_inner_product=sum(Z5.*conj(Z5));
Z5_mode=sqrt(Z5_inner_product);
Y5=Z5./Z5_mode;
%Y1
%Y2
%Y3
%Y4
%Y5
 w0=zeros(1,8);
 w=zeros(1,8);
 for mm=1:8;
     w0(mm)=exp(-j*2*pi*R0*cos(d6-phi_n(mm))*sin(e6));
 end
 dd1=sum(w0.*conj(Y1))*Y1;
 dd2=sum(w0.*conj(Y2))*Y2;
 dd3=sum(w0.*conj(Y3))*Y3;
 dd4=sum(w0.*conj(Y4))*Y4;
 dd5=sum(w0.*conj(Y5))*Y5;
 w=w0-dd1-dd2-dd3-dd4-dd5;
Wc_GS=w;
Wc_GS=Wc_GS/(norm(Wc_GS));
Y_GS=Wc_GS*X;    %GS�㷨�ָ�������ͼ��
%//----------------------------------MMSE�㷨-----------------------
Rd=X*S0'/SP;
R=X*X'/(SP*1);
Wc_MMSE=pinv(R)*Rd;
Wc_MMSE=Wc_MMSE/norm(Wc_MMSE);
Y_MMSE=Wc_MMSE'*X;      %MMSE�㷨�ָ��������ź�
S0=S0/norm(S0);
Y_GS=Y_GS/norm(Y_GS);
Y_SMI=Y_SMI/norm(Y_SMI);
Y_MMSE=Y_MMSE/norm(Y_MMSE);
% figure(1)
% plot(real(S0));
% title('ԭʼ�ź�');
% xlabel('����������');
% ylabel('�źŷ���');
% figure(2)
% plot(real(Y_SMI));
% title('����SMI�㷨��������ź�');
% xlabel('����������');
% ylabel('�źŷ���');
% figure(3)
% plot(real(Y_GS));
% title('����G-S�㷨��������ź�');
% xlabel('����������');
% ylabel('�źŷ���');
% figure(4)
% plot(real(Y_MMSE));
% for i=1:SP
%   ss(i)=abs(S0(i)-Y_SMI(i))^2;
% end
% q_1=mean(ss);
% for i=1:SP
%     ss1(i)=abs(S0(i)-Y_GS(i))^2;
% end
% q_2=mean(ss1);
% for i=1:SP
%     ss2(i)=abs(S0(i)-Y_MMSE(i))^2;
% end
% q_3=mean(ss2);
% 
% www1=www1+q_1;
% www2=www2+q_2;
% www3=www3+q_3;
% end
% www1/16000
% www2/16000
% www3/16000
phi=0:pi/180:2*pi;
theta=0:pi/180:pi/2;
% 
% % //------------------------ �γɲ���-----------------------------------------
 F_mmse=zeros(91,361); 
 F_smi=zeros(91,361); 
 F_gs=zeros(91,361); 
for mm=1:91
    for nn=1:361                
            p1=sin(theta(mm));
            p2=cos(phi(nn));
            p3=sin(phi(nn));
            
            q1=sin(e6);
            q2=cos(d6);
            q3=sin(d6);
        for hh=1:8
            w1=cos(phi_n(hh));
            w2=sin(phi_n(hh));
            zz1=q2*w1+q3*w2;
            zz2=p2*w1+p3*w2;
            zz=zz2*p1-zz1*q1;
             F_mmse(mm,nn)= F_mmse(mm,nn)+conj(Wc_MMSE(hh))*(exp(j*2*pi*R0*(zz2*p1)));
             F_smi(mm,nn)=F_smi(mm,nn)+conj(Wc_SMI(hh))*(exp(j*2*pi*R0*(zz2*p1)));
             F_gs(mm,nn)=F_gs(mm,nn)+conj((Wc_GS(hh))')*(exp(j*2*pi*R0*(zz2*p1)));
             
        end
    end
end
F_MMSE=abs(F_mmse);
F_SMI=abs(F_smi);
F_GS=abs(F_gs);
figure(5)
mesh(20*log10(F_MMSE))
figure(6)
mesh(20*log10(F_SMI))
title('SMI�㷨�����γ�ͼ');
xlabel('��λ��');
ylabel('������');
zlabel('����/dB');
figure(7)
mesh(20*log10(F_GS))
title('G-S�㷨�����γ�ͼ');
xlabel('��λ��');
ylabel('������');
zlabel('����/dB');