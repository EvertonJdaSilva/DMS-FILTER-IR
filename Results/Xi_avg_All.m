T=[];

doublefig=1;

legenda=char('teste_MAY_20000','DFMO_centroid_20000funcevals','DMultiMadsPB_20000funceval','dms_EB_20000funcevals');

Titulo = ' \Gamma performance profile ';
file= 'Xi_avg_all';

T(:,1)=[3.125000 3.125000 3.125000 61.290194 56.213222 22.178209 25.986835 34.004247 1151.306281 1080.978413 1059.338050 58.966793 231.268686 153.922024 2.218768 2.481003 0.963683 8.120188 3.952923 0.003068 0.606942 0.296875 0.390625 0.462746 1.010838 0.492310 0.274794 0.268570 0.780943 0.837980 1.408253 1.538496 0.409863 0.038749 0.031285 0.515705 0.115114 0.176706 0.266992 0.042967 0.031714 0.110588 0.088716 0.075922 0.388990 0.353004 0.083718 0.467467 2.027509 0.015465 0.972808 0.455789 0.455789 198.079817 187.382619 18.052411 0.003902 194.167184 198.714124 4.467904 5.956067 8.756743 5.130144 3.085314 0.000000 5.795207 1.990717 6.662850 112.615116 311.699856 0.000547 0.624295 0.846856 0.000000 16.903182 38.320770 5.893660 13.727420 0.733058 0.000000 12.790946 5.873350 1.513203 315.079059 246.124961 0.000182 2.592928 0.363438 0.000000 0.143320 0.153769 0.000443 0.001682 0.199027 0.081823 0.529591 4.378315 0.011941 0.919759 0.600738 0.600738 6.258749 6.258749 0.126982 0.548828 6.258749 6.258749 0.319253 1.436194 0.153996 0.562341 0.156561 0.216310 9.251302 9.769206 0.515895 1.116462 4.674479 5.951823 0.151389 0.561268 13.602634 6.617704 2.591934 5.746801 5.736427 3.704312 2.023213 5.680564 5.760646 0.931316 0.931316 0.288421 0.138551 0.931316 0.931316 0.779952 0.625947 0.187500 0.085521 0.596257 1.654879 1.481947 1.481947 0.174472 1.121781 1.481932 1.481947 0.858320 0.858320 1.349197 0.171878 0.843072 0.858320 0.392418 0.392418 0.211427 0.203066 0.392418 0.392418 0.734804 0.734804 0.548775 2.056596 0.737113 0.734804 0.192136 0.192136 0.043663 0.179064 0.328671 0.196282 0.060934 0.125668 0.368728 3.712845 0.044915 0.060934 0.065936 0.325929 0.044194 0.334555 0.071566 0.007645 1.587466 0.352910 0.537110 1.208215 6291.238405 0.526284 0.044194 6300.141507 6687.646653 0.056148 0.179657 0.227287 2.889863 3.638578 2.251154 0.060547 3.903866 4.024434 1.385217 3.097531 0.163208 0.197801 0.368176 0.368176 0.221276 0.281491 1.567839 0.651607 0.318770 0.318770 ];
T(:,2)=[8.765763 8.765763 21.583637 10.183728 23.611103 13.922292 5.689614 33.685901 1150.842361 1080.344945 1058.627182 30.164027 230.236994 154.050889 1.954212 1.840173 3.500000 0.178179 4.052025 0.010269 0.217580 2.718781 0.362395 0.318166 0.214046 0.429375 0.542734 0.267813 0.443957 0.171013 0.381817 0.459004 0.506274 0.044810 0.086496 0.244768 0.271882 0.143714 0.198965 0.112888 0.106738 0.300451 0.051898 0.017889 0.299213 0.354792 0.067646 0.167009 0.134921 0.070214 2.489723 0.066554 0.066554 197.996005 198.537962 5.374056 0.184459 197.256460 199.050213 2.205035 6.318631 3.876665 2.509190 1.946453 0.000000 3.153616 15.168100 2.896276 39.096518 132.481839 0.000039 0.571898 1.168469 0.000000 2.081411 2.711775 10.238362 4.538564 0.290941 0.000000 2.643771 21.633670 7.138872 74.220897 24.562262 0.000217 2.275120 0.350366 0.000000 0.050298 0.186405 0.000660 0.003509 0.809567 0.800333 3.875834 3.961960 0.103956 3.758830 3.659765 3.659765 3.989770 3.989770 0.227686 0.529587 3.989770 3.989770 0.642625 0.735156 0.011496 0.084822 0.073656 0.177406 9.122126 9.697372 0.313710 0.534748 4.765148 5.907378 0.404857 0.561265 31.893075 4.357011 3.752048 1.734005 2.079648 2.667170 1.438751 1.244293 1.637061 0.714638 0.684891 0.710185 0.109149 1.483057 1.055938 0.815605 0.951110 0.040787 0.119220 0.184393 0.835636 1.192798 1.354062 0.131041 0.176221 1.361694 0.980974 0.136051 0.152848 1.212393 0.055829 0.352029 0.108794 0.355871 0.342210 0.127991 0.065715 0.070874 0.054979 0.138191 0.076514 0.312456 0.409187 0.217789 0.169928 0.780752 0.685181 0.114651 0.143354 0.408565 0.408564 0.054818 0.091442 0.182414 0.087437 0.045297 0.052741 0.068861 0.354821 0.018171 0.267175 0.208872 0.032550 0.567583 0.901965 0.171979 6731.768916 6335.018153 4.506420 7986.642302 6427.628420 6694.063508 0.041052 0.179590 0.227145 1.201612 3.216504 2.234455 0.126780 2.133883 2.123513 0.651498 0.282376 0.454198 0.100473 0.418966 0.418966 0.221358 0.075146 1.459990 0.399314 0.156708 0.156708 ];
T(:,3)=[3.648589 3.648589 6.559369 5.152673 55.873611 19.880149 22.572370 33.504247 1151.500207 1080.971485 1059.331729 65.146562 222.228116 144.834127 1.946974 1.994387 3.500000 0.222821 2.722291 0.385924 0.248903 2.718781 0.343000 1.171092 0.452031 0.313294 0.431704 0.485231 0.820327 0.202106 0.277022 0.647123 0.053356 0.032396 0.017875 0.310270 0.231992 0.136463 0.161024 0.042743 0.033100 0.164779 0.050852 0.029650 0.380041 0.288928 0.062343 0.171474 0.162629 0.105059 0.972941 0.080595 0.080595 167.974422 151.570061 14.539892 16.339815 75.396585 151.260917 2.429792 4.875937 0.409459 5.906381 5.215774 0.000000 4.749296 5.794613 8.725929 249.696383 277.440305 0.000259 0.522029 1.190916 0.000000 11.959967 25.277506 9.520065 6.186826 0.735338 0.000000 7.722614 10.298176 10.242760 278.793160 301.095713 0.000072 2.681586 0.385186 0.000000 0.062958 0.044491 0.001750 0.002614 0.050043 0.009897 0.167590 3.978352 0.105786 3.839608 0.545812 0.545812 6.258749 6.258749 0.250419 0.541200 6.258749 6.258749 0.781296 0.446989 0.010446 0.844126 0.796718 0.262958 9.183314 24.338697 0.443169 1.084833 8.206582 5.786762 3.298731 3.090996 36.505975 2.729481 3.311634 2.789151 1.130882 1.673198 1.088513 2.444523 1.099225 0.784427 0.980919 0.265053 0.066260 0.705417 1.325069 1.229477 0.805474 0.028530 0.126670 0.029746 2.133737 0.123989 0.932235 0.047068 0.064739 0.933000 0.957217 0.134462 0.112044 0.025665 0.051911 0.319190 0.044028 0.347169 0.378327 0.256153 0.381211 0.145744 0.073078 0.047369 0.035336 0.136260 0.204126 0.093250 0.033888 0.268189 0.149381 0.032662 0.233895 0.167365 0.355652 0.063906 0.067025 0.297241 0.267247 0.088859 0.083017 0.049597 0.242467 0.028000 0.099000 0.103498 0.043000 0.169000 0.661809 0.171000 9.260534 6289.949135 1.518408 1.000000 6302.400557 6687.862030 0.292110 0.113016 0.228013 2.889863 2.194862 2.008210 0.054495 24.268025 2.057765 0.213569 0.209059 0.090828 0.091457 0.494389 0.494389 0.063931 0.108208 1.025945 0.211851 0.165960 0.165960 ];
T(:,4)=[1.696542 1.562500 70.710678 38.182463 28.539078 22.178209 25.986835 34.004247 1151.210307 1081.228413 1059.338050 33.966793 231.268686 153.922024 3.487424 3.499999 0.010610 9.942409 2.967901 0.001356 2.332288 1.494191 0.381835 0.369259 0.268858 0.628882 0.299897 0.038151 2.335449 0.360368 0.086439 0.457068 0.625841 0.025645 0.108624 0.302504 0.211578 0.150044 0.810553 0.156233 0.054548 0.180231 0.267037 0.399969 0.389149 0.354792 0.396600 11.406260 9.237204 0.334607 2.581145 11.451853 11.451853 213.677179 188.710544 20.633488 0.001957 187.586532 204.933943 3.525679 13.209084 0.325193 7.036734 3.287174 0.000000 4.177381 8.608611 31.260611 94.410882 297.497810 0.000007 0.097429 1.010039 0.000000 10.528774 25.380314 12.515049 10.176809 0.586191 0.000000 8.523228 4.111708 24.805610 125.092538 219.797179 0.000005 1.042920 0.208455 0.000000 0.941084 0.687419 0.000881 0.000806 0.809567 0.274117 11.804955 8.138385 0.372115 3.158331 11.588955 11.588955 3.117156 2.117156 0.250419 0.543205 2.141593 2.141593 0.744373 1.936896 0.002495 0.006482 1.485854 1.391738 8.701935 8.808015 0.087944 3.940371 9.901855 9.901841 1.262903 0.561268 9.939158 10.827985 21.769037 4.020623 3.951608 1.882046 2.266745 2.265277 3.948027 3.188041 3.289084 1.168436 0.282535 2.395935 3.040879 1.782487 1.999687 0.066258 0.085521 1.999653 2.115433 0.714363 0.950939 0.082077 0.150769 0.956126 0.950939 0.170675 0.162025 1.355194 0.055365 0.273260 0.430229 0.277867 0.224405 0.033021 0.043956 0.141066 0.154695 0.040019 0.037765 0.462128 3.854365 0.818708 0.043493 0.971109 0.857693 0.096793 0.246094 0.874269 0.857693 0.086035 0.091966 0.125649 0.455589 0.076306 0.069607 0.969358 0.114389 0.003907 0.499999 0.062500 0.003907 0.929769 0.637751 0.536862 3.095545 6289.490262 3.492131 0.001954 6304.001071 6690.976502 0.414783 0.076214 0.227215 1.413192 2.039307 2.406908 0.500000 2.493711 4.024434 0.727729 2.957437 0.283041 0.062113 0.921620 0.921620 0.904967 0.406082 0.852181 0.454981 0.317834 0.317834 ];
