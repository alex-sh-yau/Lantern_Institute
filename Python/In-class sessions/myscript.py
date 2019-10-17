import sys
import numpy

def main():
    script = sys.argv[0]
    action = sys.argv[1]
    filenames = sys.argv[2:]

    for f in filenames:
        data = numpy.loadtxt(f, delimiter=',')
        
        # You do the rest!
        if action == '--min':
            print(numpy.min(data, axis=1))
        elif action == '--mean':
            print(numpy.mean(data, axis=1))
        elif action == '--max':
            print(numpy.max(data, axis=1))
        else:
            raise ValueError("Invalid flag")
            
if __name__ == '__main__':
   main()