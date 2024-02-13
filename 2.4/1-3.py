import os

def count(path):
    file_size = os.path.getsize(path)
    line_number = 0
    word_number = 0
    with open(path, encoding='ISO-8859-1') as f:
        for line in f:
            line_number += 1
            word_number += len(line.split())
    return line_number, word_number, file_size
        
def find_root(directory, extension):
    result = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            base, ext = os.path.splitext(file)
            if ext == f".{extension}":
                result.append(os.path.join(root, file))
    return result
                


def main():
    directories = ['/Users/tokuyamamorimasa/Desktop/', '/Users/tokuyamamorimasa/mori/', '/Users/tokuyamamorimasa/Downloads/']
    extensions = ['c', 'java', 'py', 'go']

    for extention in extensions:
        output_file = f"{extention}_word_count_python.txt"
        if extention == 'py':
            output_file = 'python_word_count_python.txt'
        
        with open(output_file, 'w') as f:
            total_line = 0
            total_word = 0
            total_size = 0
            for directory in directories:
                file_paths = find_root(directory, extention)
                for path in file_paths:
                    line_number, word_number, file_size = count(path)
                    total_line += line_number
                    total_word += word_number
                    total_size += file_size
                    f.write(f"{line_number:8}{word_number:8}{file_size:8} {path}\n")
                    print(f"{line_number:8}{word_number:8}{file_size:8} {path}")
            f.write(f"{total_line:8}{total_word:8}{total_size:8} total")
            print(f"{total_line:8}{total_word:8}{total_size:8} total")

if __name__ == '__main__':
    main()
