## 09: Making the `ls` command more useful

Like most Unix commands, `ls` supports *command-line options* which let you alter its behavior and functionality. Command-line options are - as the name suggests - optional arguments that are placed after the command name. They often take the form of single letters (following a dash). 

From your home directory type the `ls` command again, but this time using the `l` option:

```bash
learner@:~$ ls -l
total 8                                                                           
drwxr-xr-x 2 learner learner 4096 Jun 23 04:35 a_directory                        
drwxr-xr-x 2 learner learner 4096 Jun 23 04:35 another_directory
```

Compare this to what happens without the `l` option.

```bash
learner@:~$ ls
a_directory  another_directory
```

The `l` option stands for _long_ which tells `ls` to produce long form output. In this mode it provides much more information for each file and directory (including file ownership and modification times). The 'd' at the start of each line indicates that these are directories. There are many, many different options for the `ls` command. Try out the following (against any directory of your choice) to see how the output changes.

```bash
ls -l
ls -R
ls -l -t -r
ls -lh
```

Note that the last example combine multiple options but only use one dash. This is a very common way of specifying multiple command-line options. You may be wondering what some of these options are doing. It's time to learn about Unix documentation...
