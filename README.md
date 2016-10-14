# Habfuzz
Habfuzz is a FORTRAN tool, which calculates the instream hydraulic habitat suitability by utilizing  
1.	Τhe Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975) and  
2.	The Bayesian joint probability inference process as described in Brookes et al. (2010), with fuzzified inputs.

It is specifically structured to quickly calculate the fuzzy-logic- or fuzzy-Bayesian-based instream habitat suitability for fish or freshwater macroinvertebrates along a hydraulically simulated river reach. However, if appropriately modified, it can be applied to wider research topics requiring fuzzy logic to be addressed.

### Why Habfuzz?
Instead of Habfuzz, you can use the non-free MATLAB Fuzzy Logic Toolbox (http://www.mathworks.com/products/fuzzy-logic/) or the free CASiMiR 2D software upon request (http://www.casimir-software.de/ENG/habitate_eng.html). However, Habfuzz has been designed to be a one-click tool, for those researchers with no or very minor programming knowledge, in need of an easy-to-use software to calculate the habitat suitability along a hydrodynamically simulated river reach, based on fuzzy logic. For those researchers who can't afford to purchase MATLAB (because it does everything, but they only need a small amount of its capabilities). And for those self-studying researchers who need a very comprehensive, step-by-step, yet short tutorial to enable them quickly run a tool for a specific part of their project. Moreover, if you are planning to apply a fuzzy Bayesian inference process, Habfuzz is the only option available.
 
A quick overview of the methods applied in Habfuzz is provided in the program's user's guide
https://github.com/chtheodoro/habfuzz/tree/master/documentation  

It is strongly advised to consult the aforementioned manual prior to running Habfuzz. 

### Dependencies
  
Habfuzz was developed using:  
•	the Geany text editor (available at www.geany.org)  
•	the GNU Fortran Compiler (available at https://gcc.gnu.org/wiki/GFortranBinaries)  

Therefore, it is advised to install the specific additional software to ensure that Habfuzz is working properly. Mac users should also install Xcode (available at https://developer.apple.com/xcode/), ideally with its relevant Command Line Tools to enable compiling through the GNU Fortran Compiler.


### Installing
Habfuzz has been tested on Windows 10 - 32 bit and 64 bit operating systems, Ubuntu 16.04 and OS X 10.11 El Capitan (with Xcode 7.3.1 and Xcode 7.3.1. Command Line Tools), using the GNU Fortran Compiler. Depending on your operating system, follow the relevant instructions to run Habfuzz.

#### Windows users
If you only need to run Habfuzz without modifications, just double-click the habfuzz.exe located in the ‘habfuzz’ subfolder. If you need to modify the source code of Habfuzz (which is very probable), re-compilation is necessary. Using the GNU Fortran Compiler, you can either run the wcompile.bat file (which automatically applies the compilation commands), or open a command window, navigate to the ‘habfuzz’ subfolder and type the relevant commands

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 hfbayes.f95 rules.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95

habfuzz.exe will then be replaced by the newly compiled one, being ready to run.

#### Linux users
Open the terminal and navigate to the ‘habfuzz’ subfolder. If you don’t have the GNU Fortran Compiler, you need to be a root user (administrator) and type

###### sudo apt-get install gfortran 

to install the compiler. Having gfortran installed, the commands necessary to compile are the following

###### gfortran -c fdeclarations.f95

###### gfortran fdeclarations.f95 habfuzz.f95 hfbayes.f95 rules.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95 –o habfuzz

Be careful to write exactly the abovementioned commands, arranging the source files in the order given above. Then you can run habfuzz by typing

###### ./habfuzz

#### Mac OS X users
You need to have Xcode installed together with the GNU Fortran Compiler and be a root user to enable compilation. Open the terminal and navigate to the ‘habfuzz’ subfolder. To compile, you can either run the mcompile.sh file (which automatically applies the compilation commands) by typing

###### ./mcompile.sh

or manually type the commands

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz fdeclarations.f95 habfuzz.f95 hfbayes.f95 rules.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95

Habfuzz can then be executed from the command line by typing

###### ./habfuzz

### Usage
Please consult the Habfuzz manual located in the 'documentation' folder or available at https://github.com/chtheodoro/habfuzz/tree/master/documentation

### References
Brooks C.J., Kumar V. and Lane S.N. 2010. A comparison of Fuzzy, Bayesian and Weighted Average formulations of an in-stream habitat suitability model. Proceedings of the International Congress on Environmental Modelling and Software, 5-8 Jul 2010, Ottawa, Canada. Available at http://www.iemss.org/iemss2010/papers/S20/S.20.07.Model%20selection%20and%20uncertainty%20A%20comparison%20of%20Fuzzy,%20Bayesian%20and%20Weighted%20Average%20formulations%20of%20an%20instream%20habitat%20suitability%20model%20-%20CHRISTOPHER%20BROOKES.pdf

Mamdani E.H. and Assilian S. 1975. An experiment in linguistic synthesis with a fuzzy logic
Controller. International Journal of Man-Machine Studies 7: 1-13.

Ross T.J. 2010. Fuzzy logic with engineering applications. Third Edition, John Wiley and Sons, UK.

Zadeh L.A. 1965. Fuzzy sets. Information and Control 8: 338–353.

### What's next
1. Triangular-shaped membership functions
2. Graphical User Interface

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

