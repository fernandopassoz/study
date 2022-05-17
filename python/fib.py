import sys

def fib(value, a=0, b=1):
    o = a
    a = b
    b = a + o
    if(a <= value):
        print(a)
        fib(value, a = a, b = b)
   
if __name__ == "__main__":
    fib(int(sys.argv[1]))
