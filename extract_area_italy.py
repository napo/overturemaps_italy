#!/usr/bin/env python
# coding: utf-8

# In[2]:


import geopandas as gpd
import duckdb 
import os


# In[3]:


path_parquet_aws = "/Users/napo/Desktop/type=building/*"
output_file = "/Users/napo/Desktop/buildings_italy.parquet"


# In[4]:


italy = gpd.read_parquet("data" + os.sep + "italy.parquet")
bounds1km = italy.to_crs(epsg=3262).buffer(1000).to_crs(epsg=4326).bounds


# In[5]:


minx = bounds1km.minx.values[0]
maxx = bounds1km.maxx.values[0]
miny = bounds1km.minx.values[0]
maxy = bounds1km.maxy.values[0]


# In[6]:


sql= """
COPY (
    SELECT * 
    FROM read_parquet('%s', filename=true, hive_partitioning=1) 
         WHERE
        bbox.minx > %s 
        and bbox.maxx < %s
        and bbox.miny > %s
        and bbox.maxy < %s   
) TO '%s' (FORMAT PARQUET);
""" % (path_parquet_aws,minx,maxx,miny,maxy,output_file)


# In[7]:


duckdb.sql(sql)

