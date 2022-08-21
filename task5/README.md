# Task 5 - Machine Learning

Predict car price based on [Car Evaluation Database](https://archive.ics.uci.edu/ml/datasets/Car+Evaluation)

The solution includes:
- Python Jupyter Notebook for data exploration (`data_exploration.ipynb`)
- Python Jupyter Notebook for model building and prediction (`model_building.ipynb`)

## Solution Overview

Two types of algorithm are being tested here, which are:
- Logistic Regression
- Decision Tree

Then, GridSearch is used for hyperparameter tuning to achieve the optimal hyperparameter.

## Result

Problem statement: given the following attributes, predict the car price category
- Maintenance = High
- Number of doors = 4
- Lug Boot Size = Big
- Safety = High
- Class Value = Good

### Logistic Regression

The accuracy for Logistic Regression algorithm is `0.326`, which is only slightly better than random chance (`0.25`).

For the original problem, the Logistic Regression algorithm predicted that the buying price is `low`.

### Decision Tree

Similaryly, the accuracy for Decision Tree algorithm is `0.321`, which is also only slightly better than random chance (`0.25`).

For the original problem, the Decision Tree algorithm also predicted that the buying price is `low`.

## How to Run

1. Install the required packages

        pip install -r requirements.txt

2. Start the Jupyter server

        jupyter notebook

    Your browser will then open a new tab, navigating to `http://localhost:8888/tree`. If your browser does not automatically open the URL, please open it manually in your browser.

3. Open the `model_building.ipyng` notebook, execute all the commands one by one from top to bottom by pressing `Shift + Enter` on each cell in orderly manner.

4. The last section shows the prediction for the original problem.

## Future Improvements

By no means the result shown here are the best results. In fact, it is even a far cry from what can be called good predictors. The result is a far from satisfactory. However, this is just my attempt to solve the problem given since I'm not a domain expert in ML field.

There are tons of things which can be done to improve the result, such as, trying and finding more suitable algorithm, tuning the hyperparameter properly, selecting the correct features, etc.
