---
title: 'Habfuzz: a Fortran tool to calculate the instream hydraulic habitat suitability based on fuzzy logic'
tags:
  - Fortran
  - habitat
  - suitability
  - fuzzy
authors:
 - name: Christos Theodoropoulos
   orcid: 0000-0002-5395-0347
   affiliation 1: Hellenic Centre for Marine Research
   affiliation 2: National Technical University of Athens
 - name: Nikolaos Skoulikidis
   affiliation: Hellenic Centre for Marine Research
 - name: Anastasios Stamou
   affiliation: National Technical University of Athens
date: 21 September 2016
bibliography: paper.bib
---

# Summary
Habfuzz is a Fortran stand-alone software, which implements the Mamdani - Assilian fuzzy inference process (Mamdani and Assilian, 1975) to calculate the instream habitat suitability, given the flow velocity, the water depth and the substrate type of a hydraulically simulated river reach. While it is specifically structured to quickly calculate the fuzzy-logic-based instream habitat suitability for fish or freshwater macroinvertebrates, it can be applied to wider research topics requiring fuzzy logic to be addressed.

The main Habfuzz routine reads in three files containing the flow velocities (V), water depths (D) and substrate types (S), as derived from a hydrodynamic/hydraulic simulation of the river reach (each node of the computational grid being an array element) and two additional user-defined parameters (the management scenario and the defuzzification method) and calls the relevant subroutines to implement the fuzzy inference process. The output of Habfuzz is a single file containing an array with the habitat suitabilities for each node of the initial computational grid of the hydrodynamic simulation.

As described in detail by Ross (2010) and implemented in Habfuzz, the process of deriving the fuzzy-based habitat suitability includes three steps:  

1.	Fuzzification of V and D using trapezoidal membership functions  
2.	Application of a fuzzy operator (IF-THEN rules according to a given reference dataset)  
3.	Defuzzification - four defuzzification methods are supported to derive the output habitat suitability (a) centroid, (b) weighted average, (c) maximum membership and (d) mean-max membership.

![figure_2](https://cloud.githubusercontent.com/assets/21544603/18706143/7f3e39fc-7ff9-11e6-8712-aaea188f8bc6.png)

# References
