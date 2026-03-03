from os import system
import time
import studentofftaskup

while True:
    result = [studentofftaskup.attempt()[1]]
    print("\n", *result, "", end="", sep=" | ", flush=True)
    time.sleep(1)
