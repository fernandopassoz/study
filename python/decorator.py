import functools

def doSomething(fn):
    @functools.wraps(fn)
    def wrapper(*args, **kwargs):
        print("Begin")
        fn(*args, **kwargs)
        print("End")
    return wrapper

@doSomething
def printSomething(text):
    print(text)

if __name__ == "__main__":
    printSomething("Olá")
