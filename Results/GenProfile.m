%clf;
scrn = get(0,'ScreenSize');
%figure('position',[1 1 scrn(3)/1.1 scrn(4)/3]);
figure('position',[1 1 scrn(3)/1.4 scrn(4)/1.5]);
if exist('doublefig') && doublefig>0
    subplot('position', [.13  .11  .65  .8150]);
end
max_ratio=perf(T);
if exist('eixos')
    axis(eixos);
else
%    if max_ratio<50
%        max_ratio=50;
%    end
    if max_ratio>5000
       max_ratio=5000;
    end
    
     old_limit=max(0.125*max_ratio,3);
% %% ----- alteração para fazer zoom à delta - alterado 29_maio_2020
%     old_limit= 3;
%     doublefig=0;
% %% fim alteração-----------------------------------------------------------
    axis([0.5 old_limit 0 1]);
    old_limit=old_limit*1.05;
end
title(Titulo,'FontSize',14);
l1=legend(legenda,'Location','southeast','FontSize',12);
%l1=legend(legenda,4);
%set(l1,'Interpreter','latex');
xlabel('\tau');
ylabel('\rho');

if exist('doublefig') && doublefig>0
    subplot('position', [.79  .11  .145  .8150]);

    max_ratio=perf(T);
%     if max_ratio<100
%         max_ratio=100;
%     end
%     if max_ratio>500000
%         max_ratio=500000;
%     end
    if exist('eixos2')
        axis(eixos2)
    else
        axis([max(old_limit,0.125*max_ratio) 0.99*max_ratio 0 1]);
    end
    set(gca,'YAxisLocation', 'right');
    xlabel('\tau');
    ylabel('\rho');
end

%exportfig(gcf,file,'Color','rgb');
