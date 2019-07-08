# jekotia/libbash

WARNING

This repo should presently be considered unstable. The only reason it's on GitHub in this state is because one of my personal use-cases is automated server deployment & configuration. As such, it needs to be available via Git during testing.

If you wish to use this, you must source the file `init`. This will manually load in the core functions not ending with .sh, and trigger the loader for the remaining *.sh files under this tree. To use the functions, call them like you usually would any other bash function.

---

## Table of Contents

- [Functions](#functions)
    * [Docblock](#docblock)
    * [Versioning](#versioning)
- [Style](#style)


## Functions

### Docblock

The documentation format is based on [TomDoc](http://tomdoc.org). The generator used is [tests-always-included/tomdoc.sh](https://github.com/tests-always-included/tomdoc.sh).

### Versioning

**WARNING: The below section on versioning applies to the intended behaviour once this project has left the testing phase. Version numbers will not be maintained until an overall stable 1.0.0 release has been reached.**

Function versions only increment to indicate a change in compatibility or overall functionality, based on symver (x.y.z).

- MAJOR increments (**x**.y.z) indicate breaking changes, typically through changes to a functions inputs or outputs.
    * v1.0.0 of the function "loader" takes two arguments, which are the starting path (required) and the file matching string (optional).
    * v2.0.0 takes three arguments, which are starting path (required), depth (required), and the file matching string (optional).
    * Thus, function calls designed for version 1.0.0 would:
        * pass a value intended to be the starting path, as the starting path
        * pass a value intended to be the file matching string, as the depth
- MINOR increments (x.**y**.z) indicate potentially breaking changes, typically through tweaks to the inner workings of a function which may behave different in some environments.

- PATCH increments (x.y.**z**) should never cause any changes in behaviour. These changes are typically tweaks to adhere to best/recommended/suggested-practices, documentation improvements, verbosity improvements, etc.

## Style
This project closely adheres to Google's [Shell Style Guide](https://google.github.io/styleguide/shell.xml), with the following intentional deviations:

- Formatting
    * Indentation
        * Tabs are used.
        * Tab size is set to 4.
- Naming Conventions
    * Function Names
        * Functions will be named based on their path within the library.
        * The name will begin with `jlb::` which references this repos name: **j**ekotia/**l**ib**b**ash.
        * `::` will be used to separate the elements of the functions' path.
        * Using the above approach, for a function file located at ./functions/package/install.sh, the appropriate function name would be `jlb::package::install`.
