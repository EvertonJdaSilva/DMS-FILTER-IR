T=[];

doublefig=1;

legenda=char('teste_MAY_AE_SD_20000','DFMO_centroid_20000funcevals','DMultiMadsPB_20000funceval','dms_EB_20000funcevals');

Titulo = 'Minimum \Xi performance profile for 10 runs';
file= 'Xi_min_all';

T(:,1)=[0.462746 0.467467 198.079817 4.467904 5.130144 5.795207 112.615116 0.624295 16.903182 13.727420 12.790946 315.079059 2.592928 0.143320 0.529591 6.258749 0.319253 9.251302 0.151389 0.065936 0.334555 1.587466 1.208215 0.056148 3.125000 2.027509 0.153769 4.378315 6.258749 1.436194 9.769206 1.010838 0.015465 18.052411 5.956067 3.085314 1.990717 311.699856 0.846856 38.320770 0.733058 5.873350 246.124961 0.363438 0.000443 0.009744 0.126982 0.153996 0.515895 0.561268 0.325929 0.071566 0.352910 0.526284 0.179657 56.213222 0.492310 0.972808 0.003902 8.756743 0.000000 6.662850 0.000547 0.000000 5.893660 0.000000 1.513203 0.000182 0.000000 0.001682 0.919759 0.548828 0.562341 1.116462 0.044194 0.007645 0.537110 0.044194 0.227287 3.125000 0.455789 0.199027 0.600738 6.258749 0.156561 4.674479 61.290194 0.455789 0.081823 0.600738 6.258749 0.216310 5.951823 ];
T(:,2)=[0.318166 0.167009 197.996005 2.205035 2.509190 3.153616 39.096518 0.571898 2.081411 4.538564 2.643771 74.220897 2.275120 0.050298 3.875834 3.989770 0.642625 9.122126 0.404857 0.068861 0.267175 0.567583 6731.768916 0.041052 8.765763 0.134921 0.186405 3.961960 3.989770 0.735156 9.697372 0.214046 0.070214 5.374056 6.318631 1.946453 15.168100 132.481839 1.168469 2.711775 0.290941 21.633670 24.562262 0.350366 0.000660 0.103956 0.227686 0.011496 0.313710 0.561265 0.354821 0.208872 0.901965 4.506420 0.179590 23.611103 0.429375 2.489723 0.184459 3.876665 0.000000 2.896276 0.000039 0.000000 10.238362 0.000000 7.138872 0.000217 0.000000 0.003509 3.758830 0.529587 0.084822 0.534748 0.018171 0.032550 0.171979 7986.642302 0.227145 21.583637 0.066554 0.809567 3.659765 3.989770 0.073656 4.765148 10.183728 0.066554 0.800333 3.659765 3.989770 0.177406 5.907378 ];
T(:,3)=[1.171092 0.171474 167.974422 2.429792 5.906381 4.749296 249.696383 0.522029 11.959967 6.186826 7.722614 278.793160 2.681586 0.062958 0.167590 6.258749 0.781296 9.183314 3.298731 0.049597 0.099000 0.169000 9.260534 0.292110 3.648589 0.162629 0.044491 3.978352 6.258749 0.446989 24.338697 0.452031 0.105059 14.539892 4.875937 5.215774 5.794613 277.440305 1.190916 25.277506 0.735338 10.298176 301.095713 0.385186 0.001750 0.105786 0.250419 0.010446 0.443169 3.090996 0.242467 0.103498 0.661809 1.518408 0.113016 55.873611 0.313294 0.972941 16.339815 0.409459 0.000000 8.725929 0.000259 0.000000 9.520065 0.000000 10.242760 0.000072 0.000000 0.002614 3.839608 0.541200 0.844126 1.084833 0.028000 0.043000 0.171000 1.000000 0.228013 6.559369 0.080595 0.050043 0.545812 6.258749 0.796718 8.206582 5.152673 0.080595 0.009897 0.545812 6.258749 0.262958 5.786762 ];
T(:,4)=[0.369259 11.406260 213.677179 3.525679 7.036734 4.177381 94.410882 0.097429 10.528774 10.176809 8.523228 125.092538 1.042920 0.941084 11.804955 3.117156 0.744373 8.701935 1.262903 0.969358 0.499999 0.929769 3.095545 0.414783 1.562500 9.237204 0.687419 8.138385 2.117156 1.936896 8.808015 0.268858 0.334607 20.633488 13.209084 3.287174 8.608611 297.497810 1.010039 25.380314 0.586191 4.111708 219.797179 0.208455 0.000881 0.372115 0.250419 0.002495 0.087944 0.561268 0.114389 0.062500 0.637751 3.492131 0.076214 28.539078 0.628882 2.581145 0.001957 0.325193 0.000000 31.260611 0.000007 0.000000 12.515049 0.000000 24.805610 0.000005 0.000000 0.000806 3.158331 0.543205 0.006482 3.940371 0.003907 0.003907 0.536862 0.001954 0.227215 70.710678 11.451853 0.809567 11.588955 2.141593 1.485854 9.901855 38.182463 11.451853 0.274117 11.588955 2.141593 1.391738 9.901841 ];
