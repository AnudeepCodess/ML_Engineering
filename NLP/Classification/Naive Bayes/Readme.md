# Sentiment Analysis on Movie Reviews Using Naïve Bayes

## Overview
This project demonstrates a probabilistic text classification workflow using the **Naïve Bayes classifier** on short movie reviews. The goal is to categorize reviews as **positive** or **negative** and evaluate the model’s performance under different preprocessing scenarios.

The pipeline includes:
- Data cleaning and preprocessing
- Feature extraction using word probabilities
- Training a Naïve Bayes classifier
- Evaluating the model using Precision, Recall, and F1-Score
- Comparing four preprocessing scenarios to assess impact on model performance

---

## Dataset
- **Source**: Movie Reviews dataset from Kaggle  
  [Movie Reviews NLP Dataset](https://www.kaggle.com/datasets/kingabzpro/movie-reviews-nlp)
- **Format**: Tab-separated file (`moviereviews.tsv`)  
- **Contents**: 2000 short movie reviews with labels  
  - `label`: 0 (negative), 1 (positive)  
  - `review`: text of the review
- **Preprocessing**: Removed null or missing reviews

---

## Workflow

### 1. Data Preprocessing
A `preprocess_text` function was implemented with options for:
- **Lemmatization** (`lemmatize_words`)
- **Stop word removal** (`remove_stop_words`)
- **Logical negation handling** (`handle_logical_negation`)

Four preprocessing scenarios were evaluated:

1. No lemmatization, no stop word removal, no negation handling  
2. With lemmatization only  
3. With lemmatization and stop word removal  
4. With lemmatization, stop word removal, and negation handling

Regular expressions were used to remove punctuation, symbols, and extra spaces.

---

### 2. Train-Test Split
- **Training set**: 80% of the reviews  
- **Testing set**: 20% of the reviews  
- Random state fixed for reproducibility

---

### 3. Naïve Bayes Classification
For each scenario:
- Calculated **prior probabilities** for each class
- Calculated **likelihood values** for each word given a class
- Computed **posterior probabilities** using logarithms to avoid underflow
- Applied **Laplace smoothing** to handle zero-frequency words
- Removed unknown words during testing

---

### 4. Evaluation
- Generated **confusion matrix** for predictions
- Computed **Precision, Recall, and F1-Score** for each class
- Compared overall accuracy across the four preprocessing scenarios

---

---

## Tools & Libraries
- Python
- Pandas / NumPy
- Scikit-learn
- Jupyter Notebook
- Regex for preprocessing
- Optional: SpaCy for lemmatization and negation handling

---


