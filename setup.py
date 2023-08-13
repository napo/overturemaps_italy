import pandas as pd
import geopandas as gpd
import duckdb 
import os

italy = gpd.read_parquet("data" + os.sep + "italy.parquet")
italy.bounds