T=[];

doublefig=1;

legenda=char('teste_november_v4_20000','DFMO_centroid_20000funcevals','DMultiMadsPB_20000funceval','dms_EB_20000funcevals');

Titulo = 'Maximum \Theta performance profile for 10 runs';
file= 'Theta_max_all';

T(:,1)=[1.040034 1.033533 0.992587 1.055070 1.041402 1.112449 1.019669 0.956869 1.006697 1.004680 1.479029 1.000667 0.997079 0.822477 1.022007 1.000000 1.908346 1.004122 1.124654 0.257334 0.747031 1.185426 0.770975 1.351588 0.737869 1.166950 1.365038 1.141902 1.000000 1.785640 1.002225 0.816481 0.832982 0.956934 1.061335 1.044178 1.228993 1.031683 1.170171 0.967098 1.009275 1.232447 1.001476 1.114095 0.928345 0.846145 0.909095 0.931119 1.705332 1.102371 0.451015 0.633307 1.379431 1.632326 1.113408 1.036925 0.825976 1.203468 0.500000 0.858809 0.000000 1.101530 1.000000 0.000000 0.983416 0.000000 1.426177 1.000000 0.000000 0.541950 1.512076 1.323074 1.117581 0.541844 0.530023 0.536763 1.463820 0.500000 1.183584 0.729500 0.716333 0.933095 0.776787 1.000000 0.954199 0.988986 1.404023 0.716333 0.963843 0.776787 1.000000 1.901076 0.972488 ];
T(:,2)=[1.095739 1.169051 1.644098 1.206899 1.261750 1.291942 1.542065 1.644995 1.250690 1.367089 1.620533 1.429086 1.899668 0.864215 1.009431 1.651489 1.053464 0.896124 1.327847 1.506777 1.262980 1.700514 0.999996 1.142295 0.918531 1.255908 1.375699 0.882514 1.651489 1.035646 0.903962 1.349858 1.518355 1.599846 1.104042 1.140445 1.042560 1.500647 1.884803 1.078581 1.315704 1.090251 1.567182 1.792406 0.702477 1.117424 1.188443 0.882420 0.797650 1.181208 1.384092 1.608100 1.141960 1.000000 1.014797 1.817615 1.352457 1.132569 1.836684 1.686764 0.000000 1.902677 1.993103 0.000000 1.340829 0.000000 1.585306 1.187880 0.000000 0.802804 1.068518 1.370463 1.042340 0.905802 0.947874 1.197329 1.456334 1.000000 1.263408 1.283079 0.875842 1.000000 1.082457 1.651489 1.042490 1.033008 1.233607 0.875842 1.000000 1.082457 1.651489 1.023127 0.893646 ];
T(:,3)=[0.980734 0.830047 1.803880 0.944584 0.999824 1.068395 1.009712 1.055978 0.954393 0.999072 1.295569 0.992509 1.125620 0.894686 0.877393 1.000000 0.885738 0.925265 0.887444 0.847239 0.895646 1.214324 1.271791 1.960987 0.801401 0.770492 1.180087 1.162243 1.000000 0.914102 0.881369 0.956600 0.999997 0.973888 0.906150 0.925870 1.253201 1.007979 0.977249 0.867620 1.030841 1.248239 1.013340 0.989625 0.636321 0.999972 1.000000 0.769727 1.011791 0.953299 0.845516 1.217894 1.461678 0.951111 1.184024 1.176495 0.971198 1.199452 1.655173 0.743333 0.000000 1.343599 1.000000 0.000000 0.925163 0.000000 1.419117 1.000000 0.000000 0.663097 1.113098 1.179931 0.885555 1.075706 0.933897 1.013507 1.364972 0.939147 1.282994 0.746337 0.851672 0.816322 1.073702 1.000000 0.818276 1.009403 1.001771 0.851672 0.744543 1.073702 1.000000 0.826653 0.852210 ];
T(:,4)=[0.754052 1.000000 0.985692 1.170372 0.999487 1.579463 1.101568 1.366920 0.968875 0.999994 1.568556 1.101691 1.529302 1.046949 0.967117 0.920112 0.822480 1.272891 0.632359 0.461873 0.750693 0.500000 0.698431 1.000000 0.648906 0.890972 1.000431 0.935104 0.808268 0.980413 1.296230 0.783409 1.000000 0.953732 0.986105 1.092430 1.221470 1.301076 0.975028 0.899768 1.015563 1.506497 1.012160 1.306897 0.278908 1.000000 1.000000 0.718988 0.679908 0.650609 0.630834 0.790807 1.582668 0.825527 0.727344 1.715330 0.764480 0.566008 0.350953 0.672010 0.000000 0.999150 1.996650 0.000000 0.894959 0.000000 1.006463 1.996988 0.000000 0.372114 0.725406 0.855276 0.840838 0.679354 0.340622 0.346426 1.683522 0.507707 0.421469 1.266241 1.000000 0.999625 0.966554 0.840224 0.907664 1.460120 0.660966 1.000000 1.063813 0.966554 0.840224 1.055312 1.478064 ];
