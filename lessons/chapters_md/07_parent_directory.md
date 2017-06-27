## 07: Looking upwards in the Unix filesystem

Frequently, you will find that you want to look 'upwards' one level in the directory hierarchy. Two dots `..` are used in Unix to refer to the _parent_ directory of wherever you are. Every directory has a parent except the root level of the computer. Let's use `ls` to list the contents of the directory above our home directory:

```bash
learner@:~$ ls ..
```

What if you wanted to look at files up _two_ levels in the file system in one go? It's very simple, just use two sets of the `..` operator, separated by a forward slash:

```bash
ls ../..
```

These examples use the `ls` command. Try using `..` move around with the `cd` command.