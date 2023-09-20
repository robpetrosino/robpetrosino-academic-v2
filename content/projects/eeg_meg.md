+++
title = "EEG/MEG response comparability"
type = "projects"
tags = ["processing", "methods"]

lastmod = 2021-04-30

authors = ["robpetro", "jon"]

share = false
profile = false

[design]
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "1"
+++

Over the past few decades, a bulk of psycholinguistic evidence have shown that words decompose in morphemes when they are recognized (_morphological decomposition_). A series of magnetoencephalographic (MEG) studies have recently suggested that the brain response to morphological properties originates from a region of the inferior temporal cortex known as `Visual Word Fom Area' (VWFA; Cohen et al. 2000, Cohen et al. 2002) and peaks at about 150 ms post stimulus onset (the M170 component). This area of the brain has been shown to be sensitive to the morpho-orthographic statistical regularities at play during the early stages of the processing of non-affixed (heteronyms: e.g.,  _wind_; Solomyak \& Marantz 2009), affixed (e.g., bi-morphemic words involving free and bound stems: e.g. _taxable, tolerable_; Solomyak \& Marantz 2010), and pseudo-affixed (e.g., _brother_; Lewis et al. 2011) words, but not to semantic properties, which seem to be indexed by a response in the superior temporal and Silvyan Fissure region peaking at about 350 ms (the M350 component; Pylkännen \& Marantz 2003). These studies have developed a novel approach to MEG data analysis, which is based on the correlational data analysis approach pioneered by Hauk et al. (2006) for ERP sensor-space data analysis. While traditional data analysis pipelines group together stimuli sharing some properties in different conditions and compare them to one another, this new approach correlates a given variable (e.g., orthographic transitional probability) of _each stimulus_ with the brain response arising at a given time window. This kind of technique is particularly beneficial for investigations on morphological phenomena, which often consists of a small number of stimuli, which would be impossible to control for all the necessary variables. Unfortunately, not many morphologists that do not have access to highly expensive MEG machines, as there are, indeed, only a few available worldwide.

This project explores the possibility of applying the MEG correlational technique just mentioned to high-density EEG data as a way to provide a reliable and a cost-effective methodology for morphologists interested in conducting electrophysiological research. So far, we have collected high-density EEG data for an identical replication of Lewis et al. (2011). In this study, the M170 response to both transparent (e.g., _driver_) and opaque (e.g., _brother_) words is shown to correlate with the morpho-orthographic transitional probability between pseudo-stem (_broth_) and pseudo-affix (_er_), which supports the morpho-orthographic nature of early visual decomposition. We are now in the process of defining the EEG-adapted pipeline and comparing the two sets of results to one another. The hope is to obtain an agreed-on pipeline for correlational data analysis, which may guarantee comparability across types of signal (i.e., MEG vs. EEG) and boost electrophysiological research in morphology.
