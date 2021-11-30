%% Comparation of 2 vectors, log of pre and post.

% Alphat = xlsread('Alphat.xlsx',2,'I:BF');
% Alphat = 10*log10(Alphat);
% [d,s] = xlsread('electrode_names.xlsx');

for kkkk = 1:25
  
    A = Alphat(:,kkkk*2-1)';
    B = Alphat(:,kkkk*2)';
    
[h,p] = ttest(A,B);


if p < 0.05

figure  
plot(2*ones(1,20),A,'.k','MarkerSize', 12) %pontos pre
hold on % mantem as plotagens no mesmo grafico 
plot(3*ones(1,20),B,'.k','MarkerSize', 12) %valores post

HOLD = s;
for i = 1:20 
    h = line([3 2],[B(i) A(i)]); %marca as linhas entre os pontos
    s = h.Color;
    h.Color = 'k'; %cor da linha fica preta
end
s = HOLD;
boxplot([A' zeros(20,1) zeros(20,1) B'],'Labels',{' ','Pre sleep','Post sleep',' '},'Color', 'k') %cria os boxplot

electrode = s{kkkk};
Title = sprintf('%s (p=%f)', electrode, p);
title(Title);

ylabel('Alpha activity (dB)') %['FFT power log(' char(181) 'V^2)']);
end

%axis([ 0.5 4.5 0 inf]) % ajusta o zoom
hold off
end