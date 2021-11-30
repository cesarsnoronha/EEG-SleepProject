%%Calculando quem diminui e quem aumenta após a normalização

[~,s] = xlsread('electrode_names.xlsx');
% AlfaAntes = xlsread('Alfa_Area_PSD_Antes.xlsx',1,'B2:Z21');
% AlfaDepois = xlsread('Alfa_Area_PSD_Depois.xlsx',1,'B2:Z21');

% AlfaAntes = xlsread('Beta_Area_PSD_Antes.xlsx',1,'B2:Z21');
% AlfaDepois = xlsread('Beta_Area_PSD_Depois.xlsx',1,'B2:Z21');

% AlfaAntes = xlsread('Delta_Area_PSD_Antes.xlsx',1,'B2:Z21');
% AlfaDepois = xlsread('Delta_Area_PSD_Depois.xlsx',1,'B2:Z21');

AlfaAntes = xlsread('Teta_Area_PSD_Antes.xlsx',1,'B2:Z21');
AlfaDepois = xlsread('Teta_Area_PSD_Depois.xlsx',1,'B2:Z21');

%% Sem Normalizção

Antes = mean(AlfaAntes);
Depois = mean(AlfaDepois);

sub(1,:) = Depois-Antes;

%% Norm por 60Hz
normAntes = xlsread('Antes60Hz.xlsx','B2:Z21');
normDepois = xlsread('Depois60Hz.xlsx','B2:Z21');


Antes = mean(AlfaAntes./normAntes);
Depois = mean(AlfaDepois./normDepois);
sub(2,:) = Depois-Antes;

%% Norm por LowGamma
normAntes = xlsread('AreaLowGammaAntes.xlsx','B2:Z21');
normDepois = xlsread('AreaLowGammaDepois.xlsx','B2:Z21');


Antes = mean(AlfaAntes./normAntes);
Depois = mean(AlfaDepois./normDepois);
sub(3,:) = Depois-Antes;

%% Norm por HighGamma
normAntes = xlsread('AreaHighGammaAntes.xlsx','B2:Z21');
normDepois = xlsread('AreaHighGammaDepois.xlsx','B2:Z21');


Antes = mean(AlfaAntes./normAntes);
Depois = mean(AlfaDepois./normDepois);
sub(4,:) = Depois-Antes;

%% Norm por HighFrequencyOscilation
normAntes = xlsread('HighFrequencyOscilationAntes.xlsx','B2:Z21');
normDepois = xlsread('HighFrequencyOscilationDepois.xlsx','B2:Z21');


Antes = mean(AlfaAntes./normAntes);
Depois = mean(AlfaDepois./normDepois);
sub(5,:) = Depois-Antes;