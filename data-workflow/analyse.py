

import numpy as np
import matplotlib as plt

# data inladen
data = np.loadtxt('out.csv', delimiter=';', skiprows=1,
                  dtype={'names': ('date', 'BNB', 'BTC', 'ETH', 'USDC', 'USDT'),
                         'formats': ('S10', 'f4', 'f4', 'f4', 'f4', 'f4')})

date = data['date']

for col_name in ['BNB', 'BTC', 'ETH', 'USDC', 'USDT']:
    current_column = data[col_name]
    cur_mean = np.mean(current_column)
    cur_std = np.std(current_column)
    
    plt.plot(date, current_column)
    plt.xlabel('Time')
    plt.ylabel(col_name)
    plt.title(f"Price of ${col_name} over time")
    plt.show()

