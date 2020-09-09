import pandas as pd
from functools import reduce
from datenguidepy.query_builder import Query
from datenguidepy.query_helper import get_regions, get_availability_summary

def get_df_datenguide(region_codes, stat_codes):
  query = Query.region(region_codes, stat_codes)
  res = (query
           .results()
           .drop_duplicates(ignore_index=True))
  res = res.loc[:, ~res.columns.str.contains("_source_")]
  return res

# NUTS-1

nuts1_stats = ["PEN071", "PEN072", "PEN079", "BEVST6"]

nuts1_regions = (get_regions()
                   .query("level == 'nuts1'")
                   .index
                   .to_list())

laender_df = (get_df_datenguide(nuts1_regions, nuts1_stats)
                .query("year > 2010 & year < 2020")
                .replace("Baden-Württemberg, Land", "Baden-Württemberg")
                .rename(columns = {"PEN071": "In",
                                   "PEN072": "Out",
                                   "PEN079": "Balance",
                                   "BEVST6": "pop"}))

laender_df.to_csv(path_or_buf = "laender_df.csv", index = False)

# NUTS-3

nuts3_stats = ["PEN081", "PEN082", "PEN099", "BEVST6"]

nuts3_regions = (get_regions()
                   .query("level == 'nuts3'")
                   .index
                   .to_list())

# Some regions have more than one ID
regions_2_ids = (get_regions()
                   .query("level == 'nuts3'")
                   .reset_index()
                   .groupby("name")
                   .count()
                   .query("region_id > 1")
                   .index
                   .to_list())

ids_dupl = (get_regions()
              .query("name in @regions_2_ids & level == 'nuts3'")
              .index
              .to_list())

picked_from_dupl = (get_availability_summary()
                      .query("region_id in @ids_dupl & statistic in @nuts3_stats")
                      .dropna()
                      .reset_index()
                      .region_id
                      .unique()
                      .tolist())

nuts3_regions_ok = [x for x in nuts3_regions if x not in set(ids_dupl)] + picked_from_dupl

kreise_df_list = []

for x in nuts3_stats:
  df = get_df_datenguide(nuts3_regions_ok, [x])
  kreise_df_list.append(df)

kreise_df = (reduce(lambda df1, df2:
                      pd.merge(df1, df2, how = "outer", on = ["id", "name", "year"]),
                      kreise_df_list)
               .query("year > 2010 & year < 2020")
               .groupby(["name", "year"])
               .agg("first")
               .reset_index()
               .rename(columns = {"PEN081": "In",
                                  "PEN082": "Out",
                                  "PEN099": "Balance",
                                  "BEVST6": "pop"}))

kreise_df.to_csv(path_or_buf = "kreise_df.csv", index = False)
