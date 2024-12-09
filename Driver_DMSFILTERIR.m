clear;
lbound = -5*ones(3,1);
ubound = 5*ones(3,1);
x_ini  = zeros(3,1);

[Plist,Flist,alfa,func_eval] = dms_filter_IR(1,'func_F',[],[],[],lbound,ubound,'func_C');

fig = figure(1);
plot(Flist(1,:),Flist(2,:),'LineStyle','None','Color','r','Marker','o','MarkerSize',10)
xlabel('f1')
ylabel('f2')
legenda=char('DMS-FILTER-IR');
l1=legend(legenda,'Location','northeast','FontSize',10);
print(fig,'-dpng','Example.png')