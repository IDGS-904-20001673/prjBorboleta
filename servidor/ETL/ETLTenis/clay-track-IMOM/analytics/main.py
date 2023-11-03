
import time
from controllers.mainProcessAnalytics import mainProcessAnalytics
from fillingDatabase.fillDatabase import fillDatabase


def main():
  seconds = 20
  fillDatabase()
  print('\nEmpeazando proceso\n')
  while True:
    print(f"\nEjecutando codigo cada {seconds} segundos\n")
    mainProcessAnalytics()
    time.sleep(seconds)


if __name__ == "__main__":
  main()
