T=[];

doublefig=1;

legenda=char('dms_filter_IR_20000funceval_newdominance','DFMO_centroid_20000funcevals','DMultiMadsPB_20000funceval','dms_EB_20000funcevals');

Titulo = 'Minimum \Theta performance profile for 10 runs';
file= 'Theta_min_all';

T(:,1)=[0.737869 0.737869 0.729902 1.403525 1.036925 1.534163 1.685680 1.708926 1.001420 1.000794 1.000644 1.478839 1.451610 1.141976 1.373940 1.815955 1.841602 1.481900 1.057145 0.421028 1.468958 1.792373 1.909062 1.063443 0.817888 0.824038 1.038332 1.155475 1.226115 1.060055 1.757371 1.731578 1.744420 1.869632 1.863255 1.632277 1.422185 1.262858 1.456070 1.103324 1.300258 1.868297 1.830642 1.852762 1.507973 1.477468 1.227120 1.021670 1.166825 0.866141 1.144345 0.726744 0.726744 1.848976 1.872110 0.936852 0.500000 1.925115 1.843514 1.028059 1.058883 0.858809 1.058567 1.047804 0.000000 1.109440 1.224594 1.101530 1.351505 1.031683 1.000000 0.954570 1.169700 0.000000 1.015834 0.965656 0.966864 1.011783 1.009275 0.000000 1.449445 1.234620 1.426177 1.000414 1.044860 1.000000 0.999663 1.114095 0.000000 0.934325 1.391673 1.280236 0.542845 0.857685 0.837120 1.021774 1.137642 0.841532 1.569720 0.779828 0.779828 1.000000 1.000000 1.060492 1.325560 1.000000 1.000000 1.795284 1.677465 0.973369 1.117309 1.708391 1.819513 1.032975 1.035644 1.404192 0.969283 1.129134 0.998602 1.115552 1.102371 1.470427 0.982755 1.196878 1.034671 1.034370 1.037715 1.949646 1.034981 1.034358 1.857984 1.860026 1.811536 1.874935 1.865842 1.862254 1.389587 1.377053 1.927938 1.890649 1.393633 1.416368 1.937225 1.946060 1.634756 1.895622 1.929869 1.902225 1.944305 1.953861 1.796382 1.934936 1.938001 1.946309 1.939512 1.941291 1.937906 1.939833 1.940474 1.945964 1.073541 1.075912 0.870183 1.409810 1.032458 1.049860 1.195189 1.189479 1.393204 1.207073 1.166993 1.157591 0.975777 0.959122 1.023762 1.019448 0.939144 0.974396 0.249276 0.430379 0.551905 0.778463 0.669149 0.514881 1.185426 1.358964 1.463820 0.808017 0.999803 1.628065 0.500000 0.999608 0.999909 1.145177 1.119696 1.183584 0.834088 1.000000 1.141306 1.276697 1.166285 1.000000 1.098173 1.854346 1.440076 1.771482 1.611407 1.611407 0.963293 0.997591 0.982753 0.991714 0.964067 0.964067 ];
T(:,2)=[0.918531 0.918531 1.283079 1.233607 1.817615 1.903079 1.906753 1.949663 1.001055 1.001459 1.001507 1.530844 1.986269 1.928119 1.424039 1.517160 1.000000 0.920397 1.643890 1.003226 1.293620 1.000000 1.422344 1.095739 1.349858 1.352457 1.365507 1.178887 1.176546 1.178134 1.029612 1.084242 1.740802 1.053131 1.266934 1.326273 1.242047 1.252833 1.342896 1.550052 1.768504 1.284828 1.146353 1.095093 1.720616 1.915701 1.051139 1.169051 1.255908 1.518355 1.132569 0.875842 0.875842 1.644098 1.644098 1.599846 1.836684 1.001259 1.696192 1.206899 1.104042 1.686764 1.261750 1.140445 0.000000 1.291942 1.042560 1.902677 1.542065 1.500647 1.993103 1.644995 1.884803 0.000000 1.250690 1.078581 1.340829 1.367089 1.315704 0.000000 1.620533 1.090251 1.585306 1.429086 1.567182 1.187880 1.899668 1.792406 0.000000 0.864215 1.375699 0.702477 0.802804 1.000000 1.000000 1.009431 0.882514 1.117424 1.068518 1.082457 1.082457 1.651489 1.651489 1.188443 1.370463 1.651489 1.651489 1.053464 1.035646 0.882420 1.042340 1.042490 1.023127 0.896124 0.903962 0.797650 0.905802 1.033008 0.893646 1.327847 1.181208 1.022332 1.180753 1.409884 1.372014 1.689400 1.663421 1.548571 1.510810 1.530550 1.326344 1.390140 1.587045 1.214121 1.237873 1.309468 1.734345 1.699428 1.061762 1.055178 1.772226 1.678356 1.710326 1.408918 1.397244 1.531202 1.793812 1.194740 1.286408 1.180835 1.104488 1.093740 1.289498 1.151666 1.218091 1.108026 1.425205 1.387183 1.118363 1.114272 1.573142 1.497003 1.618736 1.562636 1.506107 1.491407 1.221892 1.171316 1.613667 1.336614 1.247467 1.197350 0.849954 1.185426 1.313681 1.102552 0.875773 1.057855 1.506777 1.384092 0.947874 1.262980 1.608100 1.197329 1.700514 1.141960 1.456334 0.999996 1.000000 1.000000 1.000000 1.000000 1.000000 1.142295 1.014797 1.263408 1.325011 1.212073 1.045853 1.387421 1.316410 1.094110 1.703446 1.507418 1.498873 1.478506 1.437867 1.437867 1.663783 1.518144 1.396423 1.847772 1.849399 1.849399 ];
T(:,3)=[0.801401 0.801401 0.746337 1.001771 1.176495 1.189369 1.113181 1.115674 0.999822 0.999939 0.999807 1.543019 1.101279 1.320969 1.249769 1.500229 1.000000 1.053486 1.044321 1.660952 1.177271 1.000000 1.580841 0.980734 0.956600 0.971198 0.862070 0.839110 0.875887 0.893115 0.922222 0.892488 1.037664 0.851966 0.846074 0.862701 0.869430 0.819775 0.828152 0.840563 0.805603 0.877293 0.866932 0.889382 0.888263 0.929251 0.839515 0.830047 0.770492 0.999997 1.199452 0.851672 0.851672 1.803880 1.142589 0.973888 1.655173 1.595588 1.275044 0.944584 0.906150 0.743333 0.999824 0.925870 0.000000 1.068395 1.253201 1.343599 1.009712 1.007979 1.000000 1.055978 0.977249 0.000000 0.954393 0.867620 0.925163 0.999072 1.030841 0.000000 1.295569 1.248239 1.419117 0.992509 1.013340 1.000000 1.125620 0.989625 0.000000 0.894686 1.180087 0.636321 0.663097 0.816322 0.744543 0.877393 1.162243 0.999972 1.113098 1.073702 1.073702 1.000000 1.000000 1.000000 1.179931 1.000000 1.000000 0.885738 0.914102 0.769727 0.885555 0.818276 0.826653 0.925265 0.881369 1.011791 1.075706 1.009403 0.852210 0.887444 0.953299 0.971938 1.233817 1.651277 1.720621 1.621483 1.373737 1.484134 1.601134 1.588748 1.197101 1.189624 1.142158 1.014823 1.187686 1.119055 0.946213 1.077231 0.798075 0.850516 1.041124 1.152263 0.852352 0.831335 0.813430 0.826034 0.827081 0.838580 0.886861 1.023945 0.821976 0.830580 0.845605 0.887704 0.841853 0.789983 0.858614 0.920709 0.796977 0.827729 0.774215 0.772594 0.846014 0.851042 0.854600 0.761199 0.797684 0.896766 0.846154 1.064877 0.905465 0.833596 0.769973 0.762568 0.845443 0.804980 0.756980 0.748252 0.847239 0.845516 0.933897 0.895646 1.217894 1.013507 1.214324 1.461678 1.364972 1.271791 1.005708 0.951111 0.939147 1.017264 1.000036 1.960987 1.184024 1.282994 1.060201 0.987810 0.940784 0.816451 1.000000 0.976334 1.257407 1.227387 1.307140 1.065805 1.398310 1.398310 1.191246 1.209054 1.079154 1.022682 1.090064 1.090064 ];
T(:,4)=[0.569457 0.648906 1.266241 0.660966 1.715330 1.022285 1.023584 1.677049 1.001525 1.000793 1.000575 1.541413 1.003781 1.142163 1.326147 1.818181 1.155146 0.961708 1.289255 0.532939 0.844995 1.714768 1.821958 0.754052 0.783409 0.764480 0.968008 1.086614 1.240173 1.012113 1.445129 1.441087 1.031978 1.722425 1.603422 1.509635 1.136149 1.208059 1.021456 0.997851 1.171781 0.836762 1.672834 1.525138 1.586099 1.676343 1.666611 1.000000 0.890972 1.000000 0.566008 1.000000 1.000000 0.985692 0.940528 0.953732 0.350953 0.940192 0.944906 1.170372 0.986105 0.672010 0.999487 1.092430 0.000000 1.579463 1.221470 0.999150 1.101568 1.301076 1.996650 1.366920 0.975028 0.000000 0.968875 0.899768 0.894959 0.999994 1.015563 0.000000 1.568556 1.506497 1.006463 1.101691 1.012160 1.996988 1.529302 1.306897 0.000000 1.046949 1.000431 0.278908 0.372114 0.999625 1.063813 0.967117 0.935104 1.000000 0.725406 0.966554 0.966554 0.920112 0.808268 1.000000 0.855276 0.840224 0.840224 0.822480 0.980413 0.718988 0.840838 0.907664 1.055312 1.272891 1.296230 0.679908 0.679354 1.460120 1.478064 0.632359 0.650609 1.255860 0.962115 0.996357 1.319509 1.312080 1.938440 1.000000 1.628376 1.311648 1.419651 1.437212 1.424235 1.705636 1.509640 1.563425 1.529117 1.083487 1.728697 1.895588 1.308196 1.072770 1.942540 1.909934 1.815743 1.760348 1.934536 1.937855 1.904582 1.809145 1.693494 1.806186 1.881155 1.601026 1.809799 1.823222 1.577835 1.819785 1.841184 1.781569 0.982648 0.980513 1.535565 1.254222 1.293366 0.918082 0.965468 1.093640 0.856863 1.094988 1.045504 1.102105 0.831742 0.782968 0.841829 1.719046 0.893642 0.774349 0.461873 0.630834 0.340622 0.750693 0.790807 0.346426 0.500000 1.582668 1.683522 0.698431 0.999597 0.825527 0.507707 0.999327 0.999928 1.000000 0.727344 0.421469 0.840290 0.910691 0.936499 1.937579 0.948342 0.838370 0.835759 0.986271 1.523887 1.408190 1.708017 1.708017 1.275427 1.469171 1.519534 1.462243 0.968706 0.968706 ];
