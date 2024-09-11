problems_2ALL

% 500
%teste_OnlyFilter;
%teste_FilterIR;
%
%5000
teste;
teste1;
for j=1:size(problems,1)
    % 500
    %S1 = eval(strcat(['teste_OnlyFilter_' strtrim(problems(j,:))]));
    %S2 = eval(strcat(['teste_FilterIR_' strtrim(problems(j,:))]));     
    % 5000
    S1 = eval(strcat(['teste_' strtrim(problems(j,:))])); 
    S2 = eval(strcat(['teste1_' strtrim(problems(j,:))]));
    if size(S1,2)==2
        h = figure(j);    
        plot(S1(:,1),S1(:,2),'LineStyle','None','Color','r','Marker','o','MarkerSize',10)
        hold on
        plot(S2(:,1),S2(:,2),'LineStyle','None','Color','b','Marker','*','MarkerSize',10)                
        xlabel('f1')
        ylabel('f2')
    else
        h = figure(j);   
        plot3(S1(:,1),S1(:,2),S1(:,3),'LineStyle','None','Marker','o','MarkerSize',8,'Color','r','LineWidth',2)        
        hold on
        plot3(S2(:,1),S2(:,2),S2(:,3),'LineStyle','None','Marker','x','MarkerSize',8,'Color','b','LineWidth',2)        
    end
    legenda=char('DMS-FILTER','DMS-FILTER-IR');
    l1=legend(legenda,'Location','northeast','FontSize',10);
    %savefig(figure(j),['ParetoFront\FIG\' strtrim(problems(j,:)) '.fig'])
    print(h,'-dpng',['ParetoFront\PNG\' strtrim(problems(j,:)) '.png']);
    close all
end