# switch off output buffering in grep
stdbuf -o 0 grep my_pattern
# use above to have live updates
tail -f something.log | stdbuf -o 0 grep my_pattern

# update chef client to a specific version
(echo "version=$VERSION"; curl -L https://www.opscode.com/chef/install.sh) | sudo bash
