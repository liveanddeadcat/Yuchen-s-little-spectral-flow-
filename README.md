# Yuchen-s-little-spectral-flow
Anything Yuchen's spectral flow analysis workflows. Including template scripts of comparing spectral profiles, spectral unmixing, statistics around evaluation of unmixing, downstream analysis: data integraion, statistics, clustering, data visualisation etc.

## A bit about me
I'm a PhD student in Immunology and HIV infection. I jump between long wet lab hours and long computer hours...

## Little Spec
This repo is a workflow made by a wet-lab scientist for wet-lab scientists. From reference control to unmixing and high-parameter analysis of flow data. Other than the ridge regression unmixing, I didn't really invent new method here, more like collected the tools into a toolkit from the beginning to the end of flow analysis. The handmade math content in this repo is no more than basic linear algebra and regression techniques. 

Don't worry if that's causing mathphobia. As long as you get all elements ready and in the right formats, you can do these calculations following the instructions in the scripts!

1. Compare and visualise the spectral profiles of your reference controls
2. OLS spectral unmixing with AF extraction
3. Other unmixing methods: Weighted LS, NNLS, Ridge regression
4. Evaluate your unmixing model via statistical methods
5. Visulisation of unmixed data
6. Downstream analysis on unmixed data: data transformation, feature discovery, integration, clustering.

## Get started
You need to get a few things ready before you start using scripts in this repo:
1. R, Rstudio, install all the packages
2. A machine that has >4G RAM and a fair CPU. Preferred if you configure your R (v>=4.5.2), Rstudio, VScode, and python(3.6 <= version <3.8) so that they can use more GPU resources.
3. Have run your single-stained controls, full-stained sample, unstained sample and have the .fcs files
4. Go to an easy UI (flowjo, FCSExpress if you have license. I found CytoExploreR useful for gating in R and displaying spectral cytometry data), gate reference controls positive and negative populations, export as .fcs. Store them in a folder \ref controls. Name them accordingly, e.g. CD3_BV650_neg, CD3_BV650_pos
5. If you like, gate the unstained sample by the size gate, and export as .fcs, store it in \af. You can explore using multiple AFs too. Just add more AF parameters in your model.
6. Start with the OLS unmixing script! Enjoy your time not having to book analysis PCs :P

## Compare the spectral profiles
The calculation of spectral profiles in this repo is from flowSpectrum and is based on max median intensity normalisation (peak-normalisation).

## Unmixing
This repo successfully re-creates the OLS unmixing results comparable to the unmixing in Spectroflo software, using linear algebra in R. And it lets you investigate your unmixing results freely. You can therefore pinpoint how you can adjust your experiments. Other unmixing methods are also explored. I found that the Ridge regression model works the best for my own data so far. Feel free to try and see.

## Consultation
The author acknowledges help from Dr David Novo, Ryan Kmet, Dr Elijah Willie, Edwin Lau, Suat Dervish, and the support from supervisors Dr Tom O'Neil, Dr Kirstie Bertram, and Prof Najla Nasr.

## Contact me
[Email me](mailto:yuchen.li@sydney.edu.au)
