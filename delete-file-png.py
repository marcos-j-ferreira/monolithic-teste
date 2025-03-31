import selenium
import os

for i in range(0, 10):
  if os.path.exists(f"selenium-screenshot-{i}.png"):
    os.remove(f"selenium-screenshot-{i}.png")
