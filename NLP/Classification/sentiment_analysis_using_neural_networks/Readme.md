# Sentiment Analysis of Financial News Headlines Using Neural Networks

## Overview
This project demonstrates sentiment analysis of financial news headlines using **neural networks**. It covers multiple architectures including:

- Feedforward Neural Networks (FFN) with pre-trained Word2Vec embeddings  
- FFN with fine-tuned embeddings  
- Recurrent Neural Networks (RNN) with FFN classification head  
- Complex bidirectional RNN architectures  

The objective is to classify short financial news sentences into **negative, neutral, and positive** sentiment categories using dense word embeddings.

---

## Dataset
- **File**: `data.csv`  
- **Records**: 5482 news headlines  
- **Columns**:
  - `Sentence`: News headline text
  - `Sentiment`: Label (`negative`, `neutral`, `positive`) mapped to `0, 1, 2`  

**Source**: [Kaggle Financial Sentiment Analysis](https://www.kaggle.com/datasets/sbhatti/financial-sentiment-analysis)  
**Citation**: Malo, Pekka, et al. "Good debt or bad debt: Detecting semantic orientations in economic texts." Journal of the Association for Information Science and Technology 65.4 (2014): 782-796.

---

## Workflow

### Step 1: Pre-processing
1. **Handling Numerical Values**  
   Convert numbers (including decimals) to digits `[1-9]` to match Word2Vec embeddings.
   
   Example: "The company raised $5.6 M" → "The company raised $2 M"

2. **Handling Financial Units**  
Convert monetary abbreviations `[k, m, b, t]` to `[thousand, million, billion, trillion]`  
Rearrange currency symbols to the end: "USD7m" → "7 million USD"


3. Remove special characters  
4. Remove extra spaces  
**Note**: Do not perform lemmatization, stemming, lower-casing, or stop-word removal.

---

### Step 2: Creating the Embedding Matrix
1. **Vocabulary Creation**
- Build a vocabulary from the dataset
- Remove words not present in Word2Vec
- Include a **sentence separator token (`</s>`) as the first token**

2. **Embedding Matrix**
- Map each vocabulary word to its Word2Vec embedding
- Shape: `(vocab_size, embedding_dim)`

3. **Sentence Vectorization**
- Convert each sentence into a sequence of embedding indices
- Zero-pad sequences to `max_length = max_sentence_length + 2`
- Convert labels to **one-hot vectors** for multiclass classification

---

### Step 3: Neural Network Models

#### 1. FFN Classifier (Frozen Embeddings)
- Feedforward neural network with at least two hidden layers  
- Embedding layer initialized with pre-trained Word2Vec embeddings (`trainable=False`)  
- 80-20 train-test split (random state=42)  
- Early stopping, dropout, and learning rate adjustment used to avoid overfitting  
- Loss: `categorical_crossentropy`, Metric: `accuracy`  
- Report **precision, recall, F1-score** per class  

#### 2. FFN Classifier (Fine-tuned Embeddings)
- Same architecture as above but **embedding layer trainable**  
- Compare performance to frozen embedding model  

#### 3. RNN with FFN Classifier Head
- Stacked RNN layers (2–4) with FFN head  
- Best-performing architecture included in notebook/report  
- Model summary and performance metrics included  

#### 4. Complex Bidirectional RNN with FFN Classifier Head
- Stacked bidirectional SimpleRNN layers  
- Flexible classification head design  
- Report architecture, summary, and performance metrics  

---

### Step 4: Reporting
The report includes:
- Vocabulary creation process and total token count (including `</s>`)  
- Comparison of FFN models (frozen vs fine-tuned embeddings)  
- Comparison of RNN models and model complexity  
- Best-performing model and reasoning  
- Answers to assignment questions:
1. Importance of sentence separator token  
2. Case-sensitive vocabulary duplicates  
3. Word2Vec embedding similarity analysis  
4. Class imbalance discussion and handling  

---

## Tools & Libraries
- Python  
- Keras / TensorFlow  
- SpaCy (`en_core_web_sm`) for tokenization  
- Gensim (Word2Vec embeddings)  
- Scikit-learn (train-test split, metrics)  
- Pandas / NumPy for data manipulation  
- Matplotlib / Seaborn for plotting  

---

