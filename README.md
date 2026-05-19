# Auto Sales Customer Segmentation using R

This project applies data science techniques to automotive sales data to understand customer behaviour, product preferences, sales patterns, and order status classification. The project uses R to perform Conjoint Analysis, K-Means Clustering, and Discriminant Analysis on an auto sales dataset.

## Project Overview

The main objective of this project is to convert raw automotive sales data into meaningful business insights. The analysis focuses on understanding:

- Which product attributes influence customer preferences
- How customers or orders can be grouped based on similar sales behaviour
- Whether order status can be classified using numerical sales variables

The project is divided into three analytical parts:

1. Conjoint Analysis
2. K-Means Cluster Analysis
3. Discriminant Analysis

## Dataset

The dataset used in this project is the Auto Sales Data dataset from Kaggle.

Dataset link: https://www.kaggle.com/datasets/mostafasaied97/auto-sales-data

The raw dataset is not uploaded to this repository because raw data files can be large and should be downloaded separately by users.

To run this project, download the dataset from Kaggle and place the CSV file inside the following folder:

```text
data/raw/
````

Expected file location:

```text
data/raw/Auto sales data.csv
```

## Tools and Libraries Used

* R
* RStudio
* tidyverse
* dplyr
* ggplot2
* cluster
* factoextra
* MASS

## Project Structure

```text
auto-sales-customer-segmentation/
│
├── scripts/
│   ├── Conjoint_Analysis.R
│   ├── Cluster_Analysis.R
│   └── Discriminant_Analysis.R
│
├── outputs/
│   ├── elbow_curve.png
│   ├── cluster_plot.png
│   ├── cluster_assignments.csv
│   ├── conjoint_attribute_importance.png
│   └── discriminant_confusion_matrix.csv
│
├── data/
│   └── raw/
│       └── Auto sales data.csv
│
├── README.md
└── .gitignore
```

## Methodology

### 1. Conjoint Analysis

Conjoint Analysis was used to understand how different product attributes influence customer preferences.

The model used 3 product attributes:

* Product Line
* MSRP
* Price Each

A total of 112 product profile combinations were generated using:

* 7 product lines
* 4 MSRP levels
* 4 selling-price levels

This helped estimate the relative importance of product features in shaping customer preferences.

### 2. K-Means Cluster Analysis

K-Means Clustering was used to segment customers or orders based on similar sales behaviour.

The clustering model used 4 variables:

* Sales
* Quantity Ordered
* Days Since Last Order
* Deal Size

The Elbow Method was used to compare different values of K. The final clustering model used 3 clusters to identify different customer or order behaviour patterns.

The cluster analysis helped identify groups such as:

* High-value customers or orders
* Moderate-value customers or orders
* Low-value or less active customers or orders

### 3. Discriminant Analysis

Discriminant Analysis was used to classify order status using numerical variables.

The model used 3 predictors:

* Quantity Ordered
* Sales
* Price Each

This helped demonstrate how statistical classification methods can support sales and order-related decision-making.

## Outputs

The project generates the following output files:

```text
outputs/elbow_curve.png
outputs/cluster_plot.png
outputs/cluster_assignments.csv
conjoint_attribute_importance.png
discriminant_confusion_matrix.csv

```

### Output Descriptions

* `elbow_curve.png`: Shows the Elbow Method used to decide the number of clusters.
* `cluster_plot.png`: Visualises the final customer/order clusters.
* `cluster_assignments.csv`: Stores customer names with their assigned cluster labels.

## Key Insights

* Customer and order behaviour can be segmented using sales value, order quantity, recency, and deal size.
* K-Means Clustering identified 3 meaningful behavioural clusters.
* Conjoint Analysis helped evaluate how product attributes influence customer preference.
* Discriminant Analysis showed how order status can be classified using sales-related numerical variables.
* The findings can support customer segmentation, targeted marketing, sales planning, and retention strategies.

## How to Run the Project

1. Clone this repository:

```bash
git clone <your-repository-url>
```

2. Open the project folder in RStudio.

3. Download the dataset from Kaggle:

```text
https://www.kaggle.com/datasets/mostafasaied97/auto-sales-data
```

4. Place the CSV file inside:

```text
data/raw/
```

5. Open the R script:

```text
scripts/Conjoint_Analysis.R
scripts/Cluster_Analysis.R
scripts/Discriminant_Analysis.R
```

6. Make sure the dataset file path in the script is correct:

```r
df <- read.csv("data/raw/Auto sales data.csv", stringsAsFactors = FALSE)
```

7. Run the full script in RStudio.

8. The output files will be saved in:

```text
outputs/
```

## Git Ignore Setup

The `.gitignore` file is used to prevent unnecessary or large files from being uploaded to GitHub.

The `.gitignore` file contains:

```gitignore
.Rhistory
.RData
.Rproj.user/
*.Rproj
data/raw/
.DS_Store
```

This prevents R history files, RStudio project files, Mac system files, and the raw dataset from being uploaded to GitHub.

## Business Relevance

This project demonstrates how statistical and machine learning techniques can be applied to automotive sales data to support business decision-making. The results can help businesses understand customer behaviour, segment customers or orders, improve marketing strategies, and support data-driven sales planning.

## Repository Contents

This repository includes:

* R analysis script
* Cluster output files
* README documentation
* Git ignore configuration

The raw dataset is not included and must be downloaded separately from Kaggle.

````
