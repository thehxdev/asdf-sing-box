# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

asdf plugin test sing-box https://github.com/thehxdev/asdf-sing-box.git "sing-box --help"
```

Tests are automatically run in GitHub Actions on push and PR.
