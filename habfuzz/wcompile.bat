gfortran -c fdeclarations.f95
gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 tester.f95 ftester.f95 performance.f95

del *.o
del *.mod
