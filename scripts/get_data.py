from datenguidepy.query_builder import Query
from datenguidepy.query_helper import get_regions, get_statistics, get_availability_summary

nuts1_regions = (get_regions()
                   .query("level == 'nuts1'")
                   .index
                   .to_list())

laender_df = (Query
                .region(nuts1_regions, ["PEN071", "PEN072", "PEN079", "BEVST6"])
                .results()
                .query("year > 2010 & year < 2020")
                .drop_duplicates(ignore_index = True)
                .rename(columns = {"PEN071": "In",
                                   "PEN072": "Out",
                                   "PEN079": "Balance",
                                   "BEVST6": "pop"})
                .filter(["id", "name", "year", "In", "Out", "Balance", "pop"])
                .replace("Baden-Württemberg, Land", "Baden-Württemberg"))

laender_df.to_csv(path_or_buf = "laender_df.csv")
