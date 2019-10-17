import sys

count = 0
for line in sys.stdin:
    count += 1
    print(line)
print(count, 'lines in standard input')
