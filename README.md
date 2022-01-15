# Colorectal Cancer-Metagenomics
   - [x] **Whole Genome and Ampilicon Sequencing Study of Metagenomes of Colorectal Cancer Patients**
![Colorectal cancer](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41416-018-0264-x/MediaObjects/41416_2018_264_Fig1_HTML.png)

# Introduction
- Colorectal cancer is the fourth most common cancer in men and the third most common cancer in women worldwide,
and significant international variations in the distribution of colorectal cancer have been observed.
- Once thought to be associated with developed nations whose populations were more susceptible to risk factors
(smoking, obesity, physical inactivity, alcohol etc), an increasing number of cases is recently being reported 
in developing nations, where it is currently being understudied.
- Signs and symptoms include worsening constipation, blood in stool, weight loss, nausea and vommiting. 
- However, [around 50% of individuals with colorectal cancer do not report symptoms](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6133998/).
- This calls for a more thorough screening and detection procedure to complement current diagnostic procedures.
- Therapeutic interventions for colorectal cancer include [surgery, chemotherapy, immunotherapy, radiation 
therapy and palliative care](https://www.cancer.gov/types/colorectal/patient/colon-treatment-pdq#section/all).

# Study Background
- [x] Characterization of the 16sRNA microbiome in colorectal cancer states has the potential to aid in developing biomarkers
for effective screening and diagnosis, and has been explored by previoius studies. The challenge however, is [the lack of
standardization for protocols required](https://pubmed.ncbi.nlm.nih.gov/29755427/)
- [x] [Almost 50% patients going asymptomatic](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6133998/) means that detection of
CRC is mostly late, at which time it might have metastasised ([in fact, metastases is reported in almost 20% of CRC cases](https://pubmed.ncbi.nlm.nih.gov/24639430/)) and complicated into chronic forms hard to treat, and may explain why CRC remains a 
leading cause of cancer mortality and morbidity globally.
- [x] This study seeks to contribute to previous ones aimed at helping develop tools to aid in early screening and detection of CRC
by analyzing 16sRNA sequences of CRC gut microbiome.
- [x] Current treatment interventions(e.g. radiation therapy, chemotherapy and immunotherapy) are costly, and have been linked to a
number of side effects. The consensus regarding CRC treatment is to develop approaches to aid in early detection which will be 
associated with less risk, less cost and better diagnosis.

# Significance of the Study
- Without even showing symptoms, molecular markers have great precision and accuracy in detecting infections 
(including colorectal cancer) early stage, and can be relied on to aid in effective diagnosing of CRC even in patients who may 
appear not to have them.

# Aims and Objectives
- To characterize 16sRNA gene sequences of CRC microbiome and identify regions potentail of development for genomic markers for 
CRC screening

# Methodology
- Fecal samples of Colorectal Cancer Microbiome obtained from patients
- Marker gene sequencing (v6 hypervariable region of 16sRNA ampilicon sequencing)
- Taxonomic profiling with DADA2
- Diversity Analysis with alphadiversity
- Abundance and Functional Prediction with PICRUSt

### DADA2 Workflow
- [ ] Data Importing
- [ ] Quality Inspection
- [ ] Filtereing and Trimming
- [ ] Error Rate Estimation
- [ ] Dereplication
- [ ] Chimeras Removal
- [ ] Denoising and ASV Removal
- [ ] Taxonomic Classification

![DADA2 Workflow](https://slidetodoc.com/presentation_image_h/287504176fd61fbf9140bef6852f2963/image-24.jpg)

## PICRUSt Workflow
- [x] Predict 16s Copy Number abundance
- [x] Create the metagenome functional predictions 
- [x] Analyse predicted metagenomes

![Image of Picrust Workflow](https://raw.githubusercontent.com/wiki/picrust/picrust2/images/PICRUSt2_flowchart.png) 

## Team Members
- Soumaya Jbara
- Kasambula Arthur Shem
- Bright Opoku Asante
- Jandoubi Nouha
- Olaitan I. Awe



