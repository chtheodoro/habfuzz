![habfuzz_plus_small](https://user-images.githubusercontent.com/21544603/52857330-82408080-312f-11e9-95a0-193a3b93106a.png)

[![DOI](https://zenodo.org/badge/68698452.svg)](https://zenodo.org/badge/latestdoi/68698452)
[![status](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2/status.svg)](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2)
![](http://www.repostatus.org/badges/latest/active.svg)
![](https://img.shields.io/badge/version-2.3-red.svg)
![](https://img.shields.io/badge/topic-Habitat_modelling-blue.svg)

#### Wait, did you say command-line? So, there's no Graphical User Interface?
Yes, it's quicker this way. You just need to prepare a single input file with your data, run the program and get the results in a single output file! Check out the manual https://github.com/chtheodoro/habfuzz/blob/master/The_HABFUZZ_manual.pdf.
We have made it even easier for you, a video tutorial is now available at https://www.youtube.com/watch?v=ed9snGdnlr4 

#### HABFUZZ - A command-line tool for data-driven fuzzy habitat modelling

![habfuzz_flow](https://user-images.githubusercontent.com/21544603/53111372-9e845900-3545-11e9-8028-6e1b32ee1c0a.png)

HABFUZZ predicts the value of any response variable, given a set of up to four predictors, using fuzzy logic and fuzzy rule-based Bayesian algorithms.

It has been initially structured to quickly calculate the habitat suitability for freshwater macroinvertebrates in a hydraulically simulated river reach, given the flow velocity, the water depth, the substrate and the water temperature. But it can now be applied to any topic that requires the prediction of a response variable using fuzzy logic and up to four predictors.

The algorithms implemented in HABFUZZ are  
a. Τhe Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975) and  
b. The Bayesian joint probability inference process as described in Brookes et al. (2010), with fuzzified inputs.  

#### New habitat feature in HABFUZZ 2.3.3
The user can now add expert-judgment-based rules. Using the ExpertRules.xlsx file available in the 'extras' subfolder, the user can define the habitat suitability of each rule (combination of flow velocity, water depth and substrate type -temperature not included in this version-), save the file as traindata.txt and replace the old traindata.txt with the new one containing the expert-defined rules.
Simply add the habitat suitability values for each rule in the first spreadsheet, then navigate to the second spreadsheet and save as traindata.txt, replace the old traindata.txt in the 'habfuzz' folder with the new one and run HABFUZZ. Relevant guidance can be found in the ExpertRules.xlsx itself.

#### Dependencies

It is advised to install the GNU Fortran Compiler (download at https://gcc.gnu.org/wiki/GFortranBinaries) to quickly compile HABFUZZ through the relevant Windows and OS X files (however, experienced users may also use their preferred compilers).

For Mac users, Xcode (download at https://developer.apple.com/xcode/) with its relevant Command Line Tools should be installed to enable compiling through the GNU Fortran Compiler.

#### Installing
HABFUZZ has been tested on Windows 10 - 32 bit and 64 bit operating systems, Ubuntu 16.04 and OS X 10.11 El Capitan (with Xcode 7.3.1 and Xcode 7.3.1. Command Line Tools), using the GNU Fortran Compiler. Depending on your operating system, follow the relevant instructions to run HABFUZZ.

#### Windows users
If the user needs to modify the source code of HABFUZZ, re-compilation is necessary. Using the GNU Fortran Compiler, you can either run the wcompile.bat file, or open a command window, navigate to the ‘habfuzz’ subfolder and type the relevant commands:

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

Be careful to write exactly the abovementioned commands, arranging the source files in the order given above. Then you can run HABFUZZ by typing

###### ./habfuzz

#### Mac OS X users
You need to have Xcode installed together with the GNU Fortran Compiler and be a root user to enable compilation. Open the terminal and navigate to the ‘habfuzz’ subfolder. To compile, you can either run the mcompile.sh file (which automatically applies the compilation commands) by typing

###### ./mcompile.sh

or manually type the commands

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95

HaABFUZZ can then be executed from the command line by typing

###### ./habfuzz

#### Usage
Please consult the HABFUZZ manual.

#### Visualization
As HABFUZZ is a command-line tool, habitat modellers -and not only- can use the free Blue Kenue software available at https://www.nrc-cnrc.gc.ca/eng/solutions/advisory/blue_kenue_index.html for visualizing the output of HABFUZZ. As an example, HABFUZZ was used in this case study https://onlinelibrary.wiley.com/doi/full/10.1002/rra.3284. The habitat suitability was predicted using the fuzzy rule-based Bayesian algorithm of HABFUZZ, the results were visualized in Blue Kenue and the following image was produced:


![fig_4b](https://user-images.githubusercontent.com/21544603/53016930-7fa79900-3457-11e9-89e6-3c8c6252ec3e.png)

#### References
Brookes C.J., Kumar V. and Lane S.N. 2010. A comparison of Fuzzy, Bayesian and Weighted Average formulations of an in-stream habitat suitability model. Proceedings of the International Congress on Environmental Modelling and Software, 5-8 Jul 2010, Ottawa, Canada.

Mamdani E.H. and Assilian S. 1975. An experiment in linguistic synthesis with a fuzzy logic controller. International Journal of Man-Machine Studies 7: 1-13.

Ross T.J. 2010. Fuzzy logic with engineering applications. Third Edition, John Wiley and Sons, UK.

Zadeh L.A. 1965. Fuzzy sets. Information and Control 8: 338–353.

#### Contact Information

Hellenic Centre for Marine Research  
Institute of Marine Biological Resources and Inland Waters  
46.7 km Athens-Sounio Ave.  
19013  
Anavyssos  
Greece  
Tel. +30 22910 76335  
Fax. +30 22910 76419  
Email. ctheodor@hcmr.gr  
URL. http://www.hcmr.gr/en/  

National Technical University of Athens  
Department of Water Resources and Environmental Engineering  
5 Iroon Polytechniou Str.  
15780  
Athens  
Greece  
Tel. +30 210 7722809  
Fax. +30 210 7722814  
Email. stamou@central.ntua.gr  
URL. https://www.hydro.ntua.gr/?set_language=en  

#### Contributing
To report bugs, possible amendments or anything else you would like to discuss, please file a GitHub issue or contact Mr. Christos Theodoropoulos at ctheodor@hcmr.gr. Pull requests are highly welcomed.
