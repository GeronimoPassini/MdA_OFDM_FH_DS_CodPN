N=100;
Rb=9600;
Rc=1.2288*10^6;
Eb=2;
Ebcod=Eb/2;
Ebchip=Ebcod/(Rc/2*Rb);
Es=2*Ebchip;
Tb=1/Rb;
Es=2*Eb/2;
fc=Rc;
Tc=1/Rc;
Tsampling=Tc/100;
Tcodif=Tb/2;
Ts=2*Tc;
TIntegracion=Tcodif/Tsampling;
%------------------------
%Config codigos y condiciones iniciales
PolCodLarg=[42 23 22 1 0];
PolCodCort=[15 14 0];
CondInicC=zeros(1,15);
CondInicC(length(CondInicC))=1;
CondInicL=zeros(1,42);
CondInicL(length(CondInicL))=1;
%-------------------------
K=3;   %Cantidad de registros de desplazamiento
PolconSal1='x^3+x';
PolconSal2='x^3+x^2+1';
%Referencia :https://la.mathworks.com/help/comm/ref/poly2trellis.html
L=K+1; %Variable que interpreta simulink

