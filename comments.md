## Overlays

#### overlays/nixos-configuration.nix

```nix
  # Here we're packaging the NixOS configuration for your `liam-tpad` machine.
  # That means you can build it with a command like:
  #
  #   $ nixos-rebuild build --flake .#liam-tpad
  #
  # (no `sudo`) or switch to it with:
  #
  #   $ sudo nixos-rebuild switch --flake .#liam-tpad
  #
  # The part before `#` is the path to the flake (in this case the `flake.nix`
  # file is in the current directory, so we use `.`). The part after the `#` is
  # the attribute name, i.e. a package name or path to something buildable.
  #
  # Working with a NixOS configuration doesn't require that any files be
  # placed in the `/etc/nixos/` directory like you would traditionally. It
  # only requires super user privileges to _apply_ to the system.
  #
  # By default, `nixos-rebuild` infers the attribute name from the hostname, so
  # if e.g. `hostname -s` prints `liam-tpad`, you could elide it from the
  # command:
  #
  #   $ sudo nixos-rebuild switch --flake .
  #
  # Additionally, if you create a symlink at `/etc/nixos/flake.nix` pointing to
  # your dotfiles repo's `flake.nix` file, you can also elide the `--flake .`
  # bit:
  #
  #   $ sudo nixos-rebuild switch
  #
```

#### overlays/packages.nix

```nix
    # This is a path to the `zen-browser` package provided by the
    # `github:youwen5/zen-browser-flake` flake input. We can break it down like
    # so:
    #
    # 1. `final`: One of the two arguments from the overlay. `final` refers to
    #    the final version of something, after all modifications have been
    #    applied. `prev` refers to the previous version of something, as
    #    determined by the order the overlays are applied, which is defined in
    #    `flake.nix`
    #
    # 2. `inputs`: The flake inputs/dependencies, which we threaded into the
    #     package set so that it could be accessed in overlays like this.
    #
    # 3. `zen-browser`: The name of the flake input. This is something you
    #    choose based on your own preferences. It is separate from the URL bit.
    #
    # 4. `packages`: Now we're getting into the outputs of the `zen-browser`
    #    flake. One kind of thing it outputs/exports is a package. Packages are
    #    supposed to be placed under the `packages` namespace.
    #
    # 5. `${final.stdenv.hostPlatform.system}`: A flake can output/export
    #    packages (or whatever else) for many different systems. Depending on
    #    what system you're on (Linux vs macOS, plus x86-64 vs ARM), you need to
    #    select the right version of the package. This flexibility is valuable
    #    for cases where you need to build something for a different target
    #    system, but this isn't something you should have to worry about.
    #
    # 6. `default`: A flake can define a default package if it only provides
    #    one, or provides many but there's one primary one. In this case, the
    #    `zen-browser` flake's purpose is to provide a package for the Zen web
    #    browser, so it makes sense that it would have a single default package
    #    available.
    #
    # Parts 1-3 are because of code in this repository, parts 4-6 are because of
    # code in the `https://github.com/youwen5/zen-browser-flake` repository.
```

#### ./flake.nix

```nix
  # Flake outputs are the things you're producing/exporting. That could include
  # NixOS configurations, Home Manager configurations, packages, overlays, etc.

        # To keep things simple and easy (and match what I do in my dotfiles) we
        # re-export the entire (modified!) package set as flake outputs. That
        # means you can `nix build` anything from Nixpkgs, plus any new stuff
        # you add, or with modifications you've made. For example:
        #
        #   $ nix build .#hello
        #
        # will build the `hello` package from Nixpkgs, as provided by this
        # flake.
```


