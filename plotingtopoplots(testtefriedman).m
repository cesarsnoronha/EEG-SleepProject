[~,s] = xlsread('electrode_names.xlsx');

locs = get_chanlocs_from_labels(s);

pvalues = xlsread('p-values.xlsx',1,'B2:Z5' ); % 2 8 14 20

pvalues2 = xlsread('p-values.xlsx',1,'B8:Z11' ); % 2 8 14 20


%%

teste = sprintf('test-t');
subplot(2,4,3)
topoplot(pvalues(1,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Alfa');
Title = sprintf('P-values %s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)
    
subplot(2,4,4)
topoplot(pvalues(2,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Beta');
Title = sprintf('P-values %s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,1)
topoplot(pvalues(3,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Delta');
Title = sprintf('P-values %s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

subplot(2,4,2)
topoplot(pvalues(4,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Teta');
Title = sprintf('P-values %s %s',teste, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste);
%saveas(gcf,Title2)

%% 
teste1 = sprintf('test-t (com ajuste)');
subplot(2,4,7)
topoplot(pvalues2(1,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Alfa');
Title = sprintf('P-values %s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)
    
subplot(2,4,8)
topoplot(pvalues2(2,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Beta');
Title = sprintf('P-values %s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,5)
topoplot(pvalues2(3,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Delta');
Title = sprintf('P-values %s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)

subplot(2,4,6)
topoplot(pvalues2(4,:),locs,'maplimits',[0,0.05])
Banda = sprintf('Teta');
Title = sprintf('P-values %s %s',teste1, Banda);
title(Title)
Title2 = sprintf('%s%s.png',Banda,teste1);
%saveas(gcf,Title2)