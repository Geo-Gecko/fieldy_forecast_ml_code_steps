import os
import pandas as pd
files_ = os.listdir("/home/lydia/cashews/Benin_retrain_model/prediction_csvs")#list all the predicted csvs in the location defined
dfs = [pd.read_csv(f"/home/lydia/cashews/Benin_retrain_model/prediction_csvs/{f_}") for f_ in files_]#Read the predicted csvs
df = pd.concat(dfs, ignore_index=True)
print(f"Check generated unique classes {df['predicted_class'].unique()}")
df.to_csv("cashews_benin_prediction_PDL_20220217.csv", index=False)#Define a filename for the joined predicted csvs

