## 08: Absolute and relative paths

Using `ls ..` allows us to refer to a directory _relative_ to where we are now. You can also always refer to a directory based on its _absolute_ location. E.g. if you are working in the `/home/learner/learning_unix` directory and you then want to list files in the `/tmp` directory, then you could do either of the following:

```bash
learner@:learning_unix$ ls ../../../tmp
```

or...

```bash
learner@:learning_unix$ ls /tmp
```

They both achieve the same thing, but the 2nd example requires that you know about the full _path_ from the root level of the computer to your directory of interest (the 'path' is an important concept in Unix). 

Note the leading `/` in the second command. A leading slash is what differentiates an _absolute_ path from a _relative_ path. 

Try navigating to your home directory with the `cd` command.  Then try the following two commands:

```bash
learner@:~$ls /home/learner/
```

```
learner@:~$ls home/learner/
```

The first command says go the `learner` directory that is beneath the `home` directory that is at the top level (the root) of the file system. There can only be one `/home/learner` directory on any Unix system.  The second command says go to the `learner` directory that is beneath the `home` directory that is located wherever I am right now. 

The second command doesn't work.  It gives an error `No such file or directory`.  Make sure you understand why the second command gives an error.
