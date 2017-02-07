This repository contains a list of Italian words I use as a dictionary in 
various text editors like IntelliJ IDEA. The dictionary is stored as a 
compressed file because it contains 3.009.116 unique words that would 
otherwise use almost 43 megabytes of space. 

The file is compressed first with incremental encoding and then with gzip. 
I understand that this is unusual, but it is very effective in this 
particular case. I was able to reduce the dictionary to less than 2% of its 
original size! 

I've included the two Ruby scripts that I use to compress and expand the 
dictionary. So just use those to work with the compressed file. 
