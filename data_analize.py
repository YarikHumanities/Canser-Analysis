import pandas as pd 
import matplotlib.pyplot as plt
import numpy as np

def get_dataset():
    data = pd.read_csv('Export.csv',sep=';',encoding='cp1252')
    return data 

dataset = get_dataset()
dataset.info()
dataset.head(10)