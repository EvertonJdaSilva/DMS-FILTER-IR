function psi_LF_xI = psi_LF(Flist_F,Flist_I)

ind   = Flist_F<=Flist_I;
n_obj = size(Flist_F,1);
aux   = sum(logical(sum(ind) == n_obj));

if aux ~=0
    psi_LF_xI = min(sum(Flist_F-min(Flist_I,Flist_F)));
else
    psi_LF_xI = -min(sum(Flist_I-min(Flist_I,Flist_F)));
end

end