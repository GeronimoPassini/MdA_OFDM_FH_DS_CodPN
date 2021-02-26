%------------------------------------------------------------------------
%Autores: Geronimo Passini y Lucas Gorordo
%-----------------------------------------------------------------------
Rb=16000;
Tb=1/Rb;
Eb=2;
Fp=Rb;
Tsampling=Tb/1000;
CantIFFT=8;                                 %Si se modifica este parametro hay que cambiar la estructura paralelo de los moduladores      
CantSimbOFDM=50;
%N=CantSimbOFDM*CantIFFTSimetric;
N=CantSimbOFDM*CantIFFT;
sim('OFDM_Digital')
