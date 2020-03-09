# Setup

Setup project as a submodule using `git submodule add https://github.com/jvortmann/make-task-contexts tasks`

Run `make -C tasks setup_tasks` to link the main Makefile to a Makefile in the home of your project.
This permits that every task be ran using just `make` and the contexts tasks.

# Help

After setup, `make help` will list all available contexts and their tasks.
