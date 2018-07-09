![habfuzz_dos_small](https://user-images.githubusercontent.com/21544603/32095917-7bce3b6e-bb0d-11e7-88f2-6ae9b04f08e7.png)

[![DOI](https://zenodo.org/badge/68698452.svg)](https://zenodo.org/badge/latestdoi/68698452)
[![status](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2/status.svg)](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2)
![](http://www.repostatus.org/badges/latest/active.svg)
![](https://img.shields.io/badge/version-2.3-red.svg)
![](https://img.shields.io/badge/topic-Habitat_modelling-blue.svg)

A video tutorial is available at https://www.youtube.com/watch?v=ed9snGdnlr4

### What’s new on Habfuzz 2.3?
a. Habfuzz is fully automated! Input your data and get the results! The software is data-driven and calculates everything it needs internally!

b. This version includes temperature (or shading) in the habitat suitability calculations (if you only intend to include flow velocity, water depth and substrate type, contact us at ctheodor@hcmr.gr to provide you with the solution).

c. Option to select between Monte Carlo and ten-fold cross validation to calculate model's performance as the percentage of correctly classified instances.

d. New habitat suitability metrics added:  
i.   Overall Suitability Index (OSI) - The sum of all habitat suitability values of the computational mesh.  
ii.  Normalized OSI (nOSI) - OSI normalized by dividing with the number of wetted nodes in the mesh.  
iii. Certainty of prediction (COP): The ratio of the No. of microhabitat combinations actually 'found' in the training dataset to the total No. of nodes in the computational mesh; Habfuzz applies a trick when a microhabitat combination is not found in the training dataset and instead of returning some arbitrary habitat suitability value for a particular node (e.g. -1), it uses the value of its neighboring node in the domain.  
iv.  Percentage of wetted nodes in the computational mesh at each Q scenario (w).  
v.  Habitat connectivity (C): The ratio of connected (neighboring) nodes with habitat suitability higher than 0.6 to the total number of wetted nodes with habitat suitability higher than 0.6.  
vi.  Habitat availability (A): The ratio of connected (neighboring) nodes with habitat suitability higher than 0.6 to the total number of nodes in the study reach (wetted and dry).  
 
### Why Habfuzz?
Habfuzz is a fully automated software, which calculates the instream habitat suitability by utilizing

a. Τhe Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975) and  
b. The Bayesian joint probability inference process as described in Brookes et al. (2010), with fuzzified inputs.  

It is specifically structured to quickly calculate the fuzzy-logic- or fuzzy-Bayesian-based instream habitat suitability for fish or freshwater macroinvertebrates along a hydraulically simulated river reach. However, if appropriately modified, it can be applied to wider research topics requiring fuzzy logic to be addressed.

Habfuzz has been designed to be a one-click tool, for those researchers with no or very minor programming knowledge, in need of an easy-to-use software to calculate the habitat suitability along a hydrodynamically simulated river reach, based on fuzzy logic. Or for those self-studying researchers who need a very comprehensive, step-by-step, yet short tutorial to enable them quickly run a tool for a specific part of their project.

### Dependencies

It is advised to install the GNU Fortran Compiler (download at https://gcc.gnu.org/wiki/GFortranBinaries) to quickly compile Habfuzz through the relevant Windows and OS X files (however, experienced users may also use their preferred compilers).

For Mac users, Xcode (download at https://developer.apple.com/xcode/) with its relevant Command Line Tools should be installed to enable compiling through the GNU Fortran Compiler.

### Installing
Habfuzz has been tested on Windows 10 - 32 bit and 64 bit operating systems, Ubuntu 16.04 and OS X 10.11 El Capitan (with Xcode 7.3.1 and Xcode 7.3.1. Command Line Tools), using the GNU Fortran Compiler. Depending on your operating system, follow the relevant instructions to run Habfuzz.

#### Windows users
If the user needs to modify the source code of Habfuzz, re-compilation is necessary. Using the GNU Fortran Compiler, you can either run the wcompile.bat file, or open a command window, navigate to the ‘habfuzz’ subfolder and type the relevant commands:

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz.f95 fdeclarations.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95

###### del *.o
###### del *.mod

habfuzz.exe will then be replaced by the newly compiled one, being ready to run.

#### Linux users
Open the terminal and navigate to the ‘habfuzz’ subfolder. If you don’t have the GNU Fortran Compiler, you need to be a root user (administrator) and type

###### sudo apt-get install gfortran 

to install the compiler. Having gfortran installed, the commands necessary to compile are the following

###### gfortran -c fdeclarations.f95

###### gfortran habfuzz.f95 fdeclarations.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95 –o habfuzz

Be careful to write exactly the abovementioned commands, arranging the source files in the order given above. Then you can run habfuzz by typing

###### ./habfuzz

#### Mac OS X users
You need to have Xcode installed together with the GNU Fortran Compiler and be a root user to enable compilation. Open the terminal and navigate to the ‘habfuzz’ subfolder. To compile, you can either run the mcompile.sh file (which automatically applies the compilation commands) by typing

###### ./mcompile.sh

or manually type the commands

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95

Habfuzz can then be executed from the command line by typing

###### ./habfuzz

### Usage
Please consult the Habfuzz manual.

### References
Brookes C.J., Kumar V. and Lane S.N. 2010. A comparison of Fuzzy, Bayesian and Weighted Average formulations of an in-stream habitat suitability model. Proceedings of the International Congress on Environmental Modelling and Software, 5-8 Jul 2010, Ottawa, Canada.

Mamdani E.H. and Assilian S. 1975. An experiment in linguistic synthesis with a fuzzy logic controller. International Journal of Man-Machine Studies 7: 1-13.

Ross T.J. 2010. Fuzzy logic with engineering applications. Third Edition, John Wiley and Sons, UK.

Zadeh L.A. 1965. Fuzzy sets. Information and Control 8: 338–353.

### Contact Information

Hellenic Centre for Marine Research  
Institute of Marine Biological Resources and Inland Waters  
46.7 km Athens-Sounio ave.  
19013  
Anavyssos  
Greece  
Tel. +30 22910 76335  
Fax. +30 22910 76419  
Email. ctheodor@hcmr.gr  
URL. http://www.hcmr.gr/en/  

National Technical University of Athens  
Department of Water Resources and Environmental Engineering  
Iroon Polytechniou 5  
15780  
Athens  
Greece  
Tel. +30 210 7722809  
Fax. +30 210 7722814  
Email. stamou@central.ntua.gr  
URL. https://www.hydro.ntua.gr/?set_language=en  

### Contributing
To report bugs, possible amendments or anything else you would like to discuss, please file a GitHub issue or contact Mr. Christos Theodoropoulos at ctheodor@hcmr.gr. Pull requests are highly welcomed.
