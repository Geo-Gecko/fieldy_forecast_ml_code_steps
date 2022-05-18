#Changing the resolution of the bands to 10m by 10m 
import os

f_ = os.listdir("reprojected/20191127_20191129")
# f_20191120 = os.listdir("data/reprojected/20191120")

for dir_ in [("reprojected/20191127_20191129", f_)]:
    for file_ in dir_[1]:
        os.system(f"gdal_translate -tr 10 10 reprojected/20191127_20191129/{file_}resampled/20191127_20191129/resampled_{file_}")a
