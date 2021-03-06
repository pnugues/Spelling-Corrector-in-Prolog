A Spelling Corrector in Prolog
==============================

Peter Norvig wrote a delightful spelling corrector in 21 lines of Python. It inspired scores of people that reimplemented it in other programming languages. This program is a version of a similar corrector in <a href="http://www.swi-prolog.org/">SWI-Prolog</a>.
All the design details of the corrector are available from Peter Norvig's <a href="http://norvig.com/spell-correct.html">page</a> as well as the corpus needed to build the dictionary: `big.txt`.

## Running the Program
To run the program, be sure to have a copy of SWI-Prolog and place the `big.txt` corpus in the same folder as the `spell.pl` program.
  1. You start first SWI-Prolog from a command shell:
  
  ~~~
  > swipl
  ~~~
  The Prolog interpreter is an interactive shell, where you type the predicates after the prompt symbols:
  ~~~
  ?-
  ~~~
  2. You load the `spell.pl` program in Prolog by typing:
  
  ~~~
  ?- [spell].
  true.
  ~~~
  3. You then initialize the corrector with:
  
  ~~~
  ?- init.
  true.
  ~~~
  This predicate creates a word dictionary out of the `big.txt` corpus: It extracts each word and, for each word, counts how many times it occurs in the corpus.
  4. And finally, you find the correction of a word by typing:
 
 ~~~
?- correct(speling, C).
C = spelling.
?- correct(korrecter, C).
C = corrected.
~~~
  where `correct/2` is the correction predicate, the first argument, the word to correct, and the second one, the proposed correction.

The Prolog program tries to follow the structure of the original in Python, and feels very natural and intuitive, notably the core of it: the `edits1` predicate. This program is longer however, 47 lines vs. 21, as Prolog lacks certain built-in functions available in Python as well as regular expressions. Using regexes, the tokenizing part, for example, takes only one line in Python while it takes 9 lines in Prolog.

## Improvements
The `spell_improved.pl` program improves the structure and speed of `spell.pl` but does not follow as closely Peter Norvig's structure. 

The `spell_yap.pl` program is an adaptation of the spell correctors to YAP Prolog. YAP is usually faster than SWI, but not completely compatible. `spell_yap.pl` loads a few libraries, one predicate, and replaces another one to run the correctors with YAP.

## Testing the Programs
To run the tests and get the execution time, just write:
~~~
?- test2(T), time(spelltest(T, N)).
~~~
after you have initialized the dictionaries with
~~~
?- init.
~~~
if you have not already done it.

PS. I would like to thank Gerlof Bouma for his suggestions on the structure of the `edits1` and `edit` predicates that led to these programs. Gerlof also advised me to remove the dictionaries to ensure a better portability and flip the order of the `append` and `letter` predicates in  `edits1`. This reduces considerably the number of inferences.
