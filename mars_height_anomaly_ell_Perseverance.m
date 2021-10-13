clc
clear

datnum = importdata('mars_Perseverance.gdf',' ',36);
dat = datnum.textdata;
num = datnum.data;
la=num(:,1);
fi=num(:,2);
dat1=num(:,3);
lamin=min(la);
lamax=max(la);
fimin=min(fi);
fimax=max(fi);


la1=la(1);la2=la(2);
  i=0;
  while la1==la2 
    i=i+1; 
    la2=la(2+i);
  end 
  fi1=fi(1);fi2=fi(2);
  j=0;
  while fi1==fi2
    j=j+1;
    fi2=fi(2+j);
  end
  dla=abs(la1-la2);
  dfi=abs(fi1-fi2);
  frows=abs(floor((fimax-fimin)/dfi+1.5));
  lcols=abs(floor((lamax-lamin)/dla+1.5));
  n=1;
  for i=frows:-1:1
    for j=1:lcols
      if n <= length(la) 
        if la(n) < 180
         X(i,j)=la(n);
        else
          X(i,j)=la(n)-360;
        end
      Y(i,j)=fi(n);
      Z(i,j) = dat1(n);
      n=n+1;
      end
    end    
  end

[c,h]=contourf(X,Y,Z,2.8925281E+02:0.20549788888:3.2624243E+02);
clabel(c,h);
hold on

# Perseverance position on Mars
sz = 40;
scatter(77.4508, 18.4447,sz,'MarkerEdgeColor','black',...
              'MarkerFaceColor','white',...
              'LineWidth',1.5);


colorbar
h = colorbar;
ylabel(h, 'Meter');

title('Plotting Height Anomaly on Ellipsoidal Grids Where the Perseverance Rover Is'); 
ylabel('Latitude');
xlabel('Longitude');
