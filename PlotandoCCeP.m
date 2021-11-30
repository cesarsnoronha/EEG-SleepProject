% Topografias com o "p" e o "coeficiente de correlação" de cada banda por
% ML

[~,s] = xlsread('electrode_names_newref.xlsx');

locs = get_chanlocs_from_labels(s);

AlfaAntesPSD = xlsread('Alfa_Antes_PSD.xlsx',1,'B2:Z21');
AlfaDepoisPSD = xlsread('Alfa_Depois_PSD.xlsx',1,'B2:Z21');

BetaAntesPSD = xlsread('Beta_Antes_PSD.xlsx',1,'B2:Z21');
BetaDepoisPSD = xlsread('Beta_Depois_PSD.xlsx',1,'B2:Z21');

DeltaAntesPSD = xlsread('Delta_Antes_PSD.xlsx',1,'B2:Z21');
DeltaDepoisPSD = xlsread('Delta_Depois_PSD.xlsx',1,'B2:Z21');

TetaAntesPSD = xlsread('Teta_Antes_PSD.xlsx',1,'B2:Z21');
TetaDepoisPSD = xlsread('Teta_Depois_PSD.xlsx',1,'B2:Z21');

tamanho = size(AlfaAntesPSD,2)-1;

%% Normalizando

[ pAntesAlfaPSD, ccAntesAlfaPSD ] = ObtendoNormalizado( AlfaAntesPSD(:,1:tamanho), repmat(AlfaAntesPSD(:,tamanho+1), 1, tamanho));
[ pAntesBetaPSD, ccAntesBetaPSD ] = ObtendoNormalizado( BetaAntesPSD(:,1:tamanho), repmat(BetaAntesPSD(:,tamanho+1), 1, tamanho));
[ pAntesDeltaPSD, ccAntesDeltaPSD ] = ObtendoNormalizado( DeltaAntesPSD(:,1:tamanho), repmat(DeltaAntesPSD(:,tamanho+1), 1, tamanho));
[ pAntesTetaPSD, ccAntesTetaPSD ] =ObtendoNormalizado( TetaAntesPSD(:,1:tamanho), repmat(TetaAntesPSD(:,tamanho+1), 1, tamanho));

[ pDepoisAlfaPSD, ccDepoisAlfaPSD ] = ObtendoNormalizado( AlfaDepoisPSD(:,1:tamanho), repmat(AlfaDepoisPSD(:,tamanho+1), 1, tamanho));
[ pDepoisBetaPSD, ccDepoisBetaPSD ] = ObtendoNormalizado( BetaDepoisPSD(:,1:tamanho), repmat(BetaDepoisPSD(:,tamanho+1), 1, tamanho));
[ pDepoisDeltaPSD, ccDepoisDeltaPSD ] = ObtendoNormalizado( DeltaDepoisPSD(:,1:tamanho), repmat(DeltaDepoisPSD(:,tamanho+1), 1, tamanho));
[ pDepoisTetaPSD, ccDepoisTetaPSD ] =ObtendoNormalizado( TetaDepoisPSD(:,1:tamanho), repmat(TetaDepoisPSD(:,tamanho+1), 1, tamanho));

%% Plotagem

h=subtightplot(2,4,1,[0,0]);
topoplot(ccAntesAlfaPSD,locs,'maplimits',[-1,1])
title('(ccAntes) Alfa PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,1+4,[0,0]);
topoplot(pAntesAlfaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Antes Alfa PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,2,[0,0]);
topoplot(ccAntesBetaPSD,locs,'maplimits',[-1,1])
title('(ccAntes) Beta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,2+4,[0,0]);
topoplot(pAntesBetaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Antes Beta PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,3,[0,0]);
topoplot(ccAntesDeltaPSD,locs,'maplimits',[-1,1])
title('(ccAntes) Delta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,3+4,[0,0]);
topoplot(pAntesDeltaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Antes Delta PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,4,[0,0]);
topoplot(ccAntesTetaPSD,locs,'maplimits',[-1,1])
title('(ccAntes) Teta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,4+4,[0,0]);
topoplot(pAntesTetaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Antes Teta PSD')
ax = gca;
ax.FontSize = 11

figure

h=subtightplot(2,4,1,[0,0]);
topoplot(ccDepoisAlfaPSD,locs,'maplimits',[-1,1])
title('(ccDepois) Alfa PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,1+4,[0,0]);
topoplot(pDepoisAlfaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Depois Alfa PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,2,[0,0]);
topoplot(ccDepoisBetaPSD,locs,'maplimits',[-1,1])
title('(ccDepois) Beta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,2+4,[0,0]);
topoplot(pDepoisBetaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Depois Beta PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,3,[0,0]);
topoplot(ccDepoisDeltaPSD,locs,'maplimits',[-1,1])
title('(ccDepois) Delta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,3+4,[0,0]);
topoplot(pDepoisDeltaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Depois Delta PSD')
ax = gca;
ax.FontSize = 11;

h=subtightplot(2,4,4,[0,0]);
topoplot(ccDepoisTetaPSD,locs,'maplimits',[-1,1])
title('(ccDepois) Teta PSD')
ax = gca;
ax.FontSize = 11;


h=subtightplot(2,4,4+4,[0,0]);
topoplot(pDepoisTetaPSD,locs,'maplimits',[0,0.05])
title('(p-value) Depois Teta PSD')
ax = gca;
ax.FontSize = 11