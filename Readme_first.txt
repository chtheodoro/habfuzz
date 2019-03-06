Before running HABFUZZ, note that it has pre-defined fuzzy sets
for both the predictor and response variables.

To run the software for your data, you may need to appropriately
modify each fuzzy set.

For example, the response variable is set to a 0-1 range and its relevant
parameters are set in the fdeclarations.f95 file as
ka=0.2, kb=0.4, kc=0.6, kd=0.8 to define five classes and
eua=0.1, eub=0.3, euc=0.5, eud=0.7, eue=0.9
for the expected utility function of the fuzzy rule-based Bayesian algorithm.

If your response variable ranges from 0 to 1000 for example,
the easiest way would be to normalize it by dividing with the maximum value observed and run HABFUZZ or,
you could change the relevant parameters, that is,
ka=200, kb=400, kc=600, kd=800
eua=100, eub=300, euc=500, eud=700, eue=900,
recompile and run.

Note that for response variables outside the 0-1 range, only the fuzzy
rule-based Bayesian algorithm is currently working.
  
