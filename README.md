A Spelling Corrector in Prolog
==============================

Peter Norvig wrote a delightful spelling corrector in 21 lines of Python. It inspired scores of people that reimplemented it in other programming languages. This program is a version of a similar corrector in <a href="http://www.swi-prolog.org/">SWI-Prolog</a>.
All the design details of the corrector are available from Peter Norvig's <a href="http://norvig.com/spell-correct.html">page</a> as well as the corpus needed to build the dictionary: big.txt.

To run the program, be sure to have a copy of SWI-Prolog and the big.txt corpus in the same folder as the spell.pl program. As the program uses dictionaries, you need SWI-Prolog version 7.1 or better.
  1. You start the corrector by first starting SWI-Prolog from a command shell with enough global and local stack memory:
  
  ~~~
  > swipl -G1000000 -L1000000
  ~~~
  2. Then you load the corrector :
  
  ~~~
  ?- [spell].
  true.
  ~~~
  3. You initialize the corrector by typing:
  
  ~~~
  ?- init.
  true.
  ~~~
  This predicate creates a word dictionary out of the big.txt corpus: It extracts each word and, for each word, counts how many times it occurs in the corpus.
  4. And finally, you find the correction of a word by typing:
 
 ~~~
?- correct(speling, C).
C = spelling.
?- correct(korrecter, C).
C = corrected.
~~~
  where correct/2 is the correction predicate, the first argument, the word to correct, and the second one, the corrected word.

The Prolog program tries to follow the structure of the original in Python. It is longer however, 53 lines vs. 21, as Prolog lacks many built-in functions available in Python as well as regular expressions. Using regexes, the tokenizing part, for example, takes one line in Python while it takes 8 lines in Prolog.
