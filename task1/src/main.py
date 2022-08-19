import pandas as pd
import numpy as np
import logging
import argparse
import os
import re

from src.utils import config


def split_name(name):
    split_name = name.split(" ")

    # filter prefix and suffix
    # TODO: implement logic prefix suffix
    # assumption: prefix always ends with '.'
    if split_name[0].endswith("."):
        split_name = split_name[1:]

    # assumption: suffix are all capital letter, consist of two or more of alphabets
    suffix_pattern = r"[A-Z]{2,}"
    if re.match(suffix_pattern, split_name[-1]):
        split_name = split_name[:-1]

    # name which has more than two words excluding prefix and suffix,
    # only last word will be taken as last_name, the rest would be concatenated
    # and placed as first_name
    # name which has only one word excluding prefix and suffix,
    # will only have first_name while its last_name will be empty string
    if len(split_name) >= 2:
        first_name = " ".join(split_name[:-1])
        last_name = split_name[-1]
    else:
        first_name = split_name[0]
        last_name = ""

    return [first_name, last_name]


def main(**kwargs):
    DATASOURCE_FOLDER = kwargs["datasource_folder"]
    RESULT_FOLDER = kwargs["result_folder"]
    RESULT_FILENAME = "result.csv"

    # to filter only csv files
    csv_files = [
        f
        for f in os.listdir(DATASOURCE_FOLDER)
        if (os.path.isfile(os.path.join(DATASOURCE_FOLDER, f)) and f.endswith(".csv"))
    ]

    logging.info("Reading CSV files in directory {}".format(DATASOURCE_FOLDER))
    df_union = None
    for f in csv_files:
        df = pd.read_csv(os.path.join(DATASOURCE_FOLDER, f))
        df_union = pd.concat([df_union, df])

    logging.info("Drop null value...")
    df_union = df_union.dropna()

    # convert "price" column to numeric, change to NaN for invalid numeric value
    # also automatically trim leading zeros
    logging.info("Convert price to numeric...")
    df_union["price"] = pd.to_numeric(df_union["price"], errors="coerce")
    df_union = df_union.dropna()

    logging.info("Compute above_100 column...")
    df_union["above_100"] = np.where(df_union["price"] > 100, True, False)

    logging.info("Split 'name' to 'first_name' and 'last_name'...")
    df_union[["first_name", "last_name"]] = df_union["name"].apply(split_name).tolist()

    logging.info(
        "Saving results to {}".format(os.path.join(RESULT_FOLDER, RESULT_FILENAME))
    )
    df_union.to_csv(os.path.join(RESULT_FOLDER, RESULT_FILENAME), index=False)


if __name__ == "__main__":
    logging.basicConfig()
    logging.getLogger().setLevel(logging.INFO)
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--datasource_folder",
        dest="datasource_folder",
        help="Folder which contain source data",
        default=config.DATASOURCE_FOLDER,
    )
    parser.add_argument(
        "--result_folder",
        dest="result_folder",
        help="Folder which which the result will be saved into",
        default=config.RESULT_FOLDER,
    )
    args = parser.parse_args()
    main(
        datasource_folder=args.datasource_folder,
        result_folder=args.result_folder,
    )
