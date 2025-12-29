# Named Entity Recognition on Twitter Data

## Overview
This project demonstrates an end-to-end Named Entity Recognition (NER) workflow on social media text. The goal is to evaluate the performance of spaCy’s pre-trained NER pipeline by comparing its predictions against manually annotated entities.

The pipeline includes manual labeling, automated entity extraction, and quantitative evaluation using standard NLP metrics.

---

## Dataset
- Cleaned Twitter text data (Excel format)
- A subset of 300 tweets was used for analysis
- Tweets contain informal language commonly seen on social media

---

## Entity Types
The following named entity categories were analyzed:
- PERSON
- NORP
- ORG
- GPE
- LOC
- DATE
- MONEY

---

## Workflow

### 1. Manual Annotation
Tweets were manually annotated using an online NER annotation tool.  
Entities were labeled at the character level and exported in spaCy-compatible JSON format.  
The annotated data serves as ground truth for evaluation.

---

### 2. Automated NER
spaCy’s built-in NER pipeline was applied to the same tweets.  
Only the specified entity types were extracted and stored for comparison.

---

### 3. Evaluation
Predicted entities were compared against manually annotated entities.

For each entity type, the following metrics were computed:
- Precision
- Recall
- F1 Score

Evaluation was performed at the entity occurrence level across the full dataset.

---

## Tools & Libraries
- Python
- spaCy
- Pandas
- NumPy
- Jupyter Notebook

---



