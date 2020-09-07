This code is associated with the paper from Brand et al., "Reducing respiratory syncytial virus (RSV) hospitalization in a lower-income country by vaccinating mothers-to-be and their households". eLife, 2020. http://doi.org/10.7554/eLife.47003

# RSVHouseholdModel

Julia 0.6 code for running the RSV Household transmission model (see https://www.biorxiv.org/content/10.1101/569335v1.abstract for preprint).

The main files for inferring parameters, running simulations and running forecasts are:

* Fit_HHModel_EMalg.jl --- This contains the code used to define the simulation parameters, the log-likelihood with respect to hospitalisation data, and the EM algorithm method.
* Fit_HHModel_EMalg.jl --- This contains additional definitions for running the simulation with vaccination and uses multiple processes for averaging over future simulations.
* RSV_household_demo.jl --- This demonstrates the model running with parameters inferred from the EM algorithm (maximum likelihood estimates are saved in DATA folder), and compares to data.

The MATLAB® code used to generate the publication plots, and the outputed data behind these, are located in the Plots folder.
