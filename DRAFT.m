if ~paretodominance_original
    [~,ind]=sort(Flist(end,:));
    Plist = Plist(:,ind);
    Flist = Flist(:,ind);
    alfa  = alfa(ind);
    Llist = Llist(ind);
    Flist1 = Flist(:,1);
    Plist1 = Plist(:,1);
    alfa1  = alfa(1);
    Llist1 = Llist(1);
    for i=2:size(Flist,2)
        Ftemp = Flist(:,i);
        [pdom,index_ndom] = paretodominance_November3(Ftemp,Flist1);
        if (pdom == 0)
            Plist1 = [Plist1(:,index_ndom),Plist(:,i)];
            Flist1 = [Flist1(:,index_ndom),Ftemp];
            if (list ~= 4)
                alfa1 = [alfa(index_ndom),alfa(i)];
                Llist1 = [Llist(index_ndom),Llist(i)];
            else
                alfa1 = [alfa1(index_ndom),alfa(i)];
                Llist1 =[Llist1(index_ndom),Llist(i)];
            end
        end
    end
    Plist = Plist1;
    Flist = Flist1;
    alfa  = alfa1;
    Llist = Llist1;
end