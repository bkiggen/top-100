- Your README should include:

  - How to run your program.
  - How to run the tests.
  - What you would do next, given more time (if anything)?
  - Are there bugs that you are aware of?

  - [ x ] The program is written in any language (ruby and java are common, but all are welcome)
  - [ ] The program has a README with instructions for running the program and the tests
  - If you choose a language other than java or ruby, please give us some hints about how you would recommend we get it running locally.
  - [ x ] The program accepts a list of one _or more_ file paths (e.g. `ruby solution.rb texts/moby-dick.txt brothers-karamazov.txt ...).`
  - [ ] The program _also_ accepts input via stdin (e.g. `cat texts/*.txt | java solution.java`).
  - [ x ] The program outputs the first 100 most common three word sequences.
  - [ x ] The program ignores punctuation, line endings, and is case insensitive
  - `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).
  - Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).
  - Hyphens on line-endings can be treated as continuations OR punctuation.
  - Unicode may also be handled in any way you like (including replacing it with a space)

* [ ] Bonus points for doing something extra and documenting it. Here are some examples that might be relevant to the team you're applying to:
  - The program is capable of processing large files and runs efficiently (>4s is normal in Ruby, 2.5s is quite quick). _Please do not_ write incomprehensible code in the quest for speed.
  - Handling unicode or line-endings gracefully.
  - Running via Docker as well as via the command-line.
  - Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)

## Testing Requirements

- [ ] The program should have automated tests that use assertions.
- [ ] The program should have documentation about how to run the program AND the tests.
- [ ] Tests should be runnable on the evaluator's machine with small effort.
- [ ] Tests should cover the important, public parts of the program.

- [ ] Bonus points for doing something extra and documenting it. Here are some examples that might be relevant to the team you're applying to:
  - The tests clearly demonstrate both functional _and_ unit style testing.
  - The tests cover boundary conditions and positive/negative tests.
  - In addition to the main body of tests, the tests _also_ cover other exploratory styles of testing such as fuzzing.
  - Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)
