## 22: Working with columns

Many types of biological data are stored as files divided into columns. Very simple examples are "csv" and "tsv" but bioinformatics specific types include "bed", "gff" and "vcf"

Unix has many tools to handle and manipulate this type of files.

We will work with a file called in the "example_data" directory called `pokedex.txt`. First let's look at the first few entries of the file.  This will often reveal how many columns and what they represent.

```bash
cd example_data
head pokedex.txt
```

The first line gives the column names (there are `3` of them). 

Let's cut out the third column which is the `Type`

```bash
cut -f 3 pokedex.txt | head
```

Since it is a large file we piped the output to `head` so only the first `10` lines are printed.  

Many of the types in column `3` are repeated.  Let's find out how many different types there are in total.

```bash
cut -f 3 pokedex.txt | sort -u | wc -l
```

This introduces the [sort][] command which does exactly what you might expect. It sorts it's content.  By default it performs an alphanumeric sort but it has options for numeric sort and for selecting the column to sort by.  Here we have used `sort -u` which first sorts and then removes any duplicats (`-u` stands for unique).


[sort]: http://en.wikipedia.org/wiki/Sort_(Unix)