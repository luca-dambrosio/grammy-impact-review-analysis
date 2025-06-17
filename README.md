# 🏆 Sentiment Impact of Grammy Awards – A Causal Analysis of Music Reviews

This project investigates how winning a Grammy affects public sentiment, user ratings, and the number of reviews for music albums on RateYourMusic (RYM). By combining web scraping, sentiment analysis using a transformer model, and a Difference-in-Differences (DiD) causal inference framework, it aims to disentangle the media impact of high-profile music awards.

## 📁 Files

- `clean_rym_scraper.ipynb` – Web scraper built using Selenium to extract album reviews, ratings, and metadata from RYM  
- `url_generator.ipynb` – Generates review URLs using regex and Grammy nomination metadata  
- `data_prep_and_visualisation.ipynb` – Preprocesses scraped data and performs exploratory visualizations  
- `merge_data.ipynb` – Merges Grammy data and RYM reviews into a panel format for causal analysis  
- `SENTIMENT_ANALYSIS.ipynb` – Uses `siebert/sentiment-roberta-large-english` to classify reviews as POSITIVE or NEGATIVE  
- `wide_to_long.ipynb` – Converts data into long format for panel regression analysis  
- `DoFile_final.do` – Final Difference-in-Differences and weighted regression analysis in Stata
- `DoFile_final.do` - In-class presentation

Datasets can be requested upon request

## 📊 Summary

### 1. Research Question
> How does winning a Grammy influence the **sentiment**, **rating**, and **number of reviews** for an album?

### 2. Data Collection & Sentiment
- Scraped 25,777 reviews with metadata from RateYourMusic  
- Used a **RoBERTa-large sentiment classifier** to score reviews  
- Aggregated review scores before and after Grammy awards

### 3. Methodology: Causal Inference
- Constructed panel data with pre-/post-treatment periods  
- Applied **Difference-in-Differences (DiD)** estimation to compare changes in reviews for Grammy winners vs. non-winners  
- Controlled for genre popularity, nomination status, and review timing

### 4. Key Findings
- **Winning a Grammy increases the number of reviews significantly**  
- **Sentiment impact varies by genre**  
  → Popular genres saw a **negative shift** in sentiment  
  → Less-known genres saw a **positive sentiment boost**  
- No strong causal effect found on average rating  

## 🔧 Tools & Libraries
- Python (Selenium, pandas, regex, transformers, matplotlib)  
- HuggingFace `sentiment-roberta-large-english` model  
- Stata for regression and causal inference  
- Jupyter Notebooks for reproducibility

## 📌 Notes
- This project reflects real-world constraints in scraping, data cleaning, and causal inference  
- Sentiment models generalize reasonably but could be fine-tuned on music-specific text for better performance  
- Sample size (335 albums with valid pre/post data) is a key limitation

## 📚 References
- HuggingFace Transformers – `siebert/sentiment-roberta-large-english`  
- RateYourMusic.com for review data  
- Grammy data from public datasets and Kaggle  

---

🎶 This project was submitted as part of a university course on Innovation and Marketing Analytics.
