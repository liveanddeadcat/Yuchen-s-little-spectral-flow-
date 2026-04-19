# Yuchen-s-little-spectral-flow
Anything Yuchen's spectral flow analysis workflows. Including template scripts of comparing spectral profiles, spectral unmixing, statistics around evaluation of unmixing, downstream analysis: data integraion, statistics, clustering, data visualisation etc.

## Little Spec
This repo is a complete workflow from reference control to unmixing and high-parameter analysis of flow data. I didn't really invent new method here, more like collected the tools into a toolkit from the beginning to the end. The handmade math content in this repo is no more than basic linear algebra and linear modeling techniques. Don't worry if that's causing mathphobia. As long as you get all elements ready and in the right formats, you can do these calculations following the instructions in the scripts!

1. Compare and visualise the spectral profiles of your reference controls
2. OLS spectral unmixing with AF extraction
3. Other unmixing methods: Weighted LS, Ridge regression (developing)
4. Evaluate your unmixing model via statistical methods
5. Visulisation of unmixed data
6. Downstream analysis on unmixed data: data transformation, integration, clustering.

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

## Unmixing
This repo successfully re-creates the unmixing results comparable to the unmixing in Spectroflo software, using linear algebra in R. And it lets you investigate your unmixing results freely. You can therefore pinpoint how you can adjust your experiments. WLS unmixing is also explored. And the users are highly encouraged to explore the ways to calculate weights, and other unmixing methods, if you are sure that you have optimised experimental conditions.

## Consultation
The author acknowledges help from Dr David Novo, Ryan Kmet, Dr Elijah Willie, and the support from supervisors Dr Tom O'Neil, Dr Kirstie Bertram, and Prof Najla Nasr.

## Contact me
[Email me](mailto:yuchen.li@sydney.edu.au)
