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
