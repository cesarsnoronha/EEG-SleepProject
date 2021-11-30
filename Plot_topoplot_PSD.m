[~,s] = xlsread('electrode_names.xlsx');

locs = get_chanlocs_from_labels(s);

AlfaAntes = xlsread('Alfa_Area_PSD_Antes.xlsx',1,'B2:Z21');
AlfaDepois = xlsread('Alfa_Area_PSD_Depois.xlsx',1,'B2:Z21');

BetaAntes = xlsread('Beta_Area_PSD_Antes.xlsx',1,'B2:Z21');
BetaDepois = xlsread('Beta_Area_PSD_Depois.xlsx',1,'B2:Z21');

DeltaAntes = xlsread('Delta_Area_PSD_Antes.xlsx',1,'B2:Z21');
DeltaDepois = xlsread('Delta_Area_PSD_Depois.xlsx',1,'B2:Z21');

TetaAntes = xlsread('Teta_Area_PSD_Antes.xlsx',1,'B2:Z21');
TetaDepois = xlsread('Teta_Area_PSD_Depois.xlsx',1,'B2:Z21');

% normAntes = xlsread('AreaLowGammaAntes.xlsx','J2:J21');
% normDepois = xlsread('AreaLowGammaDepois.xlsx','J2:J21');


BandAntes = [median(AlfaAntes); median(BetaAntes); median(DeltaAntes); median(TetaAntes)];
BandDepois = [median(AlfaDepois); median(BetaDepois); median(DeltaDepois); median(TetaDepois)];

Subtracted = [median(AlfaAntes - AlfaDepois); median(BetaAntes - BetaDepois); median(DeltaAntes - DeltaDepois); median(TetaAntes - TetaDepois)];
%%

[ AlfaDepois2, AlfaAntes2 ] = normalizandoEEG( AlfaAntes, AlfaDepois, normAntes, normDepois);
[ BetaDepois2, BetaAntes2 ] = normalizandoEEG( BetaAntes, BetaDepois, normAntes, normDepois);
[ DeltaDepois2, DeltaAntes2 ] = normalizandoEEG( DeltaAntes, DeltaDepois, normAntes, normDepois);
[ TetaDepois2, TetaAntes2 ] = normalizandoEEG( TetaAntes, TetaDepois, normAntes, normDepois);

BandAntes2 = [median(AlfaAntes2); median(BetaAntes2); median(DeltaAntes2); median(TetaAntes2)];
BandDepois2 = [median(AlfaDepois2); median(BetaDepois2); median(DeltaDepois2); median(TetaDepois2)];

%% Media Antes

teste = sprintf('PSD Media Antes');
subplot(2,4,3)
topoplot(BandAntes(1,:),locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)
    
subplot(2,4,4)
topoplot(BandAntes(2,:),locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,1)
topoplot(BandAntes(3,:),locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,2)
topoplot(BandAntes(4,:),locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

%% Media Antes Ajustada
teste = sprintf('PSD Media Antes Ajustada');
subplot(2,4,3+4)
topoplot(BandAntes2(1,:),locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)
    
subplot(2,4,4+4)
topoplot(BandAntes2(2,:),locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,1+4)
topoplot(BandAntes2(3,:),locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,2+4)
topoplot(BandAntes2(4,:),locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)
%% Media Depois
figure
teste1 = sprintf('PSD Media Depois');
subplot(2,4,3)
topoplot(BandDepois(1,:),locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)
    
subplot(2,4,4)
topoplot(BandDepois(2,:),locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,1)
topoplot(BandDepois(3,:),locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,2)
topoplot(BandDepois(4,:),locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)
%% Media Depois Ajustada

teste1 = sprintf('PSD Media Depois Ajustada');
subplot(2,4,3+4)
topoplot(BandDepois2(1,:),locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)
    
subplot(2,4,4+4)
topoplot(BandDepois2(2,:),locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,1+4)
topoplot(BandDepois2(3,:),locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,2+4)
topoplot(BandDepois2(4,:),locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)
%% Subtração
figure
teste = sprintf('Subtração PSD (D-A)');

subplot(2,4,3)
Band =  BandDepois(1,:) - BandAntes(1,:);
topoplot(Band,locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,4)
Band =  BandDepois(2,:) - BandAntes(2,:);
topoplot(Band,locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,1)
Band =  BandDepois(3,:) - BandAntes(3,:);
topoplot(Band,locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,2)
Band =  BandDepois(4,:) - BandAntes(4,:);
topoplot(Band,locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste, Banda);
title(Title)

%% Subtração Ajustada

teste = sprintf('Subtração PSD Ajustada (D-A)');

subplot(2,4,3+4)
Band =  BandDepois2(1,:) - BandAntes2(1,:);
topoplot(Band,locs)
Banda = sprintf('Alfa');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,4+4)
Band =  BandDepois2(2,:) - BandAntes2(2,:);
topoplot(Band,locs)
Banda = sprintf('Beta');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,1+4)
Band =  BandDepois2(3,:) - BandAntes2(3,:);
topoplot(Band,locs)
Banda = sprintf('Delta');
Title = sprintf('%s %s',teste, Banda);
title(Title)

subplot(2,4,2+4)
Band =  BandDepois2(4,:) - BandAntes2(4,:);
topoplot(Band,locs)
Banda = sprintf('Teta');
Title = sprintf('%s %s',teste, Banda);
title(Title)