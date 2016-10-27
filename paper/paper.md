---
title: 'Habfuzz: A tool to calculate the instream hydraulic habitat suitability using fuzzy logic and fuzzy Bayesian inference'
tags:
  - Fortran
  - habitat
  - suitability
  - fuzzy
  - Bayesian
authors:
 - name: Christos Theodoropoulos
   orcid: 0000-0002-5395-0347
   affiliation: 1, 2
 - name: Nikolaos Skoulikidis
   affiliation: 1
   orcid: 0000-0002-3527-4883
 - name: Anastasios Stamou
   orcid: 0000-0002-8650-4175
   affiliation: 2
affiliations:
 - name: Hellenic Centre for Marine Research
   index: 1
 - name: National Technical University of Athens
   index: 2
date: 21 September 2016
bibliography: paper.bib
---

# Summary
Habfuzz is a Fortran tool [@Fortran], which implements the Mamdani - Assilian fuzzy inference process [@fis] and the Bayesian joint probability inference method as described in @bayes, but with fuzzified inputs in order to calculate the instream habitat suitability, given the flow velocity, the water depth and the substrate type of a hydraulically simulated river reach. While it is specifically structured to quickly calculate the fuzzy-logic- (or fuzzy-Bayesian)-based instream habitat suitability for fish or freshwater macroinvertebrates, it can be applied to wider research topics requiring fuzzy logic to be addressed.

The main Habfuzz routine reads three files containing the flow velocities (V), the water depths (D) and the substrate types (S), as derived from a hydrodynamic/hydraulic simulation of the river reach (each node of the computational grid being an array element) and three additional user-defined parameters (the inference process to be implemented, the management scenario and the defuzzification method) and calls the relevant subroutines to implement the selected inference process. The output of Habfuzz is a .txt file containing an array with the habitat suitabilities for each node of the initial computational grid of the hydrodynamic simulation and a .txt log file containing the internal parameters of the inference process.

As described in detail by @fuzzy and implemented in Habfuzz [@chtheodoro], the process of deriving the fuzzy-based habitat suitability includes three steps:  

1.	Fuzzification of V and D using trapezoidal membership functions  
2.	Application of a fuzzy operator (IF-THEN rules according to a given reference dataset)  
3.	Defuzzification - four defuzzification methods are supported to derive the output habitat suitability (a) centroid, (b) weighted average, (c) maximum membership and (d) mean-max membership.

while the fuzzy Bayesian process includes (i) fuzzification of V and D, (ii) application of the joint probability rules and (iii) classification of the habitat suitability according to a modified 'expected utility' function.  

![figure_2](https://cloud.githubusercontent.com/assets/21544603/18706143/7f3e39fc-7ff9-11e6-8712-aaea188f8bc6.png)

# References
