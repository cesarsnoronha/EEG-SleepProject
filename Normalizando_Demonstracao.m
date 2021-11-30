% normAntes = xlsread('AreaLowGammaAntes.xlsx','J2:J21');
% normDepois = xlsread('AreaLowGammaDepois.xlsx',''J2:J21');

normAntes = xlsread('LOWGAMMA_PSD_Antes.xlsx',1,'B2:B21');
normDepois = xlsread('LOWGAMMA_PSD_Depois.xlsx',1,'B2:B21');

BandAntes = xlsread('AreaAlfaAntes.xlsx',1,'J2:J21');
BandDepois = xlsread('AreaAlfaDepois.xlsx',1,'J2:J21');

%%
Alfa = [BandAntes' BandDepois']; 
LowGamma = [normAntes' normDepois'];
tempo = [ "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois"  "Depois" "Depois" "Depois" "Depois" "Depois"];
[~,~,ctab,~] = aoctool(LowGamma,Alfa,tempo,'','','','','on','separate lines');
%%
% Curva da Banda antes
A1 = cell2mat(ctab(5,2)) + cell2mat(ctab(6,2));
A2 = cell2mat(ctab(5,2)) + cell2mat(ctab(7,2));

BandAntes2 = BandAntes -normAntes*A1;
BandDepois2 = BandDepois -normDepois*A2;

Alfa2 = [BandAntes2' BandDepois2']; 
[h,atab,ctab,stats] = aoctool(LowGamma,Alfa2,tempo,'','','','','on','separate lines');
