

from coincap_crawler.CoincapCrawler import CoincapCrawler
import requests
import csv
from pathlib import Path


class HistoryCoincapCrawler(CoincapCrawler):

    def get(self):
        Path("data").mkdir(parents=True, exist_ok=True)

        coins = ['bitcoin',
                 'ethereum',
                 'xrp',
                 'tether',
                 'dogecoin',
                 'bitcoin-cash',
                 'litecoin',
                 'stellar']

        headers = ['time', 'priceUsd']

        for coin in coins:

            with open(f'data/{coin}.csv', 'w') as fd:
                writer = csv.writer(fd)

                response = requests.get(f"http://api.coincap.io/v2/assets/{coin}/history?interval=d1")
                d = response.json()

                try:
                    for entry in d['data']:
                        writer.writerow([entry['date'], entry['priceUsd']])
                except:
                    print(f"Failed to retrieve 'data' field for coin: {coin}")
                fd.flush()