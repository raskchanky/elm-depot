# elm-depot

This is my attempt at re-writing the front-end of the Habitat Depot in Elm.

## Tools used

This app is compiled and run using brunch. Here is a quick description of the file structure:

    app                              # This directory contains the code that makes up the app
        assets                       # Everything in here is automatically copied to the public directory by brunch
        elm                          # Elm source goes in here, to be compiled by brunch
        js                           # Any non-elm javascript goes here
        sass                         # sass stylesheets go here, to be compiled by brunch
    public                           # This is where brunch puts everything that it compiles, and the brunch server serves it up from this directory
