## 15: Removing files and directories

We've now created a bunch of directories and files that we probably don't want to keep. In order to remove these, we will use the [rm][] (remove) command.

>***Please read the next section VERY carefully. Misuse of the `rm` command can lead to needless death & destruction***

Potentially, `rm` is a very dangerous command; if you delete something with `rm`, you will not get it back! It is possible to delete everything in your home directory (all directories and subdirectories) with `rm`, that is why it is such a dangerous command.

Let me repeat that last part again. It is possible to delete EVERY file you have ever created with the `rm` command. Are you scared yet? You should be. Luckily there is a way of making `rm` a little bit safer. We can use it with the `-i` command-line option which will ask for confirmation before deleting anything (remember to use tab-completion). Run the following commands,
and type "y" (for yes) to indicate you truly intend to delete the files.

```bash
learner@:learning_unix$ cd temp
learner@:temp$ ls
earth.txt  heaven.txt  rags  temp2
learner@:temp$ rm -i earth.txt heaven.txt rags
rm: remove regular empty file earth.txt? y
rm: remove regular empty file heaven.txt? y
rm: remove regular empty file rags? y
learner@:temp$ ls
temp2
```

We could have simplified this step by using a wild-card (e.g. `rm -i *.txt`) or we could have made things more complex by removing each file with a separate `rm` command. 

Now all that remains is `temp2` which is a directory.  Let's see what happens if we try to remove it using the regular `rm` command.

```bash
learner@:temp$ rmdir temp2/
rm: cannot remove 'temp2': Is a directory
```

The `rm` refuses to remove `temp2` because it a directory. This is to prevent you from accidentally deleting a directory which could potentially contain a large number of files. We need to use the `r` (recursive) option to tell `rm` that we want to remove the directory and everything beneath it.  Be **very** careful when using this command.

```bash
learner@:temp$ rm -r temp2
```

To delete the `temp` directory we need to move up to it's parent

```bash
learner@:temp$ cd ..
learner@:learning_unix$ rm -r temp
```

[rm]: http://en.wikipedia.org/wiki/Rm_(Unix)
