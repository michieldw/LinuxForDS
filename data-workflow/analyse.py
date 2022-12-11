

import numpy as np
import matplotlib.pyplot as plt

# data inladen
data = np.loadtxt('out.csv', delimiter=',', skiprows=1,
                  dtype={'names': ('date', 'BNB', 'BTC', 'ETH', 'USDC', 'USDT'),
                         'formats': ('S15', 'f4', 'f4', 'f4', 'f4', 'f4')})

date = data['date']

d = {}



for col_name in ['BNB', 'BTC', 'ETH', 'USDC', 'USDT']:
    current_column = data[col_name]
    cur_mean = np.mean(current_column)
    cur_std = np.std(current_column)

    d[col_name] = f"mean={cur_mean},standard deviation={cur_std}"
    
    plt.plot(date, current_column)
    plt.xlabel('Time')
    plt.ylabel(f"{col_name} in USD")
    plt.title(f"Price of {col_name} over time")
    plt.savefig(f"{col_name}.png")
    plt.clf()

with open('./data.txt', 'r+') as file:
    file.seek(0)
    file.truncate()
    for currency,stats in d.items():
        file.write(f"{currency}\t\t{stats}\n")


