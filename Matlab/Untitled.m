
i=0;
a=0;
errorSimple= 0;
errorGrave=0;
 n=0;
d=[0,2,4,6,8,10,12, 300, 302, 304, 306, 22, 24, 26, 28, 44, 46, 48, 50, 52, 54,56, 58, 94, 4533, 64, 66, 68, 70, 72]; %Vector de valores
 for i = 2:length(d)    %Recorro el vector d para contar errores
         
                       if d(i) ~= d(i-1)+2     %si la diferencia es distinta de dos es que ha habido un error
                                                          
                            i=i+1;
                            
                               if d(i) == d(i-1)+2
                                   if d(i) ~=  (d(i-2)+4) 
                                       if d(i) ~= (d(i-3)+6)
                                           if d(i) ~= (d(i-4)+8) 
                                               if d(i) ~=  d(i-5)+10
                                       
                                                        i
                                                     errorGrave = errorGrave+1;
                                                     errorSimple= errorSimple+1;
                                               end
                                           end
                                       end
                                       
                                   end
                               end
                                
                                         
                       end
                       
                       
                               
 end
 errorGrave
 %%

i=0;
a=0;
 errorGrave=0;
 n=0;
d=[0,2,4,6,8,10,12, 300, 302, 304, 306, 22, 24, 26, 28, 44, 46, 48, 50, 52, 54,56, 58, 94, 4533, 64, 66, 68, 70, 72]; %Vector de valores
 for i = 2:length(d)    %Recorro el vector d para contar errores
         
                       if d(i) ~= d(i-1)+2    
                                                          
                            i=i+1;
                               if d(i) == d(i-1)+2
                                   if d(i) ~=  ((d(i-2)+4) || (d(i-3)+6) ||(d(i-4)+8) || d(i-5)+10)
                                         
                                                 errorGrave = errorGrave+1;
                                   end
                                               
                               end
                                
                                         
                       end
                       
                       
                               
 end
 errorGrave
 
 %%
 n=0;
 errores=0;
 
d=[0,2,4,6,8,10,300,14,16,18, 654, 656, 658, 7003, 7005, 7007, 7009, 124,126, 128, 250, 252, 254, 256, 0, 2, 3000, 4, 6];
  for n = 2:length(d)
                    if d(n) ~= d(n-1)+2     %si la diferencia es distinta de dos es que ha habido un error
                          
                            errores = errores+1;
                    end
                 
  end
      errores