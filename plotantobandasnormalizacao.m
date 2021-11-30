%% Comparando normalizações

%Donwloading Different Normalizarion Bands
SixtyHzAntes = xlsread('Antes60Hz.xlsx','J2:J21');
SixtyHzDepois = xlsread('Depois60Hz.xlsx','J2:J21');
SixtyHz = [SixtyHzAntes' SixtyHzDepois'];

HGAntes = xlsread('AreaHighGammaAntes.xlsx','J2:J21');
HGDepois = xlsread('AreaHighGammaDepois.xlsx','J2:J21');
HighGamma = [HGAntes' HGDepois'];

LGAntes = xlsread('AreaLowGammaAntes.xlsx','J2:J21');
LGDepois = xlsread('AreaLowGammaDepois.xlsx','J2:J21');
LowGamma = [LGAntes' LGDepois'];

HFOAntes = xlsread('HighFrequencyOscilationAntes.xlsx','J2:J21');
HFODepois = xlsread('HighFrequencyOscilationDepois.xlsx','J2:J21');
HFO = [HFOAntes' HFODepois'];
%%
BandAntes = xlsread('AreaAlfaAntes.xlsx',1,'J2:J21'); %O1
BandDepois = xlsread('AreaAlfaDepois.xlsx',1,'J2:J21'); %O1

% BandAntes1 = xlsread('AreaBetaAntes.xlsx',1,'J2:J21'); %O1
% BandDepois1 = xlsread('AreaBetaDepois.xlsx',1,'J2:J21'); %O1
BandAntes1 = xlsread('Beta_Area_PSD_Antes.xlsx',1,'J2:J21'); %O1
BandDepois1 = xlsread('Beta_Area_PSD_Depois.xlsx',1,'J2:J21'); %O1

BandAntes2 = xlsread('AreaDeltaAntes.xlsx',1,'J2:J21'); %O1
BandDepois2 = xlsread('AreaDeltaDepois.xlsx',1,'J2:J21'); %O1

BandAntes3 = xlsread('AreaTetaAntes.xlsx',1,'J2:J21'); %O1
BandDepois3 = xlsread('AreaTetaDepois.xlsx',1,'J2:J21'); %O1
% %%
% BandAntes = xlsread('AreaAlfaAntes.xlsx',1,'K2:K21'); %O2
% BandDepois = xlsread('AreaAlfaDepois.xlsx',1,'K2:K21'); %O2

Alfa = [BandAntes' BandDepois']; 
Beta = [BandAntes1' BandDepois1']; 
Delta = [BandAntes2' BandDepois2']; 
Teta = [BandAntes3' BandDepois3']; 
%% Alfa x Todas as Bandas de Normalização
tempo = [ "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois"  "Depois" "Depois" "Depois" "Depois" "Depois"];
[~,~,~,~] = aoctool(SixtyHz,Alfa,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(HighGamma,Alfa,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Alfa,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(HFO,Alfa,tempo,'','','','','on','separate lines');

%% Todas as bandas x Low Gamma em O1
tempo = [ "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois"  "Depois" "Depois" "Depois" "Depois" "Depois"];
[~,~,~,~] = aoctool(LowGamma,Alfa,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Beta,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Delta,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Teta,tempo,'','','','','on','separate lines');

%% Plotando normalizado

[ AlfaDepoisn, AlfaAntesn] = normalizandoEEG1linha( BandAntes, BandDepois, LGAntes, LGDepois);
[ BetaDepoisn, BetaAntesn] = normalizandoEEG1linha( BandAntes1, BandDepois1, LGAntes, LGDepois);
[ DeltaDepoisn, DeltaAntesn] = normalizandoEEG1linha( BandAntes2, BandDepois2, LGAntes, LGDepois);
[ TetaDepoisn, TetaAntesn] = normalizandoEEG1linha( BandAntes3, BandDepois3, LGAntes, LGDepois);

Alfan = [AlfaAntesn' AlfaDepoisn']; 
Betan = [BetaAntesn' BetaDepoisn']; 
Deltan = [DeltaAntesn' DeltaDepoisn']; 
Tetan = [TetaAntesn' TetaDepoisn']; 

%% Todas as bandas normalizadas x Low Gamma em O1
tempo = [ "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois"  "Depois" "Depois" "Depois" "Depois" "Depois"];
[~,~,~,~] = aoctool(LowGamma,Alfan,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Betan,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Deltan,tempo,'','','','','on','separate lines');
[~,~,~,~] = aoctool(LowGamma,Tetan,tempo,'','','','','on','separate lines');

%%
[~,s] = xlsread('electrode_names.xlsx');
canal = 9;
A = BetaAntesn;
B = BetaDepoisn;

    [h,p] = ttest(A,B);

        figure(canal)
        plot(2*ones(1,20),A(:),'.k','MarkerSize', 12) %pontos pre
        hold on % mantem as plotagens no mesmo grafico 
        plot(3*ones(1,20),B(:),'.k','MarkerSize', 12) %valores post

        HOLD = s;
        for i = 1:20 
            h = line([3 2],[B(i) A(i)]); %marca as linhas entre os pontos
            s = h.Color;
            h.Color = 'k'; %cor da linha fica preta
        end
        s = HOLD;
        boxplot([A(:) zeros(20,1) zeros(20,1) B(:)],'Labels',{' ','Pre sleep','Post sleep',' '},'Color', 'k') %cria os boxplot

        electrode = s{canal};
        Title = sprintf('%s Normalized (p=%f)', electrode, p);
        title(Title);

        ylabel('Beta activity (dB)') %['FFT power log(' char(181) 'V^2)']);

    %axis([ 0.5 4.5 0 inf]) % ajusta o zoom
    hold off
