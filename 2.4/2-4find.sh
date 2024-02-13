find ~/Desktop ~/mori ~/Downloads -type f -name "*.c" -exec wc {} + \
    | tee c_word_count_find.txt \
    && find ~/Desktop ~/Downloads ~/mori -type f -name "*.java" -exec wc {} + \
    | tee -a java_word_count_find.txt \
    && find ~/Desktop ~/Downloads ~/mori -type f -name "*.py" -exec wc {} + \
    | tee -a python_word_count_find.txt \
    && find ~/Desktop ~/Downloads ~/mori -type f -name "*.go" -exec wc {} + \
    | tee -a go_word_count_find.txt


