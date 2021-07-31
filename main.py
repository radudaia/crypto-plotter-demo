# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import requests
import csv
import time

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':



    '''
    headers = ['timestamp', 'rateUsd']

    with open('data.csv', 'a') as fd:

        writer = csv.writer(fd)
        writer.writerow(headers)

        while True:

            try:
                response = requests.get("http://api.coincap.io/v2/rates/bitcoin")
                d = response.json()
                writer.writerow([d['timestamp'], d['data']['rateUsd']])
            finally:
                fd.flush()
                time.sleep(5)


    '''




    coins = ['bitcoin', 'ethereum', 'xrp']

    headers = ['time', 'priceUsd']

    for coin in coins:

        with open(f'{coin}.csv', 'w') as fd:
            writer = csv.writer(fd)

            response = requests.get(f"http://api.coincap.io/v2/assets/{coin}/history?interval=d1")
            d = response.json()

            for entry in d['data']:
                writer.writerow([entry['time'], entry['priceUsd']])
            fd.flush()


# See PyCharm help at https://www.jetbrains.com/help/pycharm/
