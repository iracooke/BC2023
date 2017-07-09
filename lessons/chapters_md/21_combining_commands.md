## 21: Combining Unix commands with pipes

One of the most poweful features of Unix is that you can send the output from one command or program to any other command (as long as the second commmand accepts input of some sort). We do this by using what is known as a [pipe][]. This is implemented using the '|' character (which is a character which always seems to be on different keys depending on the keyboard that you are using). Think of the pipe as simply connecting two Unix programs. Here's an example which uses the [grep][] and [wc][] commands:

```bash
cd ~/example_data
grep Took hobbits.txt | wc -l
42
```

In this example, `grep` searches the file, `hobbits.txt` for lines matching 'Took', it sends the lines that match through a pipe to the `wc` program. We use the `-l` option to just count lines in the matching lines (42).

```bash
grep 'Baggins' hobbits.txt | grep 'Took' | wc -l
2
```

The second example first sends the output of a `grep` for 'Baggins' to another `grep` for 'Took' and then finally this is sent to `wc` to count the number of lines. This way we can find all female Tooks who have married Bagginses and vice versa.

>***Whenever making a long pipe, test each step as you build it!***

[pipe]: http://en.wikipedia.org/wiki/Pipe_(Unix)
[wc command]: https://en.wikipedia.org/wiki/Wc_(Unix)
[grep]: http://en.wikipedia.org/wiki/Grep
