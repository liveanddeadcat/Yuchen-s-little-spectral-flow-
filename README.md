# Yuchen-s-little-spectral-flow
Anything Yuchen's spectral flow analysis workflows. Including template scripts of comparing spectral profiles, spectral unmixing, statistics around evaluation of unmixing, downstream analysis: data integraion, statistics, clustering, data visualisation etc.

## Little Spec

1. Compare and visualise the spectral profiles of your reference controls
2. OLS spectral unmixing with AF extraction
3. Other unmixing methods: Weighted LS, Ridge regression (developing)
4. Evaluate your unmixing model via statistical methods
5. Downstream analysis on unmixed data: data transformation, integration, clustering.

## Get started
You need to get a few things ready before you start using scripts in this repo:
1. R, Rstudio, install all the packages
2. A machine that has >8G RAM and a fair CPU
3. Have run your single-stained controls, full-stained sample, unstained sample and have the .fcs files
4. Go to an easy UI software (you can do gating in R but it is truly easier in flowjo, FCSExpress etc.), gate reference controls positive and negative populations, export as .fcs store all of these in a folder \ref controls. Name them accordingly, e.g. CD3_BV650_neg, CD3_BV650_pos
5. If you like, gate the unstained sample by the size gate, and export as .fcs, store it in \af
6. Start with the OLS unmixing script! Enjoy your time not having to book analysis PCs :P

## Compare the spectral profiles
The calculation of spectral profiles in this repo is from flowSpectrum and is based on max median intensity normalisation (peak-normalisation).

## Consultation
The author acknowledges help from Dr David Novo, Ryan Kmet, and the support from supervisors Dr Tom O'Neil, Dr Kirstie Bertram, and Prof Najla Nasr.

## Contact me
[Email me](mailto:yuchen.li@sydney.edu.au)
