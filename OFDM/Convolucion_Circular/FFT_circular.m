%==========================================================================
%Autores: Geronimo Passini
%==========================================================================
clear all
clc
close all
Fsen = 500;
muestras_periodo = 24;
Fs=Fsen*muestras_periodo; %frecuencia de sample
ts=(1/Fs); %tiempo de sample
cant_periodos = 1;
desplazamientos_deSen = 7;
t=[0:ts:((cant_periodos*muestras_periodo)-1)*ts]; %generación de vector de tiempo
y=1*sin(2*pi*500*t); %generación del seno
resolucion_espectral_fft = (1/(muestras_periodo*ts));
%----------------------------
y_fft = fft(y,(length(t)));
t_fft = [0:1:length(y_fft)-1];
fprintf('Fsen = %d hz, CantMuestrasPeriodo= %d muestras, resolucion espectral en fft por muestra: %d hz \n',Fsen,muestras_periodo,resolucion_espectral_fft)
%----------------------------
y1 = [y(1,length(y)-(desplazamientos_deSen):length(y)) y(1,1:(length(y)-(desplazamientos_deSen))-1)];
y1 = y1*0.707; %Atenuacion a mitad de potencia
y1_fft = fft(y1,(length(t)));
%----------------------------
y2 = [zeros(1,(desplazamientos_deSen+1)) y(1,1:(length(y)-(desplazamientos_deSen))-1)];
y2_fft = fft(y2,(length(t)));
%------------------------------------------------------------------------------
%Graficas sinusoidal y FFT
subplot(3,2,1)
stem(y)
title('Señal')
subplot(3,2,2)
stem(t_fft,abs(y_fft))
title('FFT')
subplot(3,2,3)
stem(y1)
title('Señal desplazada y ciclica')
subplot(3,2,4)
stem(t_fft,abs(y1_fft))
title('FFT de señal desplazada y ciclica')
subplot(3,2,5)
stem(y2)
title('Señal desplazada no ciclica')
subplot(3,2,6)
stem(t_fft,abs(y2_fft))
title('FFT de señal desplazada no ciclica')
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
%Calculo de FFT para senal OFDM
ofdm_sen= rand(1,muestras_periodo);
ofdm_fft = fft(ofdm_sen,(length(t)));
%----------------------------
ofdm1_sen = [ofdm_sen(1,length(ofdm_sen)-(desplazamientos_deSen):length(ofdm_sen)) ofdm_sen(1,1:(length(ofdm_sen)-(desplazamientos_deSen))-1)];
ofdm1_fft = fft(ofdm1_sen,(length(t)));
%----------------------------
ofdm2_sen = [zeros(1,(desplazamientos_deSen+1)) ofdm_sen(1,1:(length(ofdm_sen)-(desplazamientos_deSen))-1)];
ofdm2_fft = fft(ofdm2_sen,(length(t)));
%------------------------------------------------------------------------------
%Graficas sinusoidal y FFT
figure()
subplot(3,2,1)
stem(ofdm_sen)
title('Señal OFDM')
subplot(3,2,2)
stem(t_fft,abs(ofdm_fft))
title('FFT OFDM')
subplot(3,2,3)
stem(ofdm1_sen)
hold on
stem(ofdm1_sen(1,1:desplazamientos_deSen+1),'r')
title('Señal desplazada y ciclica - atenuada')
subplot(3,2,4)
stem(t_fft,abs(ofdm1_fft))
title('FFT de señal desplazada y ciclica')
subplot(3,2,5)
stem(ofdm2_sen)
title('Señal desplazada no ciclica')
subplot(3,2,6)
stem(t_fft,abs(ofdm2_fft))
title('FFT de señal desplazada no ciclica')
%------------------------------------------------------------------------------
%Graficas sinusoidal extendidas en tiempo
y_extendida = [y y y];
y1_extendida = [y1 y1 y1];
y2_extendida = [y2 y2 y2];
t_extendido = [0:ts:(length(y_extendida)-1)*ts];
figure()
subplot(3,1,1)
stem(y_extendida)
title('Señal original circular')
subplot(3,1,2)
stem(y1_extendida)
title('Señal 2 circular')
subplot(3,1,3)
stem(y2_extendida)
title('Señal 3 circular')
