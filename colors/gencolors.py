
import sys
import argparse

####################################################################################################
# Google AI Overview Generated
####################################################################################################


# Convert hex to RGB tuple
def hex_to_rgb(hex_code):
    hex_code = hex_code.lstrip("#")
    return tuple(int(hex_code[i : i + 2], 16) for i in (0, 2, 4))


# Calculate color distance
def color_distance(c1, c2):
    return sum((a - b) ** 2 for a, b in zip(c1, c2))


# Build the 256 terminal color palette
def get_xterm_palette():
    palette = []
    # 16 standard/high-intensity colors
    base_16 = [
        (0, 0, 0),
        (128, 0, 0),
        (0, 128, 0),
        (128, 128, 0),
        (0, 0, 128),
        (128, 0, 128),
        (0, 128, 128),
        (192, 192, 192),
        (128, 128, 128),
        (255, 0, 0),
        (0, 255, 0),
        (255, 255, 0),
        (0, 0, 255),
        (255, 0, 255),
        (0, 255, 255),
        (255, 255, 255),
    ]
    palette.extend(base_16)

    # 6x6x6 color cube (codes 16-231)
    values = [0, 95, 135, 175, 215, 255]
    for r in values:
        for g in values:
            for b in values:
                palette.append((r, g, b))

    # Grayscale ramp (codes 232-255)
    for i in range(24):
        gray = 8 + i * 10
        palette.append((gray, gray, gray))

    return palette


# Find closest index in a given palette range
def find_closest_color(rgb, start_idx, end_idx):
    palette = get_xterm_palette()
    best_idx = start_idx
    min_dist = float("inf")
    for idx in range(start_idx, end_idx):
        dist = color_distance(rgb, palette[idx])
        if dist < min_dist:
            min_dist = dist
            best_idx = idx
    return best_idx


# Map hex to 16 and 256 colors
def map_hex_to_terminal(hex_code):
    rgb = hex_to_rgb(hex_code)
    closest_256 = find_closest_color(rgb, 0, 256)
    closest_16 = find_closest_color(rgb, 0, 16)
    return {"rgb": rgb, "code_16": closest_16, "code_256": closest_256}


####################################################################################################


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("gui_color", type=str)
    args = parser.parse_args()
    colors = map_hex_to_terminal(args.gui_color)
    print(f"{{ 'guicolor': '{args.gui_color}', 'term256color': '{colors['code_256']}', 'term16color': '{colors['code_16']}' }}")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        sys.exit(1)
    except RuntimeError as e:
        print(e, file=sys.stderr)
        sys.exit(1)
