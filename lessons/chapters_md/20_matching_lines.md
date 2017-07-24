## 20: Matching lines in files with grep

You will often want to search files to find lines that match a certain pattern. The Unix command [grep][] does this (and much more). 

First change directory to `example_data`. 
```bash
learner@:~$ cd example_data
```

The following examples show how you can use grep's command-line options to:

- show lines that match a specified pattern

```bash
learner@:example_data$ grep 'was' opening_lines.txt
The Galactic Empire was dying.                                                    
It was a pleasure to burn.                                                        
It was a bright, cold day in April, and the clocks were striking thirteen.        
It was love at first sight.                                                       
It was the day my grandmother exploded.                                           
When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.
Marley was dead, to begin with.   
```

- show lines that don't match a pattern (`-v`)

```
learner@:example_data$ grep -v 'was' opening_lines.txt
Now is the winter of our discontent.                                              
All children, except one, grow up.                                                
In a hole in the ground there lived a hobbit.                                     
I am an invisible man. 
```

- ignore case when matching (`-i`)

```
learner@:example_data$ grep the opening_lines.txt
Now is the winter of our discontent.
In a hole in the ground there lived a hobbit.
It was a bright, cold day in April, and the clocks were striking thirteen.
It was the day my grandmother exploded.
When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.

learner@:example_data$ grep -i the opening_lines.txt
Now is the winter of our discontent. 
The Galactic Empire was dying.                                                                       In a hole in the ground there lived a hobbit.                                             
It was a bright, cold day in April, and the clocks were striking thirteen.
It was the day my grandmother exploded.
When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.  
```

- only match whole words (`-w`)

```
learner@:example_data$ grep in opening_lines.txt
Now is the winter of our discontent.
The Galactic Empire was dying.
In a hole in the ground there lived a hobbit.
It was a bright, cold day in April, and the clocks were striking thirteen.
I am an invisible man.
Marley was dead, to begin with.

learner@:example_data$ grep -w in opening_lines.txt
In a hole in the ground there lived a hobbit.
It was a bright, cold day in April, and the clocks were striking thirteen.
```

- Use wildcard characters and other patterns to allow for alternatives (`*`, `.`, and `[]`)

```
learner@:example_data$ grep -w o.. opening_lines.txt
Now is the winter of our discontent.
All children, except one, grow up.

learner@:example_data$ grep [aeiou]t opening_lines.txt
In a hole in the ground there lived a hobbit.
It was love at first sight.
It was the day my grandmother exploded.
When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.
Marley was dead, to begin with.

learner@:example_data$ grep -w -i [aeiou]t opening_lines.txt
It was a pleasure to burn.
It was a bright, cold day in April, and the clocks were striking thirteen.
It was love at first sight.
It was the day my grandmother exploded.
When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.
```

[grep]: http://en.wikipedia.org/wiki/Grep
