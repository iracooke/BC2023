## 05: Getting from 'A' to 'B'

We are in the home directory on the computer but we want to to work in the new `learning_unix` directory. To change directories in Unix, we use the [cd][] command:

```bash
cd learning_unix
learner@:~/learning_unix$
```

Notice that on this system the command prompt has expanded to include our current directory. This doesn't happen by default on all Unix systems, and you can configure what information appears as part of the command prompt (though we won't cover that here).

Remember that you can always find out where you are using `pwd`:

```bash
learner@:inner$ pwd
/home/learner/learning_unix/
```

[cd]: http://en.wikipedia.org/wiki/Cd_(command)
