# Document Similarity Estimation Using Embeddings

## Overview
This project demonstrates document similarity estimation using **sparse (TF-IDF)** and **dense (Word2Vec)** vector representations. The objective is to quantify how similar a set of query documents is to a collection of reference documents using vector embeddings and cosine similarity.

The workflow includes:
- Data cleaning and preprocessing
- TF-IDF vectorization and similarity calculation
- Word2Vec vectorization and similarity calculation
- Ranking documents based on similarity scores
- Comparing sparse vs dense embedding approaches

---

## Dataset
- **Source**: Provided CSV file `data.csv`
- **Contents**: 10 documents in the first column named `document`
- **Preprocessing**: Removed punctuation, symbols, and extra spaces; applied lemmatization as needed

**Query Documents for Similarity Analysis**:
1. Artificial intelligence is set to take over most jobs in near future.  
2. The use of artificial intelligence in healthcare industry is more and more every day.  
3. The use of AI in healthcare industry is more and more every day.  
4. The use of AI in medical care is more and more every day.

---

## Workflow

### 1. Data Preprocessing
- Cleaned each document using a preprocessing function
- Removed unwanted symbols, punctuation, and extra whitespace
- Ensured consistent formatting for TF-IDF and Word2Vec vectorization

---

### 2. TF-IDF Similarity
- Vectorized documents using **TF-IDF** (sparse vectors)  
- Calculated cosine similarity between query documents and reference documents  
- Produced a ranking of the top 5 most similar documents for each query

---

### 3. Word2Vec Similarity
- Used **Gensim Word2Vec** to create dense word embeddings  
- Configured model with:
  - `vector_size`: Dimensionality of embeddings  
  - `window`: Maximum distance between target word and context word  
  - `min_count`: Ignores words with total frequency lower than this  
  - `sg=1`: Skip-gram model  
  - `epochs`/`iter`: Number of training iterations
- Calculated document similarity by averaging word vectors for each document
- Ranked top 5 most similar documents for each query

---

### 4. Comparison
- Both TF-IDF and Word2Vec approaches provide a ranked similarity for each query  
- Differences highlight the benefits of **context-aware embeddings (Word2Vec)** vs **term frequency-based embeddings (TF-IDF)**

---

## Tools & Libraries
- Python
- Pandas / NumPy
- Scikit-learn (TF-IDF, cosine similarity)
- Gensim (Word2Vec)
- Jupyter Notebook
- Regex for preprocessing

---


