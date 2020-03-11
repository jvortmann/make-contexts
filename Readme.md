# Setup

Download the main Makefile using the following, where `makefiles` is the destination folder in your project where all contexts will be:
```
curl https://raw.githubusercontent.com/jvortmann/make-contexts/master/contexts/Makefile -o makefiles/Makefile --create-dirs
```

Then run `make -C tasks setup_makefile` to symlink it to your project root.
`make help` will list all available contexts (this is the default tasks).
