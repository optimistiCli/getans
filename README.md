# Getans

A handy script for asking yes / no  questions in \*nix command line.

## Usage
```
getans.sh [<prompt>] [<default>]
```
  * prompt
    * A yes or no question
    * Example: 'Exit now?'
  * default
    * Default choice if user hits Enter
    * Valid values: y and n
  * exit code
    * 0 if user typed ‘y’
    * 1 if user typed ‘n’

## Example
```
#!/bin/bash

if ! getans.sh 'Shall we proceed?' y ; then
    echo "User said “NO”"
    exit 1
fi

echo "User said “YES”"
# do something usefull
exit 0
```