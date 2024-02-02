

![GitHub repo size](https://img.shields.io/github/repo-size/scottydocs/README-template.md)
![GitHub contributors](https://img.shields.io/github/contributors/scottydocs/README-template.md)
[![HitCount](https://hits.dwyl.com/dwyl/hits.svg)](https://github.com/carbajaljerson/PI02_SiniestrosViales_CABA/)
![GitHub stars](https://img.shields.io/github/stars/scottydocs/README-template.md?style=social)


# <h1 align="center">**`Fake News`**</h1>

<p align=center>
<img src="src\image_00.png" height="350" weight="500">
<p>

Welcome, below is the development of the Machine Learning Project:

## Introduction

Development of a machine learning program to identify when an article might be fake news.

## Definition of Project and Requirements:
 
- Feature Extraction: Extract relevant features from the text, such as word frequencies.
- Model Training: Train the selected models using the preprocessed dataset to learn patterns distinguishing fake from real news.
- Model Selection: Choose appropriate machine learning algorithms, such as logistic regression, random forest, etc.
- Evaluation: Assess the performance of the trained models using metrics like accuracy, precision, recall, and F1-score.


## 📊 Project Scope

The following project includes the following developments:

Data Transformation and Loading
Exploratory Data Analysis
Creation of the Predictive Model
Deployment of the Application

## Data

This project was developed based on 2 files in Excel format:

The data used for this analysis project can be found at the following [download link](https://drive.google.com/drive/folders/1FXK57f_54-qD90T9oo8ToZhY_Oj-Xmho?usp=sharing) 


## ** PROJECT DEVELOPMENT ** 

## **1. ETL Process** :

Loading the file with .csv extension using the pandas library.
Then the ETL (Extraction, Transformation, and Loading) work was carried out.
Various transformations were performed, meeting data standardization by analyzing nulls and duplicates, eliminating redundant columns, among other tasks such as data normalization.



## **2. Exploratory Data Analysis (EDA)**

Once the data is clean, it's time to review the relationships between the variables in the dataset, find if there are outliers or anomalies (which don't necessarily have to be errors), and check if there is any pattern or knowledge that can be useful in a later analysis, which would be the model.


<p align=center>
<img src="src\image_01.png" height="350" weight="500">
<p>

- True news tends to have medium-length texts, while fake news tends to have shorter or very long texts, so they are centered in the lower and upper ranges. </br>


<p align=center>
<img src="src\image_02.png" height="350" weight="400">
<p>

- The median (the central line in the boxplot rectangle) of the text length when the news is true is slightly higher compared to when it is false so True news may tend to have slightly longer texts than false ones.

- The box when the news is True, is taller than the other. This means that the length of the texts is more variable in the group of true news compared to the other.

- There are more outliers when the news is False. This indicates that there are some false news with exceptionally long or short texts compared to true news. </br>

<p align=center>
<img src="src\image_03.png" height="300" weight="400">
<p>

- It can be indicated that the news is centered on political topics as well as on relevant speeches, with a tendency towards coverage of the presidency and American politics.

## 🛠 Used technology

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![NumPy](https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=for-the-badge&logo=Matplotlib&logoColor=black)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
