# Introduction

The challenge here is to process the dictionary `wordlist.txt` and looking for all six letter words which are composed of two concatenated smaller words.

For example:
```
al + bums => albums
we + aver => weaver
tail + or => tailor
...
```

There are 2 different parts to this exercise: writing two different programs to solve the same problem, but each time with a different objective in mind: Readability and Speed.

# Usage

To process the word list in a simple and readable way but takes ages (> 1 hour):
```
$ ruby wordup_simple.rb
```
This uses 3 loops.

To process the word list in a fast and efficient way (~40ms on my Macbook pro):
```
$ ruby wordup.rb
```
This uses a tree data structure or [Trie](https://en.wikipedia.org/wiki/Trie). (Thanks to allegrem for providing the Node class and saving me time, you really are a gem!)
