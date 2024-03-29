![habfuzz_logo_rs2](https://user-images.githubusercontent.com/21544603/69030646-dc34e600-09e0-11ea-80a6-637262908b85.jpg)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2582117.svg)](https://doi.org/10.5281/zenodo.2582117)
[![status](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2/status.svg)](http://joss.theoj.org/papers/1ad27db8f0976c28a75e20d34eba5ee2)
![](http://www.repostatus.org/badges/latest/active.svg)
![](https://img.shields.io/badge/version-2.8.3-red.svg)
![](https://img.shields.io/badge/topic-Fuzzy_habitat_modelling-blue.svg) 

#### Update on v2.8.3
I was told that in some windows PCs habfuzz.exe returns an error code "0xc000007b". If this is your case, I have included a new executable "habfuzz-alt.exe", which will run on these machines. Still, if anything doesn't work, just email me at chtheodoro@yahoo.gr
  
Windows users: Locate habfuzz.exe at the habfuzz subfolder and run  
Mac users: Locate mcompile.sh at the habfuzz subfolder, click to compile, and run habfuzz  
Linux users: Compile the software following the below-mentioned instructions and run habfuzz

#### Wait, did you say command-line? So, there's no Graphical User Interface?
Yes, it's quicker this way. You just need to prepare a single input file with your data, run the program and get the results in a single output file! Check out the manual https://github.com/chtheodoro/habfuzz/blob/master/HABFUZZ_v2.5_manual.pdf.
We have made it even easier for you, a video tutorial is now available at https://www.youtube.com/watch?v=ZA_NADMyMsM.

#### HABFUZZ - A command-line tool for data-driven fuzzy modelling

![habfuzz_flow](https://user-images.githubusercontent.com/21544603/53111372-9e845900-3545-11e9-8028-6e1b32ee1c0a.png)

HABFUZZ predicts the value of any response variable, given a set of up to four predictors, using fuzzy logic and fuzzy rule-based Bayesian algorithms.

It has been initially structured to quickly calculate the habitat suitability for freshwater macroinvertebrates in a hydraulically simulated river reach, given the flow velocity, the water depth, the substrate and the water temperature. But since the 2.3 version we have upgraded it to be applied to any topic that requires the prediction of a response variable using fuzzy logic and up to four predictors.

The algorithms implemented in HABFUZZ are  
a. Τhe classic Mamdani - Assilian fuzzy inference process (Mamdani & Assilian, 1975) and  
b. The Bayesian joint probability inference process as described in Brookes et al. (2010), with fuzzified inputs.  

#### What's new since HABFUZZ 2.8
As per the 2.5 version, HABFUZZ 2.8 is completely stand-alone! No re-compilation is necessary and thus, no FORTRAN compiler is required.
All input files, (i) traindata.txt, (ii) testdata.txt and (iii) user-adjusted fuzzy sets can now be created from the STEERING file, located in the steering folder. Follow the instructions given in the HABFUZZ v2.5 manual (https://github.com/chtheodoro/habfuzz/blob/master/HABFUZZ_v2.5_manual.pdf).
HABFUZZ 2.8 offers two versions to choose: (i) the classic HABFUZZ with three fuzzy and one crisp input, (ii) the full fuzzy HABFUZZ with four fuzzy inputs (see the Readme_first file for details).

#### Dependencies

It is advised to install the GNU Fortran Compiler (download at https://gcc.gnu.org/wiki/GFortranBinaries) to quickly compile HABFUZZ through the relevant Windows and OS X files (however, experienced users may also use their preferred compilers).

For Mac users, Xcode (download at https://developer.apple.com/xcode/) with its relevant Command Line Tools should be installed to enable compiling through the GNU Fortran Compiler.

#### Installing
HABFUZZ has been tested on Windows 10 - 32 bit and 64 bit operating systems, Ubuntu 16.04 and OS X 10.11 El Capitan (with Xcode 7.3.1 and Xcode 7.3.1. Command Line Tools), using the GNU Fortran Compiler. Depending on your operating system, follow the relevant instructions to run HABFUZZ.

#### Windows users
Just download the software and run habfuzz.exe.  
If you need to modify the source code of HABFUZZ, re-compilation is necessary. Using the GNU Fortran Compiler, you can either run the wcompile.bat file, or open a command window, navigate to the ‘habfuzz’ subfolder and type the relevant commands:

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 reader.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95

###### del *.o
###### del *.mod

habfuzz.exe will then be replaced by the newly compiled one, being ready to run.

#### Linux users
Open the terminal and navigate to the ‘habfuzz’ subfolder. If you don’t have the GNU Fortran Compiler, you need to be a root user (administrator) and type

###### sudo apt-get install gfortran 

to install the compiler. Having gfortran installed, the commands necessary to compile are the following

###### gfortran -c fdeclarations.f95

###### gfortran habfuzz.f95 fdeclarations.f95 reader.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95 –o habfuzz

Be careful to write exactly the abovementioned commands, arranging the source files in the order given above. Then you can run HABFUZZ by typing

###### ./habfuzz

#### Mac OS X users
You need to have Xcode installed together with the GNU Fortran Compiler and be a root user to enable compilation. Open the terminal and navigate to the ‘habfuzz’ subfolder. To compile, you can either run the mcompile.sh file (which automatically applies the compilation commands) by typing

###### ./mcompile.sh

or manually type the commands

###### gfortran -c fdeclarations.f95

###### gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 reader.f95 classifier.f95 combinations.f95 ruler.f95 fuzzifier.f95 permutator.f95 rules2.f95 fuzzy.f95 fruler.f95 rules1.f95 centroid.f95 meanmax.f95 maxmem.f95 waver.f95 randomizer.f95 iterator.f95 iterator10.f95 tester.f95 ftester.f95 performance.f95 tencrossval.f95

HABFUZZ can then be executed from the command line by typing

###### ./habfuzz

#### Usage
Please consult the HABFUZZ manual at https://github.com/chtheodoro/habfuzz/blob/master/HABFUZZ_v2.5_manual.pdf

#### Visualization
As HABFUZZ is a command-line tool, habitat modellers -and not only- can use the free Blue Kenue software available at https://nrc.canada.ca/en/research-development/products-services/software-applications/blue-kenuetm-software-tool-hydraulic-modellers for visualizing the output of HABFUZZ. As an example, HABFUZZ was used in this case study https://onlinelibrary.wiley.com/doi/full/10.1002/rra.3284. The habitat suitability was calculated using the fuzzy rule-based Bayesian algorithm of HABFUZZ, the results were visualized in Blue Kenue and the following image was produced:

![fig_4](https://user-images.githubusercontent.com/21544603/53172876-1195da00-35ef-11e9-98f2-789019da2991.png)

#### What's next
Nothing... HABFUZZ is what it is, a tool that quickly implements a complex fuzzy rule-based algorithm. You need to study a bit in order to properly use it, but once you understand the advantages of this algorithm, you may appreciate the use of HABFUZZ.

#### References
Brookes C.J., Kumar V. and Lane S.N. 2010. A comparison of Fuzzy, Bayesian and Weighted Average formulations of an in-stream habitat suitability model. Proceedings of the International Congress on Environmental Modelling and Software, 5-8 Jul 2010, Ottawa, Canada.

Mamdani E.H. and Assilian S. 1975. An experiment in linguistic synthesis with a fuzzy logic controller. International Journal of Man-Machine Studies 7: 1-13.

Ross T.J. 2010. Fuzzy logic with engineering applications. Third Edition, John Wiley and Sons, UK.

Zadeh L.A. 1965. Fuzzy sets. Information and Control 8: 338–353.

#### Contact Information

Dr. Christos Theodoropoulos  
Biologist, PhD Ecohydraulics  

Email: chtheodoro@yahoo.gr  
YouTube: www.youtube.com/@thchristo  
Web: chtheodoro.wixsite.com/ctheodoropoulos  

#### Contributing
To report bugs, possible amendments or anything else you would like to discuss, please file a GitHub issue or contact Mr. Christos Theodoropoulos at chtheodoro@yahoo.gr. Pull requests are highly welcomed.

If you use HABFUZZ, please cite it as follows:  
Theodoropoulos C., Stamou A., Skoulikidis N., 2016. HABFUZZ: A tool to calculate the instream hydraulic habitat suitability using fuzzy logic and fuzzy Bayesian inference. Journal of Open Source Software 1(6), 82, DOI:10.21105/joss.00082
