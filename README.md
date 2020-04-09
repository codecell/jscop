[![Run on Repl.it](https://repl.it/badge/github/codecell/js-companion)](https://repl.it/github/codecell/js-companion)

# Js-Companion

This is a Linter for checking errors in Javascript code, built with Ruby. 

## PREVIEW
   ![image](https://user-images.githubusercontent.com/46686100/78828956-6eb04300-79dd-11ea-8529-598e8dc3011e.png) 

## Outline
  - Title, Description and Preview Above
  - Errors currently detectable by js-companion
    - variable naming errors
    - class naming errors
    - Extra or redundant spacing errors 
    - Multiple declaration of classes in a file (class count) errors
    - Unused variables are detected
  - Arguments supported to initiate linting
  - Testing Javascript files with Js-Companion
    - without cloning
    - cloning Locally to local machine
  - Unit Tests
  - Tools used
  - Contributing
  - Author Details

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

## Arguments Supported By Js-Companion to check Javascript code
  - You can pass in file(s) or a folder in any of the following cases in your terminal
    - `Youn can pass in a specific file Path to test just the file`
    - `You can pass in a Folder and all Javascript files in it will be checked and finally`
    - `Everything Js can be linted all at once (both files and Folders)`

## Testing Your Javscript code
  -  ### Without Cloning
  - If You don't want to clone this repository, you can simply click the `Run On Replit badge` above
    to quickly test the project on Replit. *Note* However that the the Replit console(terminal) does not support the colors and font gems used, so it will appear black/white

    ### To clone and test Javascript files locally
  - Once in the Path you intend to keep this project in the terminal of your machine
  - Clone with this command `git clone [repo](https://github.com/codecell/js-companion.git)`
  - Enter into the folder `cd js-companion`
  - Install project dependencies with the command `bundle install`
  - You can make the bin/main.rb executable with the command `chmod +x bin/main.rb` if permission is not granted.

  ### Finally To Check Javascript File;
  - use the command `bin/main.rb ./**/path_to_file.js` To lint JUST a specific file.
  - use the command `bin/main.rb FolderName` To lint all `*.js` files a specific folder.
  - To lint everything, use the command *bin/main.rb dot* => `bin/main.rb .` to lint (all files and folders) visible from the root of the current folder.

## Unit Tests
- Ensure you have `rspec` installed, or ensure the `gem 'rspec` is listed among the gems in the `Gemfile` => then run `bundle install`
- in your console, run `rspec` to run all the unit tests written for this project

## Built With
- Ruby
- [Rubular](https://rubular.com/) Was used to craft and test the regular expressions
- Rubocop Linter
- Stickler CI

## Contributing 
- Your contributions are highly welcome on improving this project

## Author

👤 **Alfred Ezaka**

- Github: [@codecell](https://github.com/codecell)
- Twitter: [@the_codecell](https://twitter.com/the_codecell) 
- Linkedin: [ezaka alfred](https://www.linkedin.com/in/alfrednoble/)


## Show your support

Give a ⭐️ if you like this project!
## Licence
MIT
