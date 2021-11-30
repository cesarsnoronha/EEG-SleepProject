function [ p, cc ] = ObtendoNormalizado( Band, norm) 

% Normalização
tamanho = size(Band,2);
cc = zeros(tamanho,1);
p = zeros(tamanho,1);

for i = 1:tamanho
[cc1,p1] = corrcoef(Band(:,i),norm(:,i));
cc(i) = cc1(2,1);
p(i) = p1(2,1);
end
% 
% cc = cc';
% p = p';

end

% % Para teste:
% Band = xlsread('Alfa_Antes_FFT.xlsx',1,'B2:Z21');
% tamanho = size(Band,2)-1;
% %norm= repmat(Band(:,tamanho+1), 1, tamanho);
% norm= Band(:,tamanho+1);
% 
% %for i = 1:tamanho
% i=3;
% 
% [cc,p] = corrcoef(Band(:,i),norm(:,i));
% cc(2,1) 
% p(2,1)