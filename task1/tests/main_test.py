import pytest
import pandas as pd
from pandas.testing import assert_frame_equal
import numpy as np

import src.main as main


@pytest.mark.parametrize(
    "input, result",
    [
        ("William Davidson", ["William", "Davidson"]),
        ("Alex Gregory MD", ["Alex", "Gregory"]),
        ("Mrs. Susan Scholes", ["Susan", "Scholes"]),
        ("Dr. Ramses Sulaiman III", ["Ramses", "Sulaiman"]),
        ("Suparjo", ["Suparjo", ""]),
        ("Alexander Graham Bell", ["Alexander Graham", "Bell"]),
    ],
)
def test_split_name(input, result):
    assert main.split_name(input) == result


def test_integration():
    expected_data = {
        "name": [
            "William Davidson",
            "Alex Gregory MD",
            "Mrs. Susan Scholes",
            "Dr. Ramses Sulaiman III",
            "Suparjo",
            "Alexander Graham Bell",
        ],
        "price": [
            123.45,
            77.89,
            83.12,
            101.01,
            55.60,
            10.10,
        ],
        "above_100": [
            True,
            False,
            False,
            True,
            False,
            False,
        ],
        "first_name": [
            "William",
            "Alex",
            "Susan",
            "Ramses",
            "Suparjo",
            "Alexander Graham",
        ],
        "last_name": [
            "Davidson",
            "Gregory",
            "Scholes",
            "Sulaiman",
            np.nan,  # expected because empty string will result in NaN value if imported to DataFrame
            "Bell",
        ],
    }

    expected_df = pd.DataFrame(
        {
            "name": pd.Series(expected_data["name"], dtype="object"),
            "price": pd.Series(expected_data["price"], dtype="float"),
            "above_100": pd.Series(expected_data["above_100"], dtype="bool"),
            "first_name": pd.Series(expected_data["first_name"], dtype="object"),
            "last_name": pd.Series(expected_data["last_name"], dtype="object"),
        }
    )

    main.main(
        datasource_folder="./tests/datasource-test",
        result_folder="./tests/result-test",
    )

    computed_df = pd.read_csv("./tests/result-test/result.csv")

    assert_frame_equal(computed_df, expected_df)
