import sys

def rarity(days):
    F = 21888242871839275222246405745257275088696311157297823662689037894645226208583
    seconds = 24 * 60 * 60 * days
    return F / seconds

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: rarity.py <days>")
        sys.exit(1)

    days = sys.argv[1]
    try:
        days = int(days)
    except ValueError:
        try:
            days = float(days)
        except ValueError:
            print("Error: days must be a number")
    print(int(rarity(days)))
