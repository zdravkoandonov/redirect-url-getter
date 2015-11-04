# redirect-url-getter
Gets the urls that a set of input urls is redirecting to

## Usage
Run the getter.rb with the ruby interpreter in the console with two parameters - the input and the output files
```
ruby getter.rb input.txt output.txt
```
input.txt is the input file with urls on separate lines
output.txt will contain the urls that are being redirected to

*Caution: output.txt will be erased first if it exists!*