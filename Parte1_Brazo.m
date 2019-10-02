close all
clear
clc

prompt= 'Introduce el valor de la distancia del vector uno:\n';
l1 = input(prompt);

prompt= 'Introduce el valor de la distancia del vector uno:\n';
l2 = input(prompt);

prompt= 'Cuanto deseas rotar en grados con respecto la primera extremidad del brazo :\n';
angDeg = input(prompt);

% prompt= 'Cuanto deseas rotar en grados con respecto la segunda extremidad del brazo :\n';
% angDeg2 = input(prompt);


angRad = deg2rad(angDeg)

% %Impersion de los ejes de dos dimencsiones 
% printAxis();
% %----------------------------------------------
%Difinicion del punto Inicial
%Vector Columna
p1=[0 0 0]';
%-----------------------------------------
if angDeg>=0
    angVec = 0 :0.01:angRad
else
    angVec = 0 :-0.01:angRad
end


%-----------------------------------------------------------------------------------------------------
% Rotacion y traslacion desde el origen 

for i=1:length(angVec)
    clf
    printAxis();
    grid on
    %Matriz de rotacion en Z
    TRz1= [cos(angVec(i)) -sin(angVec(i))   0    0;
           sin(angVec(i))  cos(angVec(i))   0    0; 
              0             0               1    0;
              0             0               0    1];

    %Matriz de traslacion en X
    Ttx1=[1   0    0   l1;
          0   1    0   0 ;
          0   0    1   0 ;
          0   0    0   1];
      
      T1=TRz1*Ttx1;
      p2=T1(1:3,4);
   
      line([p1(1) p2(1)], [p1(2) p2(2)],[p1(3) p2(3)],'color',[.7 .3 .7],'linewidth',5);
     
      %Matriz de rotacion en Z
      TRz2= [cos(0) -sin(0)   0    0;
             sin(0)  cos(0)   0    0; 
               0      0       1    0;
               0      0       0    1];
      
     %Matriz de traslacion en X
      Ttx2=[1   0    0   l2;
            0   1    0   0 ;
            0   0    1   0 ;
            0   0    0   1];
      T2 = TRz2*Ttx2;
      Tf=T1*T2;
      p3=Tf(1:3,4);

      line([p2(1) p3(1)], [p2(2) p3(2)], [p2(2) p3(2)],'color',[1 1 0],'linewidth',5)      
      pause(0.001)
end
