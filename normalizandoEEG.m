function [ BandDepois2, BandAntes2 ] = normalizandoEEG( AlfaAntes, AlfaDepois, normAntes, normDepois) 

% Normalização

for i = 1:size(AlfaAntes,2)
Band1 = [AlfaAntes(:,i)' AlfaDepois(:,i)']; 
norm1 = [normAntes(:,i)' normDepois(:,i)'];
tempo = [ "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Antes" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois" "Depois"  "Depois" "Depois" "Depois" "Depois" "Depois"];
[h,atab,ctab,stats] = aoctool(norm1,Band1,tempo,'','','','','off','separate lines');
% % Recalculando valores do erro
% B = cell2mat(ctab(2,2)) + cell2mat(ctab(3,2));
% A = cell2mat(ctab(5,2)) + cell2mat(ctab(6,2));
% AlfaAntesE = AlfaAntes(:,i) - B - A*normAntes;
% 
% B = cell2mat(ctab(2,2)) + cell2mat(ctab(4,2));
% A = cell2mat(ctab(5,2)) + cell2mat(ctab(7,2));
% AlfaDepoisE = AlfaDepois(:,i) - B - A*normDepois;
% 
% % Calculando novos valores a partir do Parallel lines
% [h,atab,ctab,stats] = aoctool(norm1,Band1,tempo,'','','','','off','separate lines');
% % Curva da Banda antes
% B1 = cell2mat(ctab(2,2)) + cell2mat(ctab(3,2));
A1 = cell2mat(ctab(5,2)) + cell2mat(ctab(6,2));
% Curva da Banda depois
% B2 = cell2mat(ctab(2,2)) + cell2mat(ctab(4,2));
A2 = cell2mat(ctab(5,2)) + cell2mat(ctab(7,2));

BandAntes2(:,i) = AlfaAntes(:,i) -A1*normAntes(:,i);
BandDepois2(:,i) = AlfaDepois(:,i) -A2*normDepois(:,i);

% BandAntes2(:,i) = (AlfaAntes(:,i) - B1 - AlfaAntesE)/A1 + B1 + AlfaAntesE;
% BandDepois2(:,i) = (AlfaDepois(:,i) - B2 - AlfaDepoisE)/A2 + B2 + AlfaDepoisE;
end
end