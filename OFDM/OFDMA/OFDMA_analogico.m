%==========================================================================
%Autores: Geronimo Passini y Gorordo Lucas
%==========================================================================

clear all
clc
close all

CantBit= 16*10;             %Cantidad de bits a simular                  

Rb1=1000;               %Tasa de bit de la primera fuente
Rb2=1000;               %Tasa de bit de la segunda fuente
Rb3=2000;               %Tasa de bit de la penultima fuente
Rb4=3000;               %Tasa de bit de la ultima fuente

Tb1=1/Rb1;              %Tiempo de bit de la primera fuente
Tb2=1/Rb2;              %Tiempo de bit de la segunda fuente
Tb3=1/Rb3;              %Tiempo de bit de la tercera fuente
Tb4=1/Rb4;              %Tiempo de bit de la ultima fuente
%--------------------------------------------------------------------------------------------
Trama=[Tb1,Tb2,Tb3,Tb4];
Rrama=[Rb1,Rb2,Rb3,Rb4];
Fp=1*10^6;                                %Frecuencia portadora
TsOFDM=max(Trama);                        %Definiendo el tiempo de simbolo OFDM - Deberia estar en funcion de los parametros delay spread y doppler spread
N=1000;                                   %Muestras por el tiempo de bit mas pequeño
M=min(Trama);                             %Tiempo de bit mas pequeño para poder tener refencia y simular
Tsampling=M/N;                            %Tiempo de muestreo para simulink
CantMPerSimbOFDM=round(TsOFDM/Tsampling); %Cantidad de muestras por simbolo OFDM
fprintf("Tiempo de simbolo OFDM es de: %d seg/simbolo \n",TsOFDM)
fprintf("Cantidad de ramas que emplea Modulador OFDM: 4 \n")
fprintf("---------------------------------------------- \n")
fprintf("Tasa de bits que utiliza cada fuente : \n")
fprintf("Fuente 1: %d bps\n", Rb1)
fprintf("Fuente 2: %d bps\n", Rb2)
fprintf("Fuente 3: %d bps\n", Rb3)
fprintf("Fuente 4: %d bps\n", Rb4)
fprintf("---------------------------------------------- \n")
FsepOFDM=1/TsOFDM;        %Frecuencia fundamental de la cual son multiplos todos los simbolos de las diferentes ramas.

F1=FsepOFDM*2;            %Frecuencia carrier rama1
F2=FsepOFDM*3;            %Frecuencia carrier rama2
F3=FsepOFDM*4;            %Frecuencia carrier rama3
F4=FsepOFDM*5;            %Frecuencia carrier rama4
fprintf("----------------------------------------------- \n")
fprintf("Frecuencias de portadora utilizada por cada rama del modulador OFDM : \n")
fprintf("Frecuencia portadora para la primer fuente:  %d \n" , F1)
fprintf("Frecuencia portadora para la segunda fuente: %d \n",  F2)
fprintf("Frecuencia portadora para la tercera fuente: %d \n",  F3)
fprintf("Frecuencia portadora para la cuarta fuente:  %d \n",  F4)
%---------------------------------------------------------------------------------------------
Ts1=Tb1;                  %Tasa de simbolo BPSK
Ts2=Tb2;                  %Tasa de simbolo BPSK
Ts3=2*Tb3;                %Tasa de simbolo QPSK
Ts4=3*Tb4;                %Tasa de simbolo 8PSK
%---------------------------------------------------------------------------------------------
%Se asume igual energia para todos los simbolos M-PSK
EsOFDM=2;
