# Word2Vec Analogies and Vector Visualization

## Project Overview

This project explores word embeddings using pre-trained Word2Vec models. The goal is to understand how word vectors capture semantic relationships and solve word analogies. The project uses t-SNE visualization to display word vectors in 2D space, revealing semantic patterns and relationships.

## Dataset & Models

- **Word2Vec Model**: `word2vec-google-news-300` (gensim downloader)
  - Pre-trained on Google News corpus
  - 300-dimensional word vectors
  - 3 million tokens vocabulary
  - ~1.5GB download (cached after first run)

- **Vocabulary Reference**: `en_core_web_sm` (spaCy)
  - Used for randomly sampling clean vocabulary words
  - Avoids complex hyphenated tokens from Word2Vec

## Word Analogies

The project explores four semantic analogies to understand gender relationships and geographic patterns:

1. **Gender Relationship (Royalty)**
   - `king - man + woman ≈ ?`
   - Expected: queen

2. **Gender Relationship (Profession)**
   - `doctor - man + woman ≈ ?`
   - Expected: female medical professional

3. **Geographic Relationship (Countries to Capitals)**
   - `France - Italy + rome ≈ ?`
   - Tests country-capital relationships

4. **Geographic Relationship (States to Cities)**
   - `Florida - Texas + Austin ≈ ?`
   - Tests state-city relationships

## Methodology

### Word Analogy Calculation

The analogy formula: **A - B + C ≈ D**

Steps:
1. Get vector for word A: `vec_A`
2. Get vector for word B: `vec_B`
3. Get vector for word C: `vec_C`
4. Calculate: `result_vector = vec_A - vec_B + vec_C`
5. Find top 5 most similar words to `result_vector`

### Visualization Pipeline

For each analogy:

1. **Collect Words**
   - Original 3 words (A, B, C)
   - Top 5 most similar results (D candidates)
   - 20 randomly sampled words from spaCy vocabulary

2. **Remove Duplicates**
   - Check for duplicate words across all sets
   - Keep unique words only (may have < 28 words)

3. **t-SNE Visualization**
   - Reduce 300D vectors to 2D
   - Plot all words as scatter points
   - Draw lines connecting the 4 analogy words (A → B → C → top D)
   - Color-code: 
     - Analogy words in one color
     - Results in another color
     - Random words in a third color

## Installation

```bash
pip install gensim scikit-learn matplotlib spacy numpy pandas
python -m spacy download en_core_web_sm
```

## Implementation Details

### Key Functions

```python
# Download and load pre-trained Word2Vec model
download_word2vec_model()

# Solve word analogy
solve_analogy(word_a, word_b, word_c, top_n=5)

# Get random vocabulary words
sample_random_words(nlp, n=20)

# Remove duplicate words from list
remove_duplicates(words)

# Visualize analogy with t-SNE
plot_analogy_tsne(word_a, word_b, word_c, 
                  top_results, random_words,
                  title, model)
```

### Main Workflow

```python
1. Load Word2Vec model (first run downloads ~1.5GB)
2. Load spaCy vocabulary
3. For each of the 4 analogies:
   a. Solve analogy (get top 5 similar words)
   b. Sample 20 random words from spaCy
   c. Remove duplicates from combined set
   d. Create t-SNE visualization with lines connecting analogy words
   e. Display plot in notebook
```

## Results

The visualization reveals:
- How word vectors capture semantic meaning
- Gender bias in word embeddings (man/woman analogies)
- Geographic relationships in vector space
- Clustering of semantically similar words

## Expected Outputs

- 4 t-SNE plots (one for each analogy)
- Each plot contains:
  - Original 3 analogy words
  - Top 5 most similar word candidates
  - 20 random reference words
  - Lines connecting the 4-word analogy chain

## Key Insights

- **Semantic Relationships**: Word vectors preserve mathematical relationships between concepts
- **Vector Arithmetic**: `king - man + woman ≈ queen` demonstrates that embeddings capture abstract concepts
- **Bias in Embeddings**: Gender and other biases are encoded in pre-trained models
- **t-SNE Visualization**: Shows that semantically similar words cluster together in vector space

## Files

- `word2vec_analogies.ipynb` - Complete implementation and 4 visualizations
- `analogy_results.txt` - Top 5 similar words for each analogy

## Technical Notes

- **First Run**: Model download may take 5-10 minutes
- **Subsequent Runs**: Model loads from cache (seconds)
- **Memory**: Requires ~2GB RAM for Word2Vec model
- **Duplicates**: Handled automatically; final plots may have fewer than 28 words
- **t-SNE Seed**: Set random seed for reproducible visualizations

## Installation & Setup

```bash
# Install dependencies
pip install gensim scikit-learn matplotlib spacy numpy pandas

# Download spaCy model
python -m spacy download en_core_web_sm

# First notebook run will download Word2Vec model
# (Takes 5-10 minutes, then cached for future runs)
```