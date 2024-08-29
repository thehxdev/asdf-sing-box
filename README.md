<div align="center">

# asdf-sing-box [![Build](https://github.com/thehxdev/asdf-sing-box/actions/workflows/build.yml/badge.svg)](https://github.com/thehxdev/asdf-sing-box/actions/workflows/build.yml) [![Lint](https://github.com/thehxdev/asdf-sing-box/actions/workflows/lint.yml/badge.svg)](https://github.com/thehxdev/asdf-sing-box/actions/workflows/lint.yml)

[sing-box](https://github.com/sagernet/sing-box) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `jq`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add sing-box https://github.com/thehxdev/asdf-sing-box.git
```

sing-box:

```shell
# Show all installable versions
asdf list-all sing-box

# Install specific version
asdf install sing-box latest

# Set a version globally (on your ~/.tool-versions file)
asdf global sing-box latest

# Now sing-box commands are available
sing-box --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/thehxdev/asdf-sing-box/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Hossein Khosravi](https://github.com/thehxdev/)
