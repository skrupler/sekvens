# sekvens.sh
A POSIX compliant podcast episode checker script written in bash.

## About
If you collect episodes of something, say armin van buuren a state of trance episodes and 
want to find out if you have all the episodes in a range you can use this script to do so.

It automatically scans a specified directory and finds the highest and lowest available episode
and checks if all episodes are in said directory by comparing the list with a sequence of highs and lows. 
It then prints out the missing episodes to screen.

## Installation
```
$ git clone https://github.com/skrupler/sekvens.git
$ cd sekvens
# make install
```


## Usage
```bash
./sekvens.sh -t /path/to/save/location -n "armin van buuren" -d 3
```

## Options

```bash
    -t,         Location of your files
    -n,         Name of podcast/show
    -d,         Digits per episode number (ie. 800 has 3)
    -h,         Prints this message
    -p,         Prints missing shows to a file (default: missing.log)
```

## Example output

```bash
foo/bar
```

## License
GPLv2
