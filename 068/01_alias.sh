#!/bin/bash
# alias function

#alias foo='cd /usr; ls; cd -'  ### command line method

function foo () {
    cd /usr
    ls
    cd -
}

foo
