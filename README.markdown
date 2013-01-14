# Description

One of the most simple forms of obfuscating the meaning of a sentence is to scramble the order of the characters. This is called an anagram. This solver can operate on a single word, or a phrase.

# Example

`unscramble.word("nmaeci") # => ["cinema", "anemic"]`

# Usage

## Require the library
`irb -I /path/to/unscramble.rb`
`> load 'unscramble.rb'

## Instantiate the class `Unscramble`

The dictionary used to verify that a word is valid defaults to the system dictionary, however this can be overridden by passing a math to a dictionary along with the instantiation

`unscramble = Unscramble.new()`

Or with a custom dictionary:

`unscramble = Unscramble.new('/path/to/custom/dict')`

## Unscramble a Word

`unscramble.word("nmaeci") # => ["cinema", "anemic"]`

## Unscramble a phrase

`unscramble.phrase("a okay") # => ["a okay", "ay oak", "oak ay", "okay a", "okay a", "oak ay", "a okay", "ay oak"]`

# TODO

* Fix memory overflow issue with larger phrases
* Add hints to the solver if the phrase is to match a certain pattern
