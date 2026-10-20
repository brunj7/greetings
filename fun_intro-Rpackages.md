# Introduction to R package development

## Why?

* Package your work and share it\!  
  * organize code **and** data  
  * reuse and share your work more easily  
* test code  
* share code with others

## What?

Mostly, organizing your work into a file structure plus a few special files that bundle everything together.

### Package Structure

Mostly a collection of folders with specific files. Here are the components you will always have:

- R code  `/R`
- Documentation  `/man`
- Package metadata  `DESCRIPTION`
- Namespace  `NAMESPACE

Here are other components:

- Data  `/data`
- Vignettes  `/vignettes`
- Tests  `/tests`
- Compiled code your package relies on  `/src`
- Installed files  `/inst`

Other components are also possible.

## How?

2 helpful packages when developing R packages:

- `devtools`
- `usethis`

And of course, RStudio helps you to build packages 🙂

## Demo

Let’s reproduce the greetings package: [https\://github.com/brunj7/greetings](https://github.com/brunj7/greetings) 

And yes, you can install an R package directly from GitHub  🤯

```R
devtools::install_github("brunj7/greetings")

library(greetings)
greetings::say_aloha("Allison")

#> Aloha, Allison 🌴 ☀️ 🌊
```

### Let’s recreate this package\!\!

## Assignment

**Create your version of the aloha R package\!**

1. Here we will be using RStudio to create a new project and then select `R package`


2\. Add some files to your package infrastructure

1. Add a README.md (run in Console)  
   `usethis::use_readme_md()`

2. Add a license (run in Console)  
   `usethis::use_mit_license("Your Name")`	See more about licences [here](https://usethis.r-lib.org/reference/licenses.html)
     
3. Create a new R Script  
   Copy/paste the function `say_aloha` (below) into the script  
     
   ```R
   say_aloha <- function(name, print = TRUE) {`  
     
     message <- paste("Aloha,",  
                      name,
                      emo::ji("palm_tree"),
                      emo::ji("sunny"),
                      emo::ji("ocean"))  
     
     if (print) {  
       cat(crayon::bgGreen(message))  
     }  
     
     invisible(message)  
   }
   ```

5. Save the script in the /R folder  
6. Commit your changes with git

3\. Link this local repository to GitHub by running the following in the R console (this creates a GitHub repo and configures it as a git remote for your project)  
`usethis::use_github()`  
	Follow the instructions until your web browser opens your repository. 

4\. Add documentation 

1. Document the function using a Roxygen skeleton (Code \> Insert Roxygen Skeleton)  
2. Run `devtools::document()` in the Console to update the package documentation  
   See, now there is a .Rd file in the  `/man` folder   
     
   Notes:   
- This also adds the function name to the NAMESPACE file to make it available to the user of the package.  
- This creates the documentation of the function that you access with `?say_aloha`

  Don’t forget to commit changes using git\!  
    
3. Update the DESCRIPTION file following instructions  
4. Add the dependencies of your package at the bottom of the DESCRIPTION file  
   ```
   Imports: crayon, emo
   Remotes: hadley/emo
   Suggests: testthat,
       knitr, 
       rmarkdown
   VignetteBuilder: knitr
   ```
6. Run `devtools::document()` to update the package documentation

5\. Build your package\!   
Run `devtools::build()` to build the package, or use the “install and restart” button in the Build tab in RStudio  

Now your package is built (and it will automatically attach, so it’s ready to use). Try your function `say_aloha(“Someone’s Name”)`\!\!\!

- Iterate if not working;  good reference: [https\://r-pkgs.org/](https://r-pkgs.org/)   
- Make some modifications to the function to personalize it\!  
- Push everything to GitHub and ask a team member to try it\!\!

### Other Thoughts

you can create a package by many ways. If you were using a computing environment without RStudio installed, the with the {`usethis` package ([https\://usethis.r-lib.org/](https://usethis.r-lib.org/)) is a great way to do so:

1. In RStudio (not in a project), in the Console run:   
   `pkgpath <- file.path("~/Desktop", "alohayourinitials")`  
   

   For example, Julien’s would be alohajb. Then, create the package by running (in the Console): 
 
   `usethis::create_package(pkgpath)`  
     
   	Then initialize the git repository by running (in the Console):   
   	`usethis::use_git()`

2. Commit the R package file structure
