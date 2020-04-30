[![Gem Version](https://badge.fury.io/rb/jscop.svg)](https://badge.fury.io/rb/jscop)  [![Build Status](https://travis-ci.org/codecell/jscop.svg?branch=development)](https://travis-ci.org/codecell/jscop)  [![Run on Repl.it](https://repl.it/badge/github/codecell/jscop)](https://repl.it/github/codecell/jscop)

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
a. jscop # To lint all *.js files in the current $Path.
b. jscop ./**/path_to_file.js # To lint JUST a specific file.
c. jscop foldername # To lint all *.js files in a specific folder.
```

## Outline
  - Title, Description, Installation, Usage above
  - Errors currently detectable by jscop
    - Variable naming errors
    - Class naming errors
    - Extra or redundant spacing errors 
    - Multiple declaration of classes in a file (class count) errors
    - Unused variables are detected
  - Arguments supported to initiate linting
  - Testing this repo
  - Unit tests
  - Tools used
  - Code of conduct
  - Contributing

## ERRORS that can currently be detected include

### VARIABLE NAMING ERRORS
  - if capital letters or numbers are used to start a variable name, e.g
    - `*Bad practice* let 8owngoal = 4 or const Capvar = 9`
    - `*Good practice* let owngoal = 4 or const capVar = 9`
    
### CLASS NAME ERRORS 
  - if class names begin with small letters and/or
  - if class names are snake-cased or both e.g
    - `*Bad practice* class badclass {} or class Bad-class {}`   
    - `*Good practice* class GoodClass {} or class Good_Class {}`
  - Or if underscores and hyphen are mixed
    `*Bad practice* class Bad_class-Name {}`
    
### SPACING ERRORS
  - if spaces are found at beginning of lines
  - if extra spaces are found around variables e.g
    - `*Bad practice* let|   | vacuum = 4 or var hollow|    | = 9`
    - `*Good practice* let vacuum = 4 or const hollow = 9`

### CLASS COUNT ERROR
  - if more than one class is defined in a module,

### UNUSED VARIABLE ERROR
  - if a variable (var, let, const) is defined and never used.
  - A lot of edge cases are covered here.

## Arguments Supported By jscop to Check Javascript Code
  - You can pass in file(s) or a folder in any of the following cases in your terminal
    - `You can pass in a specific file $Path to test just the file`
    - `You can pass in a folder and all javascript files in it will be checked and finally`
    - `Everything Js can be linted all at once (both files and folders)`

## Testing This Repo
- Once in the $Path you intend to keep this project in the terminal of your machine
- Clone with this command `git clone [repo](https://github.com/codecell/jscop.git)`
- Change directory into the folder `cd jscop`
- Install project dependencies with the command `bundle install`
- You can make the `exe/jscop` file executable with the command `chmod a+x exe/jscop` if permission is not granted

## Unit Tests
- Ensure you have `rspec` installed, or ensure that `gem rspec` is listed among the gems in the `Gemfile` => then run `bundle install`
- In the console, run `rspec` or `rake` to run all the unit tests written for this project

## Built With
- Ruby
- [Rubular](https://rubular.com/) was used to craft and test the regular expressions
- Rubocop linter
- Stickler CI

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/codecell/jscop. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Jscop project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/codecell/jscop/blob/master/CODE_OF_CONDUCT.md).

## Author

👤 **Alfred Ezaka**

- Github: [@codecell](https://github.com/codecell)
- Twitter: [@the_codecell](https://twitter.com/the_codecell) 
- Linkedin: [ezaka alfred](https://www.linkedin.com/in/alfrednoble/)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
