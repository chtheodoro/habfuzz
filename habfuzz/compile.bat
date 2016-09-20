gfortran -c fdeclarations.f95
gfortran -c habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95
gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95