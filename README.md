# McCodeman Homebrew tap

Homebrew packages for macOS and Linux.

## Install nysos

```sh
brew install mccodeman/tap/nysos
nysos --demo  # Twelve-cue tour with three layout changes
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

The stable formula packages upstream `v0.1.5` with a Sigstore-signed commit and tag,
with a verified archive checksum and embedded commit/tag metadata. It includes the Apache-2.0
license, NOTICE, and SPDX SBOM alongside the binary and manpage.
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
