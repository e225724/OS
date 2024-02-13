import os
import subprocess

def count_words(file_paths, output_file):
    total_word_count = 0
    with open(output_file, 'w') as output:
        for file_path in file_paths:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
                word_count = 0
                for line in file:
                    word_count += len(line.split())
                total_word_count += word_count
                formatted_line = f'      {word_count} {file_path}\n'
                output.write(formatted_line)
        formatted_total_line = f'      {total_word_count} total\n'
        output.write(formatted_total_line)
    return total_word_count

def run_word_count_cmd(directory, extension, output_file):
    find_cmd = f'find {directory} -type f -name "*.{extension}"'
    xargs_cmd = 'xargs wc -w'
    tee_cmd = f'tee {output_file}'

    command = f'{find_cmd} | {xargs_cmd} | {tee_cmd}'
    subprocess.run(command, shell=True)

def main():
    directories = ['~/Desktop', '~/mori', '~/Downloads']
    extensions = ['c', 'java', 'py', 'go']

    for ext in extensions:
        output_file = f'{ext}_word_count_python.txt' if ext != 'py' else 'python_word_count_python.txt'
        file_paths = []

        find_cmd = f'find {" ".join(directories)} -type f -name "*.{ext}"'
        result = subprocess.run(find_cmd, shell=True, stdout=subprocess.PIPE, text=True)

        if not result.stdout.strip():
            print(f'No {ext} files found.')
            continue

        file_paths.extend(result.stdout.strip().split('\n'))
        count_words(file_paths, output_file)

if __name__ == "__main__":
    main()
