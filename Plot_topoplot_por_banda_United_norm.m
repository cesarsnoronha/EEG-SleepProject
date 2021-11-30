%% FFT Upload (SEM AJUSTE)
[~,s] = xlsread('electrode_names.xlsx');

locs = get_chanlocs_from_labels(s);

% normAntes = xlsread('AreaLowGammaAntes.xlsx','B2:Z21');
% normDepois = xlsread('AreaLowGammaDepois.xlsx','B2:Z21');

normAntes = xlsread('LOWGAMMA_PSD_Antes.xlsx',1,'B2:Z21');
normDepois = xlsread('LOWGAMMA_PSD_Depois.xlsx',1,'B2:Z21');

AlfaAntesFFT = xlsread('AreaAlfaAntes.xlsx',1,'B2:Z21');
AlfaDepoisFFT = xlsread('AreaAlfaDepois.xlsx',1,'B2:Z21');

BetaAntesFFT = xlsread('AreaBetaAntes.xlsx',1,'B2:Z21');
BetaDepoisFFT = xlsread('AreaBetaDepois.xlsx',1,'B2:Z21');

DeltaAntesFFT = xlsread('AreaDeltaAntes.xlsx',1,'B2:Z21');
DeltaDepoisFFT = xlsread('AreaDeltaDepois.xlsx',1,'B2:Z21');

TetaAntesFFT = xlsread('AreaTetaAntes.xlsx',1,'B2:Z21');
TetaDepoisFFT = xlsread('AreaTetaDepois.xlsx',1,'B2:Z21');


%% Normalizando EEG
[ AlfaDepoisFFT2, AlfaAntesFFT2 ] = normalizandoEEG( AlfaAntesFFT, AlfaDepoisFFT, normAntes, normDepois);
[ BetaDepoisFFT2, BetaAntesFFT2 ] = normalizandoEEG( BetaAntesFFT, BetaDepoisFFT, normAntes, normDepois);
[ DeltaDepoisFFT2, DeltaAntesFFT2 ] = normalizandoEEG( DeltaAntesFFT, DeltaDepoisFFT, normAntes, normDepois);
[ TetaDepoisFFT2, TetaAntesFFT2 ] = normalizandoEEG( TetaAntesFFT, TetaDepoisFFT, normAntes, normDepois);



%% Valores de Banda
BandAntesFFT = [median(AlfaAntesFFT2); median(BetaAntesFFT2); median(DeltaAntesFFT2); median(TetaAntesFFT2)];
BandDepoisFFT = [median(AlfaDepoisFFT2); median(BetaDepoisFFT2); median(DeltaDepoisFFT2); median(TetaDepoisFFT2)];

SubtractedFFT = [median(AlfaAntesFFT2 - AlfaDepoisFFT2); median(BetaAntesFFT2 - BetaDepoisFFT2); median(DeltaAntesFFT2 - DeltaDepoisFFT2); median(TetaAntesFFT2 - TetaDepoisFFT2)];

% BandAntesFFT(:,23:24) = 0;
% BandDepoisFFT(:,23:24) = 0;
% SubtractedFFT(:,23:24) = 0;



%% PSD
AlfaAntesPSD = xlsread('Alfa_Area_PSD_Antes.xlsx',1,'B2:Z21');
AlfaDepoisPSD = xlsread('Alfa_Area_PSD_Depois.xlsx',1,'B2:Z21');

BetaAntesPSD = xlsread('Beta_Area_PSD_Antes.xlsx',1,'B2:Z21');
BetaDepoisPSD = xlsread('Beta_Area_PSD_Depois.xlsx',1,'B2:Z21');

DeltaAntesPSD = xlsread('Delta_Area_PSD_Antes.xlsx',1,'B2:Z21');
DeltaDepoisPSD = xlsread('Delta_Area_PSD_Depois.xlsx',1,'B2:Z21');

TetaAntesPSD = xlsread('Teta_Area_PSD_Antes.xlsx',1,'B2:Z21');
TetaDepoisPSD = xlsread('Teta_Area_PSD_Depois.xlsx',1,'B2:Z21');

[ AlfaDepoisPSD2, AlfaAntesPSD2 ] = normalizandoEEG( AlfaAntesPSD, AlfaDepoisPSD, normAntes, normDepois);
[ BetaDepoisPSD2, BetaAntesPSD2 ] = normalizandoEEG( BetaAntesPSD, BetaDepoisPSD, normAntes, normDepois);
[ DeltaDepoisPSD2, DeltaAntesPSD2 ] = normalizandoEEG( DeltaAntesPSD, DeltaDepoisPSD, normAntes, normDepois);
[ TetaDepoisPSD2, TetaAntesPSD2 ] = normalizandoEEG( TetaAntesPSD, TetaDepoisPSD, normAntes, normDepois);


%% Valores de Banda
BandAntesPSD = [median(AlfaAntesPSD2); median(BetaAntesPSD2); median(DeltaAntesPSD2); median(TetaAntesPSD2)];
BandDepoisPSD = [median(AlfaDepoisPSD2); median(BetaDepoisPSD2); median(DeltaDepoisPSD2); median(TetaDepoisPSD2)];

SubtractedPSD = [median(AlfaAntesPSD2 - AlfaDepoisPSD2); median(BetaAntesPSD2 - BetaDepoisPSD2); median(DeltaAntesPSD2 - DeltaDepoisPSD2); median(TetaAntesPSD2 - TetaDepoisPSD2)];

BandAntesPSD(:,23:24) = 0;
BandDepoisPSD(:,23:24) = 0;
SubtractedPSD(:,23:24) = 0;



%% (valores de banda e valotes de p)
displayopt = sprintf('off');

k=1; % T-test FFT
for j = 1:25
[~,p1(k,j)] = ttest(AlfaAntesFFT2(:,j), AlfaDepoisFFT2(:,j));
end
k=2;
for j = 1:25
[~,p1(k,j)] = ttest(BetaAntesFFT2(:,j), BetaDepoisFFT2(:,j));
end
k=3;
for j = 1:25
[~,p1(k,j)] = ttest(DeltaAntesFFT2(:,j), DeltaDepoisFFT2(:,j));
end
k=4;
for j = 1:25
[~,p1(k,j)] = ttest(TetaAntesFFT2(:,j), TetaDepoisFFT2(:,j));
end

k=1; % T-test PSD
for j = 1:25
[~,p2(k,j)] = ttest(AlfaAntesPSD2(:,j), AlfaDepoisPSD2(:,j));
end
k=2;
for j = 1:25
[~,p2(k,j)] = ttest(BetaAntesPSD2(:,j), BetaDepoisPSD2(:,j));
end
k=3;
for j = 1:25
[~,p2(k,j)] = ttest(DeltaAntesPSD2(:,j), DeltaDepoisPSD2(:,j));
end
k=4;
for j = 1:25
[~,p2(k,j)] = ttest(TetaAntesPSD2(:,j), TetaDepoisPSD2(:,j));
end

k=1; % friedman FFT
for j = 1:25
    tofriedman = [AlfaAntesFFT2(:,j) AlfaDepoisFFT2(:,j)];
    p3(k,j) = friedman(tofriedman,1,displayopt);
end
k=2;
for j = 1:25
    tofriedman = [BetaAntesFFT2(:,j) BetaDepoisFFT2(:,j)];
    p3(k,j) = friedman(tofriedman,1,displayopt);
end
k=3;
for j = 1:25
    tofriedman = [DeltaAntesFFT2(:,j) DeltaDepoisFFT2(:,j)];
    p3(k,j) = friedman(tofriedman,1,displayopt);
end
k=4;
for j = 1:25
    tofriedman = [TetaAntesFFT2(:,j) TetaDepoisFFT2(:,j)];
    p3(k,j) = friedman(tofriedman,1,displayopt);
end

k=1; % friedman PSD
for j = 1:25
    tofriedman = [AlfaAntesPSD2(:,j) AlfaDepoisPSD2(:,j)];
    p4(k,j) = friedman(tofriedman,1,displayopt);
end
k=2;
for j = 1:25
    tofriedman = [BetaAntesPSD2(:,j) BetaDepoisPSD2(:,j)];
    p4(k,j) = friedman(tofriedman,1,displayopt);
end
k=3;
for j = 1:25
    tofriedman = [DeltaAntesPSD2(:,j) DeltaDepoisPSD2(:,j)];
    p4(k,j) = friedman(tofriedman,1,displayopt);
end
k=4;
for j = 1:25
    tofriedman = [TetaAntesPSD2(:,j) TetaDepoisPSD2(:,j)];
    p4(k,j) = friedman(tofriedman,1,displayopt);
end

%% Plotando imagens
Banda = sprintf('Alfa (N-PSD)'); i = 1;
%%
Banda = sprintf('Beta (N-PSD)'); i = 2;
%%
Banda = sprintf('Delta (N-PSD)'); i = 3;
%%
Banda = sprintf('Teta (N-PSD)'); i = 4;

%% Plot
teste = sprintf('Media Antes FFT'); %Media Antes
% subplot(2,5,1)
h=subtightplot(2,5,1,[0,0]);
topoplot(BandAntesFFT(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;

teste = sprintf('Media Antes PSD'); %Media Antes
% subplot(2,5,1+5)
h=subtightplot(2,5,1+5,[0,0]);
topoplot(BandAntesPSD(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;


teste = sprintf('Media Depois FFT'); %Media Antes
% subplot(2,5,2)
h=subtightplot(2,5,2,[0,0]);
topoplot(BandDepoisFFT(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;

teste = sprintf('Media Depois PSD'); %Media Antes
% subplot(2,5,2+5)
h=subtightplot(2,5,2+5,[0,0]);
topoplot(BandDepoisPSD(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;


teste = sprintf('Subtração FFT (D-A)'); %Media Antes
% subplot(2,5,3)
h=subtightplot(2,5,3,[0,0]);
topoplot(SubtractedFFT(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;

teste = sprintf('Subtração PSD (D-A)'); %Media Antes
% subplot(2,5,3+5)
h=subtightplot(2,5,3+5,[0,0]);
topoplot(SubtractedPSD(i,:),locs)
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;


teste = sprintf('teste-t FFT'); %Media Antes
% subplot(2,5,4)
h=subtightplot(2,5,4,[0,0]);
topoplot(p1(i,:),locs,'maplimits',[0,0.05])
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;

teste = sprintf('teste-t PSD'); %Media Antes
% subplot(2,5,4+5)
h=subtightplot(2,5,4+5,[0,0]);
topoplot(p2(i,:),locs,'maplimits',[0,0.05])
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;



teste = sprintf('Friedman FFT'); %Media Antes
% subplot(2,5,5)
h=subtightplot(2,5,5,[0,0]);
topoplot(p3(i,:),locs,'maplimits',[0,0.05])
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;

teste = sprintf('Friedman PSD'); %Media Antes
% subplot(2,5,5+5)
h=subtightplot(2,5,5+5,[0,0]);
topoplot(p4(i,:),locs,'maplimits',[0,0.05])
Title = sprintf('%s %s', Banda,teste);
title(Title)
ax = gca;
ax.FontSize = 11;