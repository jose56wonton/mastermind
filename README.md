# Mastermind

This is a command line based Mastermind game that was designed to practice Object Oriented Programming.

It has 2 files:
* mastermind.rb which contains the opening screen code at the bottom along with 4 methods
..* compair_codes is the method I used to compair two Code objects
..* generate_list is a method that creates an array of all possible solutions for the codemaker method
..* codebreaker is a method that contains most of the code for when the player is the one guessing
..* codemaker is a method that contains most of the code for when the computer is the one guessing
* code.rb is the class I made to represent a 4 word combination of colors
..* randomize is for creating an random answer in the codebreaker method
..* is_valid is just a validation method for a code objects
..* print_code is a print method for the code class

Use 'ruby mastermind.rb' to run the game

For more information on [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game))
This project is part of [TheOdinProject's](http://www.theodinproject.com) Ruby track.
The project itself can be seen [here](https://www.theodinproject.com/courses/ruby-programming/lessons/oop?ref=lnav)!
