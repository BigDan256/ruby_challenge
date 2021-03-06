Development Diary
=================

2021-08-11
----------

The requirements hints at a http api. Sinatra seems like a nice http router and application base to handle this.
```
bundle add sinatra
```

For testing, I have bundled the Rspec framework and added a basic test.
```
bundle add rspec --group test
rspec --init # Create initial scripts
rspec        # Run the tests
```

For automated testing, I tried adding "guard", but it seems to require linux' select (probably to monitor file changes), so install failed on my msys environment.
Will just use manual testing and application restarting.

2021-08-12
----------

Installed ruby vscode extension to help with linting. It contained platform checks which made it look for bat files, not compatible with the msys2 environment. So I spent time switching over to a native ruby installation.

Added some classes and "namespaced" them how I would expect to do it in yii2, hopefully keeping to ruby coding styles. Nested modules doesn't feel right. I need to research the require command, to check if it's similar to lua (loaded once and cached), or if there's a require_once like php (Only load into memory if not already loaded) or what specifically it can do.

Undecided on how I will store the database and which extension to use. "sequel" or "activerecord" look good, or maybe just a simple json file like provided will do. Then a rake reset could just copy the example file to a data directory.

Rubocop is complaining about commenting, and I'm ready to add some unit tests. The describe POST functionality should then just be a matter of connecting dots.

2021-08-18
----------

Free time was difficult over the week, but plenty of time to rethink the issues I ran into working with Ruby. Re-reading the requirements, I realised I may have jumped too deep into structure. It all could just fit in a single sinatra route.

I dropped the extra APPV1 namespace layer but kept the Controllers/Models namespaces. Relocated the business logic to a warehouse model rather than the controller. Re-instated the database models but still dropped the form model.

Pretty happy with the new code, although I'm still struggling with a few concepts of Ruby, they should iron out with use. TDD didn't happen, although I will be adding tests in the next pass.
