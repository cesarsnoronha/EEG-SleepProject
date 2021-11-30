%% Comparation of 2 vectors, log of pre and post.

% Alphat = xlsread('Alphat.xlsx',2,'I:BF');
% Alphat = 10*log10(Alphat);
%         A = Alphat(:,kkkk*2-1)';
%         B = Alphat(:,kkkk*2)';
    
    
[~,s] = xlsread('electrode_names.xlsx');
BetaAntes = xlsread('Beta_Area_PSD_Antes.xlsx',1,'B2:Z21');
BetaDepois = xlsread('Beta_Area_PSD_Depois.xlsx',1,'B2:Z21');

A = BetaAntes;
B = BetaDepois;

    [h,p] = ttest(A,B);

for canal = 1:25
    if p(canal) < 0.05

        figure(canal)
        plot(2*ones(1,20),A(:,canal),'.k','MarkerSize', 12) %pontos pre
        hold on % mantem as plotagens no mesmo grafico 
        plot(3*ones(1,20),B(:,canal),'.k','MarkerSize', 12) %valores post

        HOLD = s;
        for i = 1:20 
            h = line([3 2],[B(i,canal) A(i,canal)]); %marca as linhas entre os pontos
            s = h.Color;
            h.Color = 'k'; %cor da linha fica preta
        end
        s = HOLD;
        boxplot([A(:,canal) zeros(20,1) zeros(20,1) B(:,canal)],'Labels',{' ','Pre sleep','Post sleep',' '},'Color', 'k') %cria os boxplot

        electrode = s{canal};
        Title = sprintf('%s (p=%f)', electrode, p(canal));
        title(Title);

        ylabel('Beta activity (dB)') %['FFT power log(' char(181) 'V^2)']);
    end

    %axis([ 0.5 4.5 0 inf]) % ajusta o zoom
    hold off
end