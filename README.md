[![Gem Version](https://badge.fury.io/rb/jscop.svg)](https://badge.fury.io/rb/jscop) [![Run on Repl.it](https://repl.it/badge/github/codecell/js-companion)](https://repl.it/github/codecell/js-companion)

# Jscop

This is a Linter for checking errors in Javascript code, built with Ruby. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jscop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jscop

## Usage
- once in desired path in the terminal/console, RUN

```ruby
jscop # To lint all *.js in current Path.
jscop ./**/path_to_file.js # To lint JUST a specific file.
jscop foldername # To lint all *.js files a specific folder.
```

## Outline
  - Title, Description, Installation, Usage Above
  - Errors currently detectable by jscop
    - variable naming errors
    - class naming errors
    - Extra or redundant spacing errors 
    - Multiple declaration of classes in a file (class count) errors
    - Unused variables are detected
  - Arguments supported to initiate linting
  - Testing Javascript files with Js-Companion
    - cloning Locally to local machine
  - Unit Tests
  - Tools used
  - Code of conduct
  - Contributing

## ERRORS that can currently be detected include

### VARIABLE NAMING ERRORS
  - if capital letters or numbers is used to start a variable name, e.g
    - `*Bad practice* let 8owngoal = 4 or const Capvar = 9`
    - `*Good Practice* let meka = 4 or const mEeka = 9`
    
### CLASS NAME ERRORS 
  - if class names begin With small letters and/or
  - if class names is Snake-Cased or both e.g
    - `*Bad practice* class badclass {} or class Bad-class {}`    
    - `*Good Practice* class GoodClass {} or class Good_Class {}`
    
### SPACING ERRORS
  - if Spaces are found at beginning of lines
  - if extra spaces are found around variables e.g
    - `*Bad practice* let|   | vacuuuum = 4 or var hollow|    | = 9`
    - `*Good Practice* let meka = 4 or const mEeka = 9`

### CLASS COUNT ERROR
  - if more than one class is defined in a Module,

### UNUSED VARIABLE ERROR
  - if a variable (var, let, const) is defined and never used.
  - A lot of edge cases is covered here.

## Arguments Supported By Js-Companion to check Javascript code
  - You can pass in file(s) or a folder in any of the following cases in your terminal
    - `Youn can pass in a specific file Path to test just the file`
    - `You can pass in a Folder and all Javascript files in it will be checked and finally`
    - `Everything Js can be linted all at once (both files and Folders)`

## Testing This Repo
## Unit Tests
- Ensure you have `rspec` installed, or ensure the `gem 'rspec` is listed among the gems in the `Gemfile` => then run `bundle install`
- in your console, run `rspec` or `rake` to run all the unit tests written for this project

## Built With
- Ruby
- [Rubular](https://rubular.com/) Was used to craft and test the regular expressions
- Rubocop Linter
- Stickler CI

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/codecell/jscop. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Jscop project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/codecell/jscop/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

