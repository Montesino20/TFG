%%

VECTORDISRUPTOR=48;
A=zeros(1,VECTORDISRUPTOR);

    for filas=1:10000
        errores=1;
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

B=A(2:filas, 1:VECTORDISRUPTOR);
d=bi2de(B,'left-msb');
dlmwrite('AreaInput.dat',B,'delimiter','')
t=datetime
%%

errores=0;
fileID = fopen('AreaOutput.dat', 'r');
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

  
   
 X=['Señales enviadas: ', num2str(i), ';  Señales Erroneas (errores graves): ', num2str(errores),'  Tasa exito: ', num2str(100-((errores/i)*100)),'%;   Tasa errores: ', num2str((errores/i)*100), '%' ]
  

%%
%SIMULACION REDUNDANCIA ESPACIAL 0-18 errores


y=0;
for a=1:4 %numero de errores introducidos
    erroresTotales=0;
    triples=0;
    totalWrongSignals=0;
    counter = 0;
    
    
    for p=1:100000; %NUMERO DE SEÑALES 
         
          RESULTADO=zeros(1,48);
          posicion = randperm(48,a); %ARRAY DE A ELEMENTOS UNICOS DE 0 A 48
          posicion=sort(posicion);

             for l=1:48
               RESULTADO(posicion())=1; %rellenar de unos las posiciones que han salido
             end
          RESULTADO;
          DIS1=RESULTADO(1:16); %dividir en tres vectores de 16 bits
          DIS2=RESULTADO(17:32);
          DIS3=RESULTADO(33:48);
 
             and1 = DIS1 & DIS2;
             and2 = DIS2 & DIS3;
             and3 = DIS1 & DIS3; 
             AND=[and1 and2 and3];
             
             mismas = DIS1 & DIS2 & DIS3;             
             for i = 1:length(AND)    %Recorro el vector AND para contar errores
              
                       if AND(i)> 0        
                         erroresTotales = erroresTotales + 1;
                            
                       end
                               
          end
          s=sum(AND); %Recorro el vector and para saber si hay error en la salida
                         if s>0.1
                             totalWrongSignals=totalWrongSignals+1;
                             DIS1;
                             DIS2;
                             DIS3;
                         else
                             bien1=DIS1;
                             bien2=DIS2;
                             bien3=DIS3;
                             
                             
                         end
          
           for k =1:length(mismas) %Recorro el vector mismas para contar triples errores
                  if mismas(k)> 0        
                         triples = triples + 1;
                       end
           end
         p;      
    end
Total=erroresTotales-2*triples; %Como los triples ya han sido contados dos veces en los ands, los tengo que sacar de la cuenta total
exito=100-(totalWrongSignals/p)*100;
X=['ERRORES INTRODUCIDOS: ', num2str(a),' de 48 bits (', num2str(round((a/48)*100,2)),  '%)  Señales enviadas: ', num2str(p), '  Señales Erroneas: ', num2str(totalWrongSignals), '  Tasa éxito: ', num2str(exito), '%' ];
disp(X)
y=[y totalWrongSignals]; 

end



