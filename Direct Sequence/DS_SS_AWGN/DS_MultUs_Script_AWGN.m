N=1000;                     %Cantidad de bits a simular
L=4;                      %Cantidad de elementos del registro(Si se modifica, modificar condiciones iniciales de usuario en simulink)
MultPer=1;                %Cantidad de periodos de chips por bit
MultFrec=5;                %Multiplicidad de los tonos

%Variables dependientes:

Nchips=(2^L)-1;            %Periodo de chips
Tb1=1/Rb1;                 %Tiempo de bit Usuario 1
Tb2=1/Rb2;                 %Tiempo de bit Usuario 2
Tb3=1/Rb3;                 %Tiempo de bit Usuario 3
Tb_Usuarios = [Tb1 Tb2 Tb3];
Tb_min = min(Tb_Usuarios);
Tb_Sim = max(Tb_Usuarios);
Tc= Tb_min/(MultPer*Nchips);              %Tiempo de chip
Rc=1/Tc;
Gp1= Rc/Rb1;                              %Ganancia de Procesamiento para Usuario 1
Gp2= Rc/Rb2;                              %Ganancia de Procesamiento para Usuario 2
Gp3= Rc/Rb3;                              %Ganancia de Procesamiento para Usuario 3
Ec1=Eb1/Gp1;                         %Energia de cada chip Usuario 1
Ec2=Eb2/Gp2;                         %Energia de cada chip Usuario 2
Ec3=Eb3/Gp3;                         %Energia de cada chip Usuario 3
Pot1 = Eb1 / Tb1;                        %Potencia Usuario 1
Pot2 = Eb2 / Tb2;                        %Potencia Usuario 2
Pot3 = Eb3 / Tb3;                        %Potencia Usuario 3
SJR1_i = Pot1 / (Pot2 + Pot3);            %Relacion senal - Jammer Usuario 1 a la entrada
SJR2_i = Pot2 / (Pot1 + Pot3);            %Relacion senal - Jammer Usuario 2 a la entrada
SJR3_i = Pot3 / (Pot1 + Pot2);            %Relacion senal - Jammer Usuario 3 a la entrada

SJR1_o = 2*Gp1* SJR1_i;                    %Relacion senal - Jammer Coherente Usuario 1 a la salida
SJR2_o = 2*Gp2* SJR2_i;                    %Relacion senal - Jammer Coherente Usuario 2 a la salida
SJR3_o = 2*Gp3* SJR3_i;                    %Relacion senal - Jammer Coherente Usuario 3 a la salida
MuestrasPerChip = 1000;
Tsampling=Tc/MuestrasPerChip;                    %Tiempo de muestreo, se definen la cantidad de muestras por chip
FrecSignal=MultFrec*(1/Tc);           %Frecuencia de las waveform
CantMPerBit=MuestrasPerChip*(MultPer*Nchips);
n = 2^nextpow2(CantMPerBit);
switch (L)
    case(2)
        m=2;
        PolGen=[2,1,0];                  %[2,1]
        %CondIniciales=[0,1];
    case(3)
        m=2;
        PolGen=[3,2,0];                  %[3,1]
        %CondIniciales=[0,0,1];
    case(4)
        m=2;
        PolGen=[4,3,0];                  %[4,1]
        %CondIniciales=[0,0,0,1];
    case(5)
        m=6;
        PolGen=[5,2,0];                  %[5,3]
        %CondIniciales=[0,0,0,0,1];
    case(6)
        m=6;
        PolGen=[6,5,0];                  %[6,1]
        %CondIniciales=[0,0,0,0,0,1];
    case(7)
        m=18;
        PolGen=[7,6,0];                  %[7,1]
        %CondIniciales=[0,0,0,0,0,0,1];
    case(8)
        m=16;
        PolGen=[8, 6, 5, 4, 0];          %[8,4,3,2]
        %CondIniciales=[0,0,0,0,0,0,0,1];
end
