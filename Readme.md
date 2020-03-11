# Setup

Download the main Makefile using the following, where `makefiles` is the destination folder in your project where
all contexts will be:
```
curl https://raw.githubusercontent.com/jvortmann/make-contexts/master/contexts/Makefile -o makefiles/Makefile --create-dirs
```

Then run `make -C tasks setup_makefile` to symlink it to your project root.
`make help` will list all available tasks of the main Makefile to setup and update it and also to setup the contexts.
`make` (default) or `make contexts_help` will list all available contexts' help.

# Contexts

Contexts can be setup locally using `make setup_context/{context} dest=makefiles` where the variable 'dest' is needed
to define the folder where the contexts are (same as the Makefile setup).
Examples: `make setup_context/todo dest=makefiles` or make `setup_context/test/unit/ruby dest=makefiles`.

These are the available contexts:

- *[git]*                   Tasks for git when using tagged commit messages like in [Karma](http://karma-runner.github.io/0.10/dev/git-commit-msg.html)
- *[lint]*                  Tasks for lint all available languages
- *[lint/elixir]*           Tasks for lint elixir
- *[lint/javascript]*       Tasks for lint javascript
- *[lint/ruby]*             Tasks for lint ruby
- *[test/acceptance]*       Tasks for run acceptance tests (cucumber)
- *[test]*                  Tasks run both unit and acceptance tests
- *[test/unit]*             Tasks run unit tests for all available languages
- *[test/unit/elixir]*      Tasks run unit tests for elixir
- *[test/unit/javascript]*  Tasks run unit tests for javascript
- *[test/unit/ruby]*        Tasks run unit tests for ruby
- *[todo]*                  Tasks for searching for TODO in the project

# Expanding

Any `Makefile` that lives inside the `contexts` folder following the same structure, help and description messages should
be displayed as available.

Therefore, you can create your own `Makefile`s and run them with the same infrastructure.

The following comment can be used to set the description/purpose of the context.
```
##>> This define the description/purpose of the Makefile
```

The following comment can be used to explain a task.
```
## {task_name}: {text to explaing what the task do}
```
