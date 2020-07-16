## 17: Redirection

Try the [echo][] command.  It simply echoes back its argument as output.

```bash
learner@:learning_unix$ echo "Bilbo"
```

All of the commands we have used so far have printed their output directly in the terminal window.  What if we wanted to capture that output in a file?  We can do that using file [redirection][].  For example;

```bash
learner@:learning_unix$ echo "Bilbo" > hobbits.txt
```

Notice that when you ran the command above it didn't print any output to the screen.  All of the output was captured and printed into a file called `hobbits.txt`.

You can view the first few entries in this file using the `head` command like this

```bash
learner@:learning_unix$ head hobbits.txt
```

```bash
learner@:learning_unix$ echo "Merry" >> hobbits.txt
```

Notice that we use `>>` and not just `>`. This operator will **append** to a file. If we only used `>`, we would end up overwriting the file. 

>*** If you want to see the change you made to the file above in the editor you will need to click its name again in the file browser to refresh the editor.

>***Careful when using file redirection (>), it will overwrite any existing file of the same name***

[echo]: http://en.wikipedia.org/wiki/Echo_(Unix)
[redirection]: https://en.wikipedia.org/wiki/Redirection_(computing)