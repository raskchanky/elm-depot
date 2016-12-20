# elm-depot

This is my attempt at re-writing the front-end of the [Habitat](https://www.habitat.sh) Depot in Elm.

## Tools used

This app is compiled and run using [brunch.io](http://brunch.io). Here is a quick description of the file structure:

    app                              # This directory contains the code that makes up the app
        assets                       # Everything in here is automatically copied to the public directory by brunch
        elm                          # Elm source goes in here, to be compiled by brunch
        js                           # Any non-elm javascript goes here
        sass                         # sass stylesheets go here, to be compiled by brunch
    public                           # This is where brunch puts everything that it compiles, and the brunch server serves it up from this directory


To run this app for development, first install all the dependencies.

1. [Download and install Elm](https://guide.elm-lang.org/install.html)
1. [Download and install nvm](https://github.com/creationix/nvm)
1. `nvm install (cat .nvmrc)`
1. `npm install`
1. `make`

The app should now be running and viewable at [http://localhost:3333](http://localhost:3333).  Note that this setup includes hot module reloading, meaning as soon as you save changes to a file, those changes are immediately reflected in the browser. There's no need to reload the page.

To export files for a production deployment, run `make prod` and copy the contents of the `public` directory to your production web server.
