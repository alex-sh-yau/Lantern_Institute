import sys
import numpy

def perform(action, data):
    if action == '--min':
        print(numpy.min(data, axis=1))
    elif action == '--mean':
        print(numpy.mean(data, axis=1))
    elif action == '--max':
        print(numpy.max(data, axis=1))

def loadfile(file):
    data = numpy.loadtxt(file, delimiter=',')
    return data

def main():
    script = sys.argv[0]
    action = sys.argv[1]
    filenames = sys.argv[2:]
    
    if action not in ['--min', '--mean', '--max']:
        raise ValueError("Invalid flag")

    if not filenames:
        data = loadfile(sys.stdin)
        perform(action, data)
    else:
        for f in filenames:
            data = loadfile(f)
            perform(action, data)

            
if __name__ == '__main__':
   main()