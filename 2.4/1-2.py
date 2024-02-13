import os

def find_root(directory, extention):
    result = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            base, ext = os.path.splitext(file)
            if ext == f".{extention}":
                file_path = os.path.join(root, file)
                #print(os.path.join(root, file))
                file_size = os.path.getsize(file_path)
                #print(os.path.getsize(file_path))
                with open(file_path) as f:
                    line_number = 0
                    word_number = 0
                    for line in f:
                        line_number += 1
                        word_number += len(line.split())
                #print(f"単語数:{word_number}、行数:{line_number}")
                result.append((file_path, file_size, line_number, word_number))
    return result
                


def main():
    directories = ['/Users/tokuyamamorimasa/Desktop/']#, '/Users/tokuyamamorimasa/mori/', '/Users/tokuyamamorimasa/Downloads/'
    extentions = ['c', 'java', 'py', 'go']

    for extention in extentions:
        output_file = f"{extention}_word_count_python.txt"
        if extention == 'py':
            output_file = 'python_word_count_python.txt'
        
        f = open(output_file, 'w')
        
        for directory in directories:
            file_path, file_size, line_number, word_number = find_root(directory, extention)
            f.write(f"行数:{line_number}、単語数:{word_number}、ファイルサイズ:{file_size}、{file_path}")
        

    
if __name__ == '__main__':
    main()