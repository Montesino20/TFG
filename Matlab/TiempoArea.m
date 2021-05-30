%%
tic=datetime;
VECTORDISRUPTOR=288;
A=zeros(1,VECTORDISRUPTOR);
[y,Fs] = audioread('haha.wav');
%sound(y,Fs);
    for filas=1:30000
        errores=15;
        DISRUPTOR=zeros(1,VECTORDISRUPTOR);
        posicion = randperm(VECTORDISRUPTOR,errores); %ARRAY DE errores ELEMENTOS UNICOS DE 1 A 96
        posicion=sort(posicion);
             for l=1:VECTORDISRUPTOR
               DISRUPTOR(posicion())=1;
             end
  DISRUPTOR;
    
   A=[A; DISRUPTOR];
   filas
end; 
sound(y,Fs);
B=A(2:filas, 1:VECTORDISRUPTOR);
tuc=datetime-tic;
d=bi2de(B,'left-msb');
dlmwrite('TiempoAreaInput.dat',B,'delimiter','');
tac=datetime-tic;
sound(y,Fs);
%%

errores=0;
fileID = fopen('TiempoAreaOutput.dat', 'r');
A=fscanf(fileID, '%f');
C=transpose(A);
d= diff(C); %creo el vector diferencia entre las dos posiciones
 for i = 2:length(d)    %Recorro el vector C para contar errores
             
              
                       if C(i) ~= C(i-1)+2     %si la diferencia es distinta de dos es que ha habido un error
                            if C(i) ~= C(i-2)+4;
                                if C(i) ~= C(i-3)+6;
                                    if C(i) ~= C(i-4)+8;
                                 errores = errores+1;
                                 i
                                end
                                end
                            end  
                           
                          
                       end
    
 end

j=0;
errorGrave=0;


 for j = 2:length(C)-1    %Recorro el vector d para contar errores
         
                       if (C(j) - C(j-1))<=100       %si la diferencia es distinta de dos es que ha habido un error
                         
                           if C(j+1)- C(j-1)<=5
                             % errorGrave=errorGrave-1; 
                           j=j+1;
                           
                           elseif C(j+2)-C(j-2)<=9
                              % errorGrave=errorGrave-1;
                           j=j+2;
                           
                           elseif C(j+3) - C(j-3)<=13
                           j=j+3;    
                              % errorGrave=errorGrave-1;
                           elseif C(j+4) - C(j-4)<=17
                            j=j+4;   
                              % errorGrave=errorGrave-1;   
                           else
                               errorGrave=errorGrave+1;
                               j
                             j=j+3;
                           end
                         
                       end  
                      
                               
 end
 errorGrave   
   
 X=['Señales enviadas: ', num2str(i), ';  Señales Erroneas: ', num2str(errores),'; Errores Graves: ', num2str(errorGrave),  ';  Tasa exito: ', num2str(100-((errores/i)*100)),'%;   Tasa errores: ', num2str((errores/i)*100), '%',  '; Error Catastrofico:', num2str((errorGrave/i)*100),'%' ]
  
 