% ≈À≈”«” ƒ«Ã«‘—…œ”
%¡.Ã.: 03115037
%A1,A2
d= audioread('C:\Users\JIM\Desktop\name.wav');
for i=16001:20000
  d(i)=0;
 end
figure(20); plot(d);
xlabel('Samples)');
title('Recorded signal');
%A3
y = buffer (d,800,400);
power = sum(abs(y).^2);
figure(21); stem(power);
xlabel('Frame num');
ylabel('Energy');
title('Energy per frame');
%A4
figure(30); plot(d);
xlim([6800,7600]);
xlabel('Samples');
title('Recorded signal');
d1=d(6800:7600);
soundsc(d1); %to gramma 'i'
%A5
Fs = 8000;
DT = 1/Fs;
t=(-4000:DT:4000-DT);
NFFT=2^nextpow2(length(d));
X=fft(d,NFFT)*DT/(length(t)*DT);
Xshift=fftshift(X);
F = [-Fs/2:Fs/NFFT:Fs/2-Fs/NFFT];
figure(2); plot(F,abs(Xshift)); % kanoniko
xlabel('Frequency(Hz)');
ylabel('|X|');
figure(3); plot(F,20*log10(abs(Xshift))); %log
xlabel('Frequency(Hz)');
ylabel('|X| Db');
%A6
% sto f=3 Hz kai T=307msec peripou

%meros B

n=0:20;
x = [1 zeros(1,20)];
y=filter([2 0 0 0 0 0 0 0 0 0 1],[2],x);
figure(4); stem(n,y,'filled');
ylabel('Impulse Response h[n]');
xlabel('Time Index (n)')
n=0:20;
[step_resp,t_step]=stepz([2 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0], [2 0 0 0 0 0 0 0 0]);
figure(22); stem(n,step_resp,'filled');
ylabel('Amplitude');
xlabel('n(samples)');
title('Step Response');

%B2
figure(24); zplane([20 0 0 0 0 0 0 0 0 0 1],[20]); %a=0,1
figure(25); zplane([200 zeros(1,9) 1],[200]); %a=0,01
figure(26); zplane([2000 zeros(1,9) 1],[2000]); %a=0,001
p=[20 0 0 0 0 0 0 0 0 0 1]
r=roots(p)
p=[200 0 0 0 0 0 0 0 0 0 1]
r=roots(p)
p=[2000 0 0 0 0 0 0 0 0 0 1]
r=roots(p)

%B3
d2 = zeros(1,1);
for i = 1:4000
    if i <= 800
        d2(i) = d1(i);
    elseif i > 2000 && i <= 2800
        d2(i) = 1/2*d1(i - 2000);
    else d2(i)=0;
    end
end
for i=800:4000
  d1(i)=0;
  end
figure(5); plot(d1); %input
xlabel('Samples');
ylabel('Amplitude');
title('Input');
figure(6); plot(d2); %output
xlabel('Samples');
ylabel('Amplitude');
title('Output');

%B4
soundsc(d2);
Fs = 8000;
DT = 1/Fs;
t=(-4000:DT:4000-DT);
NFFT=2^nextpow2(length(d2));
X=fft(d2,NFFT)*DT/(length(t)*DT);
Xshift=fftshift(X);
F = [-Fs/2:Fs/NFFT:Fs/2-Fs/NFFT];
figure(7); plot(F,abs(Xshift)); % kanoniko
xlabel('Frequency(Hz)');
ylabel('|X|');
figure(8); plot(F,20*log10(abs(Xshift))); %log
xlabel('Frequency(Hz)');
ylabel('|X| Db');

%Meros G
%G1


%G2
n=0:150; %r=0.95
x = [1 zeros(1,150)];
y=filter([1],[1 -1.6 0.9025],x);
figure(9); stem(n,y,'filled');
ylabel('Impulse Response h[n]');
xlabel('Time Index (n)') 
w = -pi:(pi/500):pi;
H = freqz([1],[1 -1.6 0.9025],w);
figure(10); plot (w,abs (H));
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('r=0.95');
figure(11); plot(w,angle(H));
xlabel('Frequency (Hz)');
ylabel('Phase');
title('r=0.95');

n=0:15; %r=0.5
x = [1 zeros(1,15)];
y=filter([1],[1 -0.84 0.25],x);
figure(12); stem(n,y,'filled');
ylabel('Impulse Response h[n]');
xlabel('Time Index (n)')
title('r=0.5');
w = -pi:(pi/500):pi;
H = freqz([1],[1 -0.84 0.25],w);
figure(13); plot (w,abs (H));
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('r=0.5');
figure(14); plot(w,angle(H));
xlabel('Frequency (Hz)');
ylabel('Phase');
title('r=0.5');

n=0:75; %r=1.2
x = [1 zeros(1,75)];
y=filter([1],[1 -2 1.44],x);
figure(15); stem(n,y,'filled');
ylabel('Impulse Response h[n]');
xlabel('Time Index (n)')
title('r=1.2');
w = -pi:(pi/500):pi;
H = freqz([1],[1 -2 1.44],w);
figure(16); plot (w,abs (H));
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('r=1.2');
figure(17); plot(w,angle(H));
xlabel('Frequency (Hz)');
ylabel('Phase');
title('r=1.2');

%G3

fs=pi/1000;
O1=[500 1500 2500];% frequency
O1=O1*2*pi/fs;
%H1
a1=(1:3);
b1=(1:1);
b1(1)=1;
a1(1)=1;
a1(2)=-cos(O1(1))*1.9;
a1(3)=0.95*0.95;
%H2
a2=(1:3);
b2=(1:1);
b2(1)=1;
a2(1)=1;
a2(2)=-cos(O1(2))*1.9;
a2(3)=0.95*0.95;
%H3
a3=(1:3);
b3=(1:1);
b3(1)=1;
a3(1)=1;
a3(2)=-cos(O1(3))*1.9;
a3(3)=0.95*0.95;
a = conv(a1,a2);
a = conv(a,a3);
b = conv(b1,b2);
b = conv(b,b3);% H =H1*H2*H3 polynomials product=conv
w=-pi:fs:pi;
h=freqz(b,a,w);
figure(18);plot(w*4500/pi,abs(h));
title('Response of the system');
xlabel('Frequency (Hz)');
xlim([-4000,4000]);

%G4
r = zeros( 200, 1 );
r( 1 : 10 : 200 ) = 1;
figure(19); stem( r ); %r=impulse train
title('Impulse train');
xlabel('Time');
ylabel('Amplitude');
y=filter([b],[a],r);
sound(y);
figure(23); plot (abs (y)); %gramma 'E'
title('Response');
xlabel('Frequency(Hz)');
ylabel('|X|');

