function [Plist_I,Flist_I,Llist_I,alfa_I] = arg_max_psi(Flist_F,Plist_I,Flist_I,Llist_I,alfa_I)

Flist_F_aux = Flist_F(1:end-1,:);
Flist_I_aux = Flist_I(1:end-1,:);

psi_LF_xI = zeros(size(Flist_I_aux,2),1);
for i=1:size(Flist_I_aux,2)
    psi_LF_xI(i) = psi_LF(Flist_F_aux,Flist_I_aux(:,i));
end

[~,ind] = sort(psi_LF_xI,'descend');

Plist_I = Plist_I(:,ind);
Flist_I = Flist_I(:,ind);
Llist_I = Llist_I(ind);
alfa_I  = alfa_I(ind);

end