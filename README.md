# McCodeman Homebrew tap

Homebrew packages for macOS and Linux.

## Install nysos

```sh
brew install mccodeman/tap/nysos
nysos --init demo.toml
nysos --config demo.toml
```

[nysos](https://github.com/McCodeman/nysos) presents scripted and interactive CLI
 demos in named terminal panes. The formula builds from source with Homebrew's
Rust dependency and installs the binary and `man nysos`; Nix is not required.

Optional Bash and Zsh completions:

```sh
nysos --install-completions
```

Reopen your terminal after installing completions.

## Update or uninstall

```sh
brew update
brew upgrade nysos
brew uninstall nysos
```

To build the latest development source instead, use
`brew install --HEAD mccodeman/tap/nysos`.

## Maintain the formula

The initial 0.1.0 package pins source commit
`7f5dcfd9cfb2eef9593f214e9fdfbc1279d004e0` because upstream has no release tags yet.
The archive checksum and embedded build metadata identify that exact revision.
For a new release, update the source URL, version, SHA-256 checksum, and
`NYSOS_GIT_COMMIT`/`NYSOS_GIT_DESCRIBE` metadata. Set `NYSOS_GIT_TAG` when packaging
a tagged release. Increment the formula revision when replacing a package without
changing its upstream version. Never silently retarget a published package.

Validate changes with:

```sh
brew style mccodeman/tap/nysos
brew install --build-from-source mccodeman/tap/nysos
brew test mccodeman/tap/nysos
brew audit --strict mccodeman/tap/nysos
```

CI builds and tests the formula on macOS and Linux. Prebuilt bottles are not
currently published.
