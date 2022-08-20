# Task 1 - Data Pipelines

Ingest, process, and transform data in a periodical and timely manner.

The solution includes:
- ETL code written in Python (including tests)
- Scheduling mechanism using `cron`
- CSV data source, stored inside `datasource` directory
- Result CSV data from ETL process, stored inside `result` directory

## Solution Overview

The main ETL process is written in Python, located under `src` directory, with the corresponding tests in `tests` directory.

The scheduling mechanism of choice is `cron` which is a simple job scheduling mechanism. The cron statement is written inside the `cron.txt` file.

The CSV data source is located inside `datasource` directory, and the result of the ETL process will be written to `result` directory in timely manner.

The solution is wrapped and run as a docker container (including the `cron` scheduler), and will write the result to a local directory inside the container. Therefore, it is mandatory that you mount the `result` directory inside this repo to the destination directory inside the container in order for the result to appear in the `result` directory without needing to exec inside the docker container to see the resulting data. However, the provided `make` command has wrapped the necessary configuration needed.

## How to run - as per direction

1. Build the docker image

        make build

2. Run the docker container from the newly built image

        make run

    However, currently the cron is set to run at `1 AM everyday`, which will be very hard to observe. If you want to observe the mechanism easier, go to the next section.

## How to run - for observation

1. Inside the `cron.txt`, you will see the cron syntax:

        0 1 * * *

    which indicate that the cronjob will run at `1 AM everyday`. To observe the behaviour more easily, change the cron syntax to:

        * * * * *

    which now indicate that the cronjob will run `every minute`.

2. Remove the content inside `result` directory, so you can observe the solution indeed producing result data.

        rm -rf result/*

3. Build the docker image

        make build

4. Run the docker container from the newly built image

        make run

    Now take a look at your clock. Once the minute mark has changed, take a look inside the `result` directory. Inside, there should appear a new file named `result.csv`, which contain the result data.

## Clean up

1. Simply remove the running container

        make destroy

## Future Improvements

Currently, the choice of scheduler is `cron`. While there are lots of more sophisticated job orchestrator such as `Airflow`, the reason `cron` is chosen is because the current task at hand is so simple that it does not need orchestrator-like capability. It basically does one job: running everyday at 1 AM. It does not have any dependency graph nor external queue for event-driven actions. Therefore, the architecture of choice should not introduce unnecessary complexity which will introduce unnecessary blocker from the very beginning.

Once the requirements grow (e.g. running series of inter-dependent tasks, backfill capability, event-driven actions, external executors, highly available scheduler, etc), then we can revisit the architecture and plan for gradual improvement.