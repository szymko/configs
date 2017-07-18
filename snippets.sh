# switch off output buffering in grep
stdbuf -o 0 grep my_pattern
# use above to have live updates
tail -f something.log | stdbuf -o 0 grep my_patter
