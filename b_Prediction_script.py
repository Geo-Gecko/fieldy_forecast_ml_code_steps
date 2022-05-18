import os
import numpy as np
import pandas as pd
import tensorflow_hub as hub
from google.cloud import storage
from tensorflow.keras.models import model_from_json

#This is the script used to make a prediction in a new area using an already existing model.

client = storage.Client()

modelName = "GG_model_20211013_6" #Change this to the name of the model that is being used to make the prediction
json_file = open(f"{modelName}.json", "r")
loaded_model_json = json_file.read()
json_file.close()
model = model_from_json(loaded_model_json, custom_objects={'KerasLayer': hub.KerasLayer})
model.load_weights(f"{modelName}_bestweights.hdf5")

files = []
# Folder that contains all the csvs that the prediction is going to be based on
for blob in client.list_blobs(
    'short-term-storage-gecko-bucket', prefix='cashews/Benin_Largearea/benin_prediction_fid_folder/benin_prediction_'
):
    files.append(blob.name)

for file_ in files:
    file_name = file_.split("/")[-1]
    file_number = int(file_name.split("_")[-1].split(".")[0])
    if file_number in range(500):
        if not os.path.isfile(file_name):
            os.system(f"gsutil cp gs://short-term-storage-gecko-bucket/{file_} .")
        else:
            print(f"File {file_name} already on machine")

        df = pd.read_csv(file_name)
        data_df = df.drop(columns=["row_loc","col_loc", "tile", "fid"])
        test_data = data_df.to_numpy()
        max_value = test_data.max()
        test_data = test_data / max_value
        test_data = np.reshape(test_data, (test_data.shape[0], int(test_data.shape[1]/12), 12))

        predictions = model.predict(test_data, verbose=1)

        pred_df = pd.DataFrame(predictions)
        pred_df["predicted_class"] = pred_df.idxmax(axis=1)
        pred_df[["row_loc","col_loc","tile"]] = df[["row_loc","col_loc","tile"]].reset_index(drop=True).astype(int)
        pred_df = pred_df.drop(columns=[0,1,2,3,4])
        pred_df.to_csv(f"prediction_csvs/prediction_csv_{file_name.split('_')[-1]}", index=False)# Define the file names and location of the predicted csvs

        # empty variables
        del df
        del test_data
        del pred_df

        os.system(f"rm {file_name}")
    else:
        print(f"{file_name} already worked on")

"""
# NOTE: Join generated csvs
files_ = os.listdir("prediction_csvs")
files_.sort()
dfs = [pd.read_csv(f"prediction_csvs/{f_}") for f_ in files_]
df = pd.concat(dfs, ignore_index=True)
print(f"Check generated unique classes {df['predicted_class'].unique()}")
df.to_csv("benin_prediction_tile.csv", index=False)
"""

