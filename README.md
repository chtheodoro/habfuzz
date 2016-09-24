# Habfuzz
Habfuzz is a Fortran 95 code, which implements the Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975). It is specifically structured to quickly calculate the fuzzy-logic-based instream habitat suitability for fish or freshwater macroinvertebrates along a 2D hydraulically simulated river reach. However, if appropriately modified, it can be applied to wider research topics requiring fuzzy logic to be addressed.  

### Why Habfuzz?
Instead of Habfuzz, you can use the nonfree MATLAB Fuzzy Logic Toolbox (http://www.mathworks.com/products/fuzzy-logic/) or the free CASiMiR 2D software upon request (http://www.casimir-software.de/ENG/habitate_eng.html). However, Habfuzz has been designed to be a one-click tool, for those researchers with no or very minor programming knowledge, in need of an easy-to-use software to calculate the habitat suitability along a hydrodynamically simulated river reach, based on fuzzy logic. For those researchers who can't afford to purchase MATLAB (because it does everything, but they only need a small amount of its capabilities). And for those self-studying researchers who need a very comprehensive, step-by-step, yet short-legthed tutorial to enable them quickly run a tool for a specific part of their project. 

### 1. Overview of the fuzzy inference process

As initially proposed by Zadeh (1965) and described in detail by Ross (2010), the process of deriving the fuzzy-based habitat suitability, given the flow velocity, water depth and substrate type, can be summarized in four steps:

a. Fuzzification of the input variables
  
In this step, the user defines categories (membership functions) for each input variable and the input values of flow velocity, water depth and substrate type are assigned to one or more membership functions. By this procedure, crisp numerical values of each input variable are converted to a fuzzy ‘degree of membership’, ranging from 0 to 1 for each membership function. For example, a depth value of 14 cm may derive a membership degree of 0.7 for the ‘shallow’ membership function and 0.28 for the ‘very shallow’ membership function.

b. Application of a fuzzy operator (AND or OR) in the antecedent (IF-THEN rules)
  
According to the reference data for the target aquatic community, the AND (min) or OR (max) operator is applied to each combination of variables (membership functions since step 1) and the derived value is assigned to the membership function of the output variable (defined in step 1), in this case the habitat suitability. For example, if the user defines five membership functions for habitat suitability (bad, poor, moderate, good, high), then the application of the fuzzy operator would result in,

![1](https://cloud.githubusercontent.com/assets/21544603/18666875/c7f1fcce-7f36-11e6-8da5-9a8c657c6eea.png)

where,
fi denotes for the membership function of each input and output variable  
V is the flow velocity  
D is the water depth  
hs is the habitat suitability  
etc., until all possible combinations of fuzzy inputs are assigned to an output membership function, based on the rationale that, for example,  
IF flow velocity is f3 (moderate) AND water depth is f2 (shallow) THEN habitat suitability is f4 (good).

c. Aggregation of outputs

In this step, the derived habitat suitability membership functions from each rule are combined into one fuzzy set. Usually, the OR (max) operator is applied to aggregate the same output fuzzy sets of the previous step. For example, the f4 (hs) is derived in the previous example two times by the IF-THEN rules. The final fuzzy set representing each habitat suitability class Fj would be

![2](https://cloud.githubusercontent.com/assets/21544603/18667370/f0c043fc-7f38-11e6-9f21-ffd84db5a963.png)

d. Defuzzification

This final step is applied to derive one single habitat suitability value, by combining the membership degrees of all fuzzy habitat suitability classes. Among the various defuzzification methods, the ‘centroid’, ‘maximum membership’, ‘weighted average’ and ‘mean-max membership methods’ are described below.


i. Centroid defuzzification:

Usually called the ‘center of gravity’ or ‘center of area’. It can be defined by the algebraic expression

![3](https://cloud.githubusercontent.com/assets/21544603/18667467/5b1d364c-7f39-11e6-9a3f-d54895c8bfe9.png)

which can be numerically approximated by

![4](https://cloud.githubusercontent.com/assets/21544603/18667566/cf67178e-7f39-11e6-87ab-d050e6e49c13.png)

where,  
f(xi) is the membership degree at value xi  

ii. Maximum membership defuzzification - This is the maximum membership degree observed by the aggregation step:

![5](https://cloud.githubusercontent.com/assets/21544603/18667664/30fee6e8-7f3a-11e6-8f7f-43ee3928802c.png)

iii. Weighted average - This method can be used only for symmetrical output membership functions and is calculated by weighting each output membership function by its largest membership degree:

![6](https://cloud.githubusercontent.com/assets/21544603/18667732/7ffba75e-7f3a-11e6-9d3d-566e7cf69b7a.png)

where,
f(xi) is the membership degree at the average value xi of each membership function 

iv. Mean of maximum - This method resembles the ‘maximum membership’ method. However, the maximum membership degree may not be unique but a range of degrees, from which the mean value is derived: 

![7](https://cloud.githubusercontent.com/assets/21544603/18667853/e8ce89a4-7f3a-11e6-8af5-dca47e97c25e.png)

where,  
xa is the first value reaching the highest membership degree of the class with the highest membership and  
xb is the last value with the highest membership degree of the class with the highest membership  
  
![figure_2](https://cloud.githubusercontent.com/assets/21544603/18706143/7f3e39fc-7ff9-11e6-8712-aaea188f8bc6.png)

### 2. Dependencies
  
All the necessary files to run Habfuzz are included in the program’s folder. However, to modify the code, users will need to have a Fortran text editor and a Fortran compiler installed.  
Habfuzz was developed using:  
•	the Geany text editor (download at www.geany.org)  
•	the GFortran compiler (download at https://gcc.gnu.org/wiki/GFortranBinaries)  
Therefore, it is advised to install the specific additional software to ensure that Habfuzz is working properly.

### 3. Installing
No specific installation of the software is required. Just copy the habfuzz folder to your hard disk and double-click habfuzz.exe to run the program. The habfuzz folder includes:  

1. The ‘habfuzz’ subfolder, which contains all the code files of Habfuzz, which are
a. The fdeclarations.f95 module containing the number of input arrays and all the variables and parameters necessary to run the program.
b. The fuzzifier.f95 subroutine containing the code to apply the fuzzification process (see the ‘usage’ section)
c. The smod.f95, swors.f95 and sopt.f95 subroutines containing the IF-THEN rules according to the management scenario to be implemented (see the ‘usage’ section)
d. The centroid.f95, meanmax.f95, waver.f95 and maxmem.f95 subroutines containing the code to apply the ‘centroid’, ‘mean-max membership’, ‘weighted average’ and ‘maximum membership’ defuzzification processes.

2. The ‘bin’ subfolder, which includes three necessary .dll files to run the software
If the user needs to change the code in one of these files, compilation is necessary prior to running the program. With the gfortran compiler installed, the user can either type the necessary commands


      gfortran -c fdeclarations.f95  
      gfortran -c habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95  
      gfortran -o habfuzz habfuzz.f95 fdeclarations.f95 fuzzifier.f95 smod.f95 swors.f95 sopt.f95 centroid.f95 maxmem.f95 waver.f95 meanmax.f95  

or just run the compile.bat file (included in the ‘habfuzz’ subfolder) to compile (in this case, don’t change the names of files!!!). The compiler will then create the new habfuzz.exe and some .o files, which can be discarded by the user.

### 4. Usage

4.1. Input and output data 

To run Habfuzz, three different .txt files are required as input, containing the flow velocity values in m/s, the depths in m and substrate types, according to the Manning’s n as depicted in the table. These files should be located in the ‘habfuzz’ subfolder and named velocities.txt, depths.txt and substrates.txt accordingly. Normally, such files (after proper manipulation) are the outputs of a hydrodynamic (hydraulic) simulation, where a specific river reach is numerically simulated through a computational grid. The simulation assigns a value for flow velocity, depth and substrate type at each node of the grid. However, the user can still create his/her own files to use in Habfuzz. All values at each file should be arranged in a single column, where the first row denotes the number of elements in the row and the rest of the values being the actual data. An example of the three input files containing 10 values (nodes) is shown below.

![fig2](https://cloud.githubusercontent.com/assets/21544603/18668374/b04f156e-7f3d-11e6-81b6-17751808d9b7.png)

![8](https://cloud.githubusercontent.com/assets/21544603/18668406/e04a97e8-7f3d-11e6-9a19-bae1072c71f4.png)

The output of Habfuzz is a .txt file named suitability.exe containing a single column with all the habitat suitabilities (ranging from 0 - unsuitable to 1 - suitable) calculated for each input element (node) in the same order as with the input files. This file is placed by the program in the ‘habfuzz’ subfolder.  
The habitat suitability is initially a combination of fuzzy membership functions (five classes of suitability - bad, poor, moderate, good and high) and through the defuzzification process it is converted into a crisp output ranging from 0 to 1.

4.2. Running Habfuzz  

After having the input files ready, double click habfuzz.exe. The command prompt opens and the software asks for the management scenario to be implemented.

![8](https://cloud.githubusercontent.com/assets/21544603/18668688/734f3bec-7f3f-11e6-8796-ab9088083e53.png)

There are three available scenarios based on the method used for deriving the outcome of each IF-THEN rule from the reference conditions of the program, (i) the moderate scenario, where the different suitability values for the same combinations of flow velocity, water depth and substrate type are averaged to derive the final suitability, (ii) the worst scenario, where the final suitability is derived from the minimum observed suitability and (iii) the optimum scenario where the final suitability is derived by the maximum observed suitability. A default scenario is also present (the moderate scenario). Note that if a specific combination in the observed data does not match a combination in the reference data, the program returns a value of ‘-1’ for the habitat suitability.    

After selecting the desired scenario, the user is asked to select the defuzzification method (see section 1). A default method (centroid) is also available. After selecting the defuzzification method, Habfuzz calls the relevant Fortran subroutines to perform the tasks selected. The program informs the user when the process is completed and indicates the suitability.txt file created where the suitability values are stored. The file is located in the ‘habfuzz’ subfolder.

![9](https://cloud.githubusercontent.com/assets/21544603/18738401/027f675a-80a4-11e6-8608-10ebeca67071.png)

4.3. Modifying the code according to the user preferences  

While the software is developed to quickly apply the fuzzy inference process for the calculation of the habitat suitability, the user can change the code according to his/her requirements in order to apply the fuzzy inference process for other topics requiring the implementation of fuzzy logic. Possible changes can be applied at specific Habfuzz processes mentioned below:

a. INPUT ARRAY SIZE - The current limit of input array size (the number of rows at each file and therefore the number of nodes in the computational grid) is set at 3000. However, the user can change this value by changing accordingly the ‘rsize’ parameter in the fdeclarations.f95 file.

a. FUZZIFICATION - The fuzzification process of Habfuzz is included in the subroutine fuzzifier.f95. It converts the crisp inputs of flow velocity and water depth to fuzzy sets (membership functions). The program creates five trapezoidal-shaped flow velocity functions (five classes of flow velocity), (a) very low, (b) low, (c) moderate, (d) high and (e) very high and five classes of water depth (a) very shallow, (b) shallow, (c) moderate, (d) deep and (e) very deep. The substrate type is treated as a crisp input throughout the process since the types of substrate are well defined and there is no need to be fuzzified. The user can either change the values at each membership function included in the fdeclarations.f95 file (marked as A. PARAMETERS OF THE FUZZIFICATION PROCESS), which results in changing the trapezoidal vertices of each membership function or change the whole membership function.

![fig5](https://cloud.githubusercontent.com/assets/21544603/18668781/325aad78-7f40-11e6-90c8-acf60eaac17b.png)

c. IF-THEN RULES - The user can also apply modifications to the IF-THEN rules of the smod.f95, swors.f95 and sopt.f95 subroutines. As already mentioned, the reference conditions are currently derived using freshwater macroinvertebrates, sampled in an extended sampling campaign, which took place at 9 sampling sites in Greece and resulted in a set of 380 reference microhabitats (combinations of flow velocity, water depth and substrate type). If the user needs to apply his/her own reference data (probably for fish or other biotic elements of the aquatic ecosystem or even in a totally different application), changes should be applied to one of the abovementioned subroutines. However, if for example, the smod.f95 file is modified, the user should also change the column number of the arrays, which are used by smod.f95 (in B. INTERNAL PARAMETERS TO FACILITATE THE IMPLICATION AND AGGREGATION STEPS, marked as ‘Used by smod.f95’), which are the arrays g, h, m, p, b. The modification should be such that the column number is the same as the times that a combination in the smod.f95 file results to a specific result. If you see for example, ‘g’ is the outcome of 26 combinations and so the column number for ‘g’ in the fdeclarations.f95 file is also 26.

![fig6](https://cloud.githubusercontent.com/assets/21544603/18668804/550c5916-7f40-11e6-8050-1ebe2afd0497.png)

It is not advised to make any changes in the ‘defuzzification’ subroutines as they do not depend on the array size of other files and they don’t require any changes to work properly even if the abovementioned modifications are applied. Still, an experienced Fortran user can modify the defuzzification subroutines according to his/her needs. After each modification in the files of Habfuzz, re-compilation is necessary as described in section 3.

### 5. References

Mamdani E.H. and Assilian S. 1975. An experiment in linguistic synthesis with a fuzzy logic
Controller. International Journal of Man-Machine Studies 7: 1-13.

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

##### To report bugs, possible amendments or anything else you would like to discuss, please contact Mr. Christos Theodoropoulos at ctheodor@hcmr.gr

