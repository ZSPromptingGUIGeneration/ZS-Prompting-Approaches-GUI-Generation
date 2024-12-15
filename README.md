# Zero-Shot Prompting Approaches for LLM-based Graphical User Interface Generation

The supplementary material of our paper "Zero-Shot Prompting Approaches for LLM-based Graphical User Interface Generation" is structured as follows:

- **datasets**: This directory contains dataset for binary relevance annotations, the criteria used to rate GUI descriptions, the generated GUI HTML/CSS files for all the different ZS prompting approaches, the LLM-generated GUI re-rankings on the gold standard with different temperature settings, the FP analysis of the LLM-based binary relevance filtering, the annotation results of the Rico GUI samples, our official split of validation and test GUI description data and the main evaluation dataset containing all model and GUI description combinations that we annotated in Prolific
- **evaluation**: This directory contains scripts used to compute the main evaluation results and statistical test. In addition, it also contains the box plots and test result data
- **notebooks**: This directory contains the jupyter notebooks containing *(1)* the code for sampling the Rico GUI dataset used to create the descriptions, *(2)* the code for creating the description test dataset, *(3)* the code to conduct the *SentenceBERT*-based top-20 retrieval on the test dataset, *(4)* the ZS prompting approaches for LLM-based GUI re-ranking and filtering, *(5)* the ZS prompting approaches for the baselines, PDGG and RAGG, *(6)* the ZS prompting approaches for the SCGG, *(7)* the ZS prompting approaches for GUI content generation, *(8)* the code for constructing the final evaluation dataset and *(9)* the code for the LLM-based GUI relevance filtering evaluation

<img src="" width="100%">
