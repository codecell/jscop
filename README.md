# Js-Companion

This is a Linter for checking errors in Javascript code, built with Ruby. 

## PREVIEW
  ![image](https://user-images.githubusercontent.com/46686100/78828956-6eb04300-79dd-11ea-8529-598e8dc3011e.png)

## Contents in This Readme
  - Title, Description and Preview Above
  - Errors currently detectable by js-companion
    - variable naming errors
    - class naming errors
    - Extra or redundant spacing errors 
    - Multiple declaration of classes in a file (class count) errors
    - Unused variables are detected
  - Arguments supported to initiate linting
  - Testing
    - without cloning
    - cloning Locally to local machine
  - Tools used
  - Contributing
  - Author Details

## ERRORS That Can Crrently Be Detected include

### VARIABLE NAMING ERRORS
  - if Capital letters or Numbers is used to Start a Variable name, 
    e.g `*Bad practice* let 8owngoal = 4 or const Capvar = 9`
        `*Good Practice* let meka = 4 or const mEeka = 9`
    
### CLASS NAME ERRORS 
  - if class names begin With small letters and/or
  - if class names is Snake-Cased or both
    e.g `*Bad practice* class badclass {} or class Bad-class {}`    
        `*Good Practice* class GoodClass {} or class Good_Class {}`
    

### SPACING ERRORS
  - if Spaces are found at beginning of lines and/or
    e.g `*Bad practice* let   vacuuuum = 4 or var hollow    = 9`
        `*Good Practice* let meka = 4 or const mEeka = 9`
  - if extra spaces are found around variables

### CLASS COUNT ERROR
  - if more than one class is defined in a Module,

### UNUSED VARIABLE ERROR
  - if a variable (var, let, const) is defeined and never used.

## Argments Supported By Js-Companion To check Javascript code
  - You can pass in file(s) or a Folders in any of the following Cases in your terminal
    `1. Youn can pass in a specific File Path to test just the file`
    `2. You can pass in a Folder and all Javascripts files in it will be checked and finally`
    `3. Everything Js can be linted all once (both files and Folders)`

## Testing
  -  ### Without Cloning
  - If You dont want to clone this repository, you can simply Click the `Run On Replit badge`
    to quickly test the project on Replit. *Note* However that the the Replit Console(terminal) does not support the coloring and font gems used, so it appear on black/white

    ### To Clone this Repo and Test Locally
  - Once in the Path you intend to keep to keep this project in the terminal of your machine
  - Clone with this command `git clone [repo](https://github.com/codecell/js-companion.git)`
  - Enter into the folder `cd js-companion`
  - Install project dependencies with the command `bundle install`
  - You can make the bin/main.rb executable with the command `chmod +x bin/main.rb` if permission is not granted.

  ### Finally To Check Javascript File;
  - use the command `bin/main.rb ./**/path_to_file.js` To lint JUST a Specific file.
  - use the command `bin/main.rb FolderName` To lint All `*.js` files a Specific folder.
  - To lint everything, use the command *bin/main.rb dot* => `bin/main.rb .` to Lint (all files and Folders) visible from the root of the current folder.


## Built With
- Ruby
- Rubocop Linter
- Stickler CI

## Contributing 
- Your Contributions are highly welcome on improving this project

## Author

👤 **Alfred Ezaka**

- Github: [@codecell](https://github.com/codecell)
- Twitter: [@the_codecell](https://twitter.com/the_codecell) 
- Linkedin: [ezaka alfred](https://www.linkedin.com/in/alfrednoble/)


## Show your support

Give a ⭐️ if you like this project!
## Licence
MIT