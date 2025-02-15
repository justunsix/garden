---
filetags: ":command:cli:snippets:epubnote:"
id: 105e4b70-09da-40e7-9d7f-3798899a3b00
title: "[awk Snippets - text processing and pattern
  scanning](005-Computer-Snippets-awk.md)"
---

Source for many examples: [Learning Awk Is Essential For Linux Users -
YouTube](https://www.youtube.com/watch?v=9YOZmI-zWok)

- AWK language as defined in Aho, Kernighan and Weinberger
- Scan and help replace strings

``` shell

# * Print columns in a structure output or file

# Show process ids, print first column using $1 of process list
# - '{...}' = action to do
ps | awk '{print $1}'
# Show all process information, print all columns using $0 of process list
ps | awk '{print $0}'
# if last column is fish binary, print line
ps -ef | awk '{ if($NF == "fish") print $0}'

# * Use field separators to show column data

# Using passwd, see all users on machine
# -F = field separator
# -F ":" = use colon as field separator
awk -F ":" '{print $1}' /etc/passwd
# variations to see other columns with tab separator
awk -F ":" '{print $1"\t"$6"\6"$7}' /etc/passwd
# Use field separator :, with output used field separated as -
awk 'BEGIN{FS=":"; OFS="-"} {print $1,$6,$7}' /etc/passwd
# Return only lines with length less than 10
awk 'length($0) < 10' /etc/shells

# * Use field separators and regular expressions to show lines or data

# See all shells on machine
# -F "/" = use slash as field separator
# '/^\// {print $NF}' = if line starts with / (only process those lines), print last field
# sort = sort output
# uniq = show only unique entries, remove duplicates
awk -F "/" '/^\// {print $NF}' /etc/shells | sort | uniq

# get number of lines in output/files
awk 'END{print NR}' /etc/shells
# above command can be combined to return total lines in files
awk 'END{print NR}' /etc/shells /etc/passwd

# * Filter for lines using criteria

# disk usage
# '/\dev\/ / {print $1}' = if line contains /dev/ (only process those lines), print first field
df | awk '/\/dev/ {print $1}'
# similarly, subtract column 3 from column 2
df | awk '/\/dev/ {print $1 " " $2 -$3 }'  
# print line numbers 7 through 11
df | awk 'NR==7, NR==11 {print NR, $0}'

# * Do math on data, filter lines, and use line numbers of a file or output

# Process loop to print things
awk 'BEGIN { for(i=1; i<=10; i++) print "The square root of", i*i, "is", i;}'

# Find lines in file that begin with b or c
awk '$1 ~ /^[b,c]/ {print $0}' .bashrc

# substr = substring function, print only after 4th character of the line
awk '{print substr($0, 4)}' numbered.txt

# print lines that have the letter o
# RSTART = index of match of o
awk 'match($0, /o/) {print $0 "has \"o\" character at " RSTART}' numbered.txt

# Given a file with 1 line Firstname.Lastname@ontario.ca, extract the firstname and lastname strings
# -F = field separator
# -F "@" = use @ as field separator
# -F "." = use . as field separator
cat email.txt | awk -F "@" '{print $1}' | awk -F "." '{print $1, $2}'

```
