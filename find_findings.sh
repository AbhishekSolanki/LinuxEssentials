# find all the files inside directory including its sub directories
find . -type f

# find all the the direcory including sub dirs
find . -type d

# find files based on name
find . -type f -name file_name.*

# find files based on extensions
find . -type f -name *.log

# find all the files and apply dos2Unix / any function  on each file
find . -type f -exec dos2unix {} \;
find . -type f -exec wc -l {} \;
find . -type f -exec grep ":)"  {} \;

# find files other than 
find . -type f ! -name *.log
find . -type f \( ! -name *.log -and ! -name *.ack \) # all files except name ending with .log and .ack

# find by file size
find . -size +10k  -exec ls -lh {} \; # all files greater than 10k
find . -size -10K  -exec ls -lh {} \; # all files lesser than 10k
# b = byte blocks, c = bytes, w = 2-byte words, k = KB, M = MB, G = GB



