#!/usr/bin/env sh

# python -m src.main
service cron start
crontab -l > dpcron
cat cron.txt >> dpcron
crontab dpcron

# sleep for 7 days
sleep 604800s