import os
import numpy as np
import pandas as pd
from itertools import groupby
from datetime import datetime
from tensorflow.keras.models import load_model

model_vc  = load_model(r'Cashew_Benin_2022_CNN_Eoin_0.0_B_bestweights.hdf5')
model_vf0 = load_model(r'Cashew_Benin_2022_CNN_Eoin_0.0_C0_bestweights.hdf5')
model_vf1 = load_model(r'Cashew_Benin_2022_CNN_Eoin_0.0_C1_bestweights.hdf5')

files = [r'folder\\Benin_fid_000000000100.csv']

for file_ in files:
    start_ = datetime.now()
    print(f"Starting prediction at {start_}")
    file_name = file_.split("\\")[-1]
    file_number = int(file_name.split("_")[-1].split(".")[0])
    if file_number not in []:
        if not os.path.isfile(file_name):
            os.system(f"gsutil cp gs://short-term-storage-gecko-bucket/{file_} .")
        else:
            print(f"File {file_name} already on machine")

        df = pd.read_csv(file_name)
        data_df = df.drop(columns=["row_loc","col_loc", "tile", "fid"])

        # NOTE: apply max value to each set of band columns
        band_col_list = data_df.columns.tolist()
        band_col_list.sort(key=lambda x: x.split("_")[-1])
        band_col_list = [list(g) for k, g in groupby(band_col_list, key=lambda x: x.split("_")[-1])]
        for col_list in band_col_list:
            # NOTE: the first max returns a series of max values for the cols.
            band_max_val = data_df[col_list].max().max()
            data_df[col_list] = data_df[col_list] / band_max_val

        test_data = data_df.to_numpy()
        test_data = np.reshape(test_data, (test_data.shape[0], int(test_data.shape[1]/12), 12))
        print(f"{test_data.shape} for file {file_name}")

        course_arr = model_vc(test_data)
        course_arr = np.round(course_arr)
        course_classes = np.unique(course_arr)
        
        if len(course_classes) > 1:
            
            zero_indicies = np.where(course_arr == 0.)
            one_indicies = np.where(course_arr == 1.)
            
            test_data_zero = test_data[zero_indicies[0]]
            test_data_one = test_data[one_indicies[0]]
            
            prediction_zero = np.round(model_vf0(test_data_zero))
            prediction_one  = np.argmax(model_vf1(test_data_one),axis=1) + 2

            pred_df_zero = pd.DataFrame(prediction_zero, dtype=np.float32, columns=["predicted_class"])
            pred_df_one = pd.DataFrame(prediction_one, dtype=np.float32, columns=["predicted_class"])

            pred_df_zero = pred_df_zero.set_index(pd.Index(zero_indicies[0]))
            pred_df_one = pred_df_one.set_index(pd.Index(one_indicies[0]))

            pred_df = pd.concat([pred_df_zero, pred_df_one])
            pred_df.fillna(0, inplace=True)
            pred_df.sort_index(inplace=True)
            # NOTE: For 417,085 rows, this took 3 hours hence the refactor above

            end_ = datetime.now() - start_
            print(f"Done with predictions, it took {end_.seconds / 60} minutes")
            
        else:
            if course_arr[0][0] == 0.:
                predictions = np.round(model_vf0(test_data))
                pred_df = pd.DataFrame(predictions, dtype=np.float32, columns=["predicted_class"])
            elif course_arr[0][0] == 1.:
                predictions = np.argmax(model_vf1(test_data),axis=1) + 2
                pred_df = pd.DataFrame(predictions, dtype=np.float32, columns=["predicted_class"])

            end_ = datetime.now() - start_
            print(f"Predictions took {end_.seconds / 60} minutes")

        #pred_df["predicted_class"] = pred_df.idxmax(axis=1)
        pred_df[["row_loc","col_loc","tile","fid"]] = df[["row_loc","col_loc","tile","fid"]].reset_index(drop=True).astype(int)
        
        col_list = pred_df.columns.tolist()
        col_list = list(filter(lambda x: x not in ["row_loc","col_loc","tile", "fid", "predicted_class"], col_list))

        pred_df = pred_df.drop(columns=col_list)
        pred_df.to_csv(f"csv2tiff//HRNN_prediction", index=False)

        # empty variables
        del df
        del test_data
        del pred_df

        os.system(f"rm {file_name}")
    else:
        print(f"{file_name} already worked on")
    
print("Done.")