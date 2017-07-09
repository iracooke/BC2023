## 19: Counting characters, words and lines in a file

```bash
learner@:~$ cd learning_unix
learner@:learning_unix$ ls -l hobbits.txt
-rw-r--r-- 1 learner learner 18 Jul  8 21:53 hobbits.txt 

learner@:learning_unix$ wc hobbits.txt
 3  3 18 hobbits.txt

learner@:learning_unix$ wc -l hobbits.txt
3 hobbits.txt
```

The `ls -l` option shows us a long listing, which includes the size of the file in bytes (in this case '18'). Another way of finding this out is by using Unix's [wc][wc command] command (word count). By default this tells you many lines, words, and characters are in a specified file (or files), but you can use command-line options to give you just one of those statistics (in this case we count lines with `wc -l`).

[wc command]: https://en.wikipedia.org/wiki/Wc_(Unix)
