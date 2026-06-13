import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["distance", "area", "cost", "district"]

def generate_row():

    return {
        "distance": round(random.uniform(0.0, 15.0), 2),
        "area": random.randint(1, 120),
        "cost": round(random.uniform(1.0, 1000.0), 2),
        "district": random.choice(["Южное Бутово", "Северное Бутово", "Щербинка"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

