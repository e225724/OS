mdfind -onlyin ~/Desktop -onlyin ~/mori -onlyin ~/Downloads "kMDItemFSName == '*.c'" -0 | xargs -0 wc | tee c_word_count_mdfind.txt \
&& mdfind -onlyin ~/Desktop -onlyin ~/mori -onlyin ~/Downloads "kMDItemFSName == '*.java'" -0 | xargs -0 wc | tee java_word_count_mdfind.txt \
&& mdfind -onlyin ~/Desktop -onlyin ~/mori -onlyin ~/Downloads "kMDItemFSName == '*.py'" -0 | xargs -0 wc | tee python_word_count_mdfind.txt \
&& mdfind -onlyin ~/Desktop -onlyin ~/mori -onlyin ~/Downloads "kMDItemFSName == '*.go'" -0 | xargs -0 wc | tee go_word_count_mdfind.txt
