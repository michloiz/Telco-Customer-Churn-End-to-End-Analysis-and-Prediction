#Load necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# -------------------------
# 0) File path - change this to where your CSV actually is
# -------------------------
path = r"C:\Users\Michalis Loizos\Desktop\Data_Analysis_Programming\Telco_Churn_Analysis\WA_Fn-UseC_-Telco-Customer-Churn.csv"  # <- change if needed

# -------------------------
# 1) Load the data
# -------------------------
df = pd.read_csv(path)
print("Loaded shape:", df.shape)
print(df.head())

# -------------------------
# 2) Basic cleanup
# drop customerID column

# -------------------------

df = df.drop(columns=['customerID'])

# convert TotalCharges to numeric (some rows are blank -> become NaN)

df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
    # fill any NaNs with median (alternatives: drop rows or use mean)
df['TotalCharges'].fillna(df['TotalCharges'].median(), inplace=True)

# -------------------------
# 3) Encode the target
#    - map 'Yes'/'No' to 1/0 for Churn
# -------------------------
if df['Churn'].dtype == 'O':
    df['Churn'] = df['Churn'].map({'Yes': 1, 'No': 0})

# -------------------------
# 4) Prepare features (X) and target (y)
# -------------------------
X = df.drop(columns=['Churn'])
y = df['Churn']

# -------------------------
# 5) One-hot encode categorical variables
#
# -------------------------
X = pd.get_dummies(X, drop_first=True)

# -------------------------
# 6) Train / Test split
#
# -------------------------
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

# -------------------------
# 7) Feature scaling
#
# -------------------------
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# -------------------------
# 8) Train logistic regression
#    - max_iter increased to ensure convergence
# -------------------------
model = LogisticRegression(max_iter=1000, solver='lbfgs')
model.fit(X_train, y_train)

# -------------------------
# 9) Predict and evaluate
# -------------------------
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Accuracy: {accuracy:.4f}")

cm = confusion_matrix(y_test, y_pred)
print("Confusion matrix (rows=true, cols=predicted):")
print(cm)

# Confusion Matrix
if cm.shape == (2, 2):
    tn, fp, fn, tp = cm.ravel()
    print(f"TN={tn}, FP={fp}, FN={fn}, TP={tp}")

print("\nClassification report:")
print(classification_report(y_test, y_pred, target_names=['No churn','Churn']))

# -------------------------
# 10) Visualize confusion matrix with matplotlib
#    - single plot, default colormap (no custom colors)
# -------------------------
fig, ax = plt.subplots(figsize=(6,6))
# show matrix
ax.imshow(cm, interpolation='nearest')
ax.set_title('Confusion matrix')
ax.set_xlabel('Predicted label')
ax.set_ylabel('True label')

# tick labels
ax.set_xticks([0, 1])
ax.set_yticks([0, 1])
ax.set_xticklabels(['No churn', 'Churn'])
ax.set_yticklabels(['No churn', 'Churn'])

# annotate the counts in each cell
for i in range(cm.shape[0]):
    for j in range(cm.shape[1]):
        ax.text(j, i, cm[i, j], ha='center', va='center', fontsize=14)

plt.tight_layout()
plt.show()
