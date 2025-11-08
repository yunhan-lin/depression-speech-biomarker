# Code for Reviewers: Depression Detection Using Speech Analysis

##  Capsule Structure

```
Capsule/
├── code/
│   ├── statistic analysis.ipynb    # Main analysis (Python/Jupyter) 
│   ├── feature analysis.ipynb      # Feature analysis
│   ├── delong_test.R               # Statistical comparison (R) 
│   ├── run                         # Execution script 
│   └── LICENSE                     # License file 
│
└── data/
    ├── external_dataset.csv        # External validation 
    ├── internal_dataset.csv        # Internal validation 
    ├── Training+Internal.csv       # Training + Internal data 
    ├── average_feature_rwe.pq      # Rwe feature
    ├── average_feature_test.pq     # Test feature
    ├── average_feature_train.pq    # Train feature
    └── LICENSE                     # License file 
```

**Total code size**: 2.84 MB  
**Total data size**: 71.24 MB

---

##  Quick Start

### Code Ocean Interface 
1. Choose the code and set as file to run
2. Click **"Reproducible Run"** button in Code Ocean
3. Wait ~10-15 minutes
4. View results in `results/` folder

---

##  Data Files

### 1. external_dataset.csv
- **Purpose**: External validation dataset
- **Usage**: Model performance evaluation on independent test set
- **Key columns**: `target_label`, `whisper_all_score`, `hubert_score`, `wavlm_score`, etc.

### 2. internal_dataset.csv 
- **Purpose**: Internal validation dataset  
- **Usage**: Model performance evaluation on held-out validation set
- **Key columns**: Same as external dataset, plus duration-based scores

### 3. Training+Internal.csv 
- **Purpose**: Combined training and internal validation data
- **Usage**: Additional analyses (demographic baseline, subgroup analysis)
- **Key columns**: demographics

### Data Structure
All datasets of 1-3 data file contain:
- **Labels**: `target_label` (0=healthy, 1=depressed)
- **Predictions**: 
  - `whisper_all_score/label`: All 13 questions
  - `whisper_close_score/label`: Closed questions
  - `whisper_open_score/label`: Open questions
  - `whisper_negative/neutral/positive_score/label`: By emotion
  - `hubert_score/predict_label`: HuBERT model
  - `wavlm_score/predict_label`: WavLM model
- **Duration-based**: `duration20/40/80/120/240_score/label`
- **Demographics**: `gender`, `age`, `speaker_id`, ect.
- **Clinical**: `HAMD17`, `HAMD24`, `HAMA`, `SDS`, `PHQ`

### 4. average_feature_rwe/test/train.csv 
- **Purpose**: Feature values of training, internal and external validation data
- **Usage**: Features analyses 
- **Key columns**: Value of 6373 features 
---

##  Code Files

### 1. statistic analysis.ipynb - Python/Jupyter Notebook

**Main analysis notebook containing all statistical analyses and visualizations.**

#### Analyses Included:

**A. ROC Curve Analysis** (Manuscript Figure 3c)
- ROC curves for all model variants
- Comparison: Internal vs External validation
- Metrics: AUC, Sensitivity, Specificity (with 95% CI)
- Output: `results/Figure 3c/*.png`

**B. Performance Metrics** 
- AUC with confidence intervals (Bootstrap, 1000 iterations)
- Sensitivity/Specificity with CIs (Normal approximation)
- Output: `results/metrics/model_performance_metrics.csv`

**C. Duration-based Performance** (Manuscript Figure 3a)
- Performance across audio durations (20s, 40s, 80s, 120s, 240s)
- Internal and external validation plots
- Output: `results/Figure 3a/*.png`

**D. Fairness Analysis** (Manuscript Figure 4a)
- Subgroup analysis by gender and age
- F1-score, Disparity Ratio
- Statistical tests: Chi-square, Kruskal-Wallis
- Output: `results/Figure 4a.png`, `fairness_results.csv`

**E. Scatter Plot Analysis** (Manuscript Figure 5)
- Correlation: Clinical scales (HAMD17, HAMA, SDS) vs prediction scores
- Spearman correlation + Linear regression with bootstrap CI
- Output: `results/scatter/*.png`

**F. Additional Analyses**
- Confusion matrices
- Classification reports
- Subgroup performance metrics


**Expected runtime**: ~5-15 minutes  
**Dependencies**: pandas, numpy, scipy, scikit-learn, matplotlib, seaborn

---

### 1. feature analysis.ipynb - Python/Jupyter Notebook

**Main analysis notebook containing all feature analyses and visualizations.**

#### Analyses Included:

**A. Scatter plots** (Manuscript Figure 2a & 2b & 2c)
- Scatter plots for feature affacted by emotion, gender and age
- Output: `results/Figure 2a & 2b & 2c/*.png`


**Expected runtime**: ~5-15 minutes  
**Dependencies**: pandas, numpy, scipy, os, matplotlib, seaborn

---

### 3. delong_test.R - R Script

**Statistical comparison of ROC curves using DeLong test.**

#### Analyses Included:

**A. Emotion Category Comparison**
- Compare: Negative vs Neutral vs Positive emotion questions
- Within internal and external datasets separately

**B. Interview Type Comparison**
- Compare: Close vs Open vs All questions
- Within internal and external datasets separately

**C. Model Comparison**
- Compare: Whisper vs HuBERT vs WavLM
- Within internal and external datasets separately

**D. P-value Adjustment**
- Method: Benjamini-Hochberg (FDR) correction
- Reported: Original p-values + adjusted p-values

#### Running the R Script:

```bash
Rscript code/delong_test.R
```

**Expected runtime**: ~1-3 minutes  
**Dependencies**: pROC (automatically installed in Code Ocean)  
**Output**: Console output with DeLong test results + p-values

---

## 📋 Manuscript Correspondence

| Manuscript Element | Code Location | Output File |
|--------------------|---------------|-------------|
| ROC Curves | `statistic analysis.ipynb` → Section "ROC Analysis" | `results/roc_curves/*.png` |
| Duration Performance | `statistic analysis.ipynb` → Section "Duration Analysis" | `results/duration/*.png` |
| Fairness Analysis | `statistic analysis.ipynb` → Section "Fairness" | `results/fairness/subgroup_fairness.png` |
| Scatter Plots | `statistic analysis.ipynb` → Section "Scatter Analysis" | `results/scatter/*.png` |
| Performance Metrics | `statistic analysis.ipynb` → Section "Metrics with CI" | `results/metrics/model_performance_metrics.csv` |
| Fairness Metrics | `statistic analysis.ipynb` → Section "Fairness" | `results/fairness/fairness_results.csv` |
| DeLong Tests | `delong_test.R` | Console output |
| Supplementary Note | `statistic analysis.ipynb` | Various CSV files in `results/` |

---

##  Key Methodological Details

### Random Seeds
- All analyses use **fixed random seed = 42** for reproducibility
- Bootstrap iterations: **1000**
- Confidence level: **95%**

### Statistical Methods

| Analysis | Method | Implementation |
|----------|--------|----------------|
| **AUC CI** | Bootstrap (1000 iterations) | `statistic analysis.ipynb` |
| **Sensitivity/Specificity CI** | Normal approximation | `statistic analysis.ipynb` |
| **ROC Comparison** | DeLong test | `delong_test.R` |
| **P-value Adjustment** | Benjamini-Hochberg (FDR) | `delong_test.R` |
| **Optimal Threshold** | Youden's Index (J = Sens + Spec - 1) | `statistic analysis.ipynb` |
| **Fairness Metric** | Disparity Ratio (min/max F1-score) | `statistic analysis.ipynb` |
| **Correlation** | Spearman + Bootstrap CI | `statistic analysis.ipynb` |

### Code Quality
- Jupyter notebook includes:
  - Markdown documentation for each section
  - Clear cell organization
  - Inline comments
  - Output cells showing results
- R script includes:
  - Section headers
  - Function documentation
  - Result summaries

### Computational Requirements
- **RAM**: 4-8 GB sufficient
- **CPU**: Standard multi-core (no GPU needed)
- **Storage**: <1 GB total
- **Platform**: Code Ocean (cloud) or local Jupyter + R


