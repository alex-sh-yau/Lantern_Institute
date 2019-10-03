import sys, os
import numpy as np

arglist = sys.argv


fname = arglist[1:]

# data = np.loadtxt(fname,delimiter=',')

def take_mean(_data):
	return np.mean(_data)

if __name__ == '__main__':
	for f in fname:
		data = np.loadtxt(f,delimiter=',')
		print(take_mean(data))
