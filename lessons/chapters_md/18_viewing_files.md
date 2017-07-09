## 18: Viewing files

The command line has several programs for viewing the contents of files. 

The [cat][cat command] can be used to show the entire contents of a file by printing it in the terminal. 

```bash
learner@:learning_unix$ echo "Bilbo" > hobbits.txt
learner@:learning_unix$ cat hobbits.txt
learner@:learning_unix$ echo "Frodo" >> hobbits.txt
learner@:learning_unix$ echo "Merry" >> hobbits.txt
learner@:learning_unix$ cat hobbits.txt
```

The [less][less command] opens the file in a view which allows you to scroll and search within the file.  It isn't very useful with `hobbits.txt` because there isn't much content in it. 

Let's open a much larger file.

```bash
cd ~
learner@:~$ less examples/pokedex.txt
```

When you are using less, you can bring up a page of help commands by pressing `h`, scroll forward a page by pressing `space`, or go forward or backwards one line at a time by pressing `j` or `k`. To exit less, press `q` (for quit). The `less` program also does many other useful things (including text searching).

The [head][head command] shows the top few lines of a file.

```bash
learner@:~$ head examples/pokedex.txt
```

The [tail][tail command] shows the last few lines of a file

```bash
learner@:~$ tail examples/pokedex.txt
```

[cat command]: http://en.wikipedia.org/wiki/Cat_(Unix)
[less command]: http://en.wikipedia.org/wiki/Less_(Unix)
[head command]: http://en.wikipedia.org/wiki/Head_(Unix)
[tail command]: http://en.wikipedia.org/wiki/Tail_(Unix)
