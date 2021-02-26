%Codigo para ejecucion de DS mediante simulink con 3 usuarios
close all
clear all
clc
%----------------------------
Rb1=200;                              %Tasa de bit Usuario 1
Rb2=200;                              %Tasa de bit Usuario 2
Rb3=200;                              %Tasa de bit Usuario 3
Eb1=1;                     %Energia de bit Usuario 1
Eb2=1;                     %Energia de bit Usuario 2
Eb3=1;                     %Energia de bit Usuario 3
% 1er etapa: Simulacion con control de potencia entre usuarios
DS_MultUs_Script
sim('DS_SS_performance.slx')
%Obtencion de los errores en bits por usuario
%ErrorUs_1 = (ErrorRec1((CantMPerBit/2):CantMPerBit:(length(ErrorRec1)-(CantMPerBit/2)))');
%ErrorUs_2 = (ErrorRec2((CantMPerBit/2):CantMPerBit:(length(ErrorRec2)-(CantMPerBit/2)))');
%ErrorUs_3 = (ErrorRec3((CantMPerBit/2):CantMPerBit:(length(ErrorRec3)-(CantMPerBit/2)))');
ErrorUs_1_etapa1 = (ErrorRec1((2):2:(length(ErrorRec1)-(1)))');
ErrorUs_2_etapa1 = (ErrorRec2((2):2:(length(ErrorRec2)-(1)))');
ErrorUs_3_etapa1 = (ErrorRec3((2):2:(length(ErrorRec3)-(1)))');
%PB por usuario
PBUs_1_etapa1 = (sum(abs(ErrorUs_1_etapa1)) / N);
PBUs_2_etapa1 = (sum(abs(ErrorUs_2_etapa1)) / N);
PBUs_3_etapa1 = (sum(abs(ErrorUs_3_etapa1)) / N);
%Relaciones entre Jammer y Senal de primer usuario con fin de ver la performance del sistema
%2da etapa: Analisis de relacion senal jammer (S/J) sin control de potencia
fprintf('Inicio 2da etapa\n')
Eb1_test=[0.01:0.01:0.1];
Rb1_test = [200, 100, 50];
Eb2=3;                     %Energia de bit Usuario 2
Eb3=3;                     %Energia de bit Usuario 3

SJRUs_1_test = [];
PBUs_1_test = [];
for (j=1 : length(Rb1_test))
SJRUs_1_test = [];
PBUs_1_test = [];
Rb1= Rb1_test(j);
for (i=1 : 1: length(Eb1_test))
    fprintf('Iteracion %d/%d del Rb1_test: %d\n',i,length(Eb1_test),j)
    Eb1= Eb1_test(i);
    DS_MultUs_Script
    sim('DS_SS_performance.slx')
    %Obtencion de los errores en bits por usuario
    ErrorUs_1 = (ErrorRec1((2):2:(length(ErrorRec1)-(1)))');
    ErrorUs_2 = (ErrorRec2((2):2:(length(ErrorRec2)-(1)))');
    ErrorUs_3 = (ErrorRec3((2):2:(length(ErrorRec3)-(1)))');
    %PB por usuario
    PBUs_1 = (sum(abs(ErrorUs_1)) / N);
    PBUs_2 = (sum(abs(ErrorUs_2)) / N);
    PBUs_3 = (sum(abs(ErrorUs_3)) / N);
    PBUs_1_test = [PBUs_1_test PBUs_1];
    SJRUs_1_test = [SJRUs_1_test 10*log10(SJR1_o)];
    fprintf("Probabilidad de error de bit: %d \n",PBUs_1_test(i))
end
plot(SJRUs_1_test,PBUs_1_test)
hold on
end

    
