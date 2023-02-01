# `fd` File Finder

`fd` is a file finder, a good replacement for `find`.

Project Page: https://github.com/sharkdp/fd

## Basic usage

    fd PATTERN [PATH] [OPTIONS]

## Common Options

-I                    No Ignore (usually, fd honors .gitnore and .ignore)
--no-ignore-vsc       Disregard .gitignore only
-H, --hidden          Include hidden (e.g. dotfiles)

-s, --case-sensitive
-i, --ignore-case

-e EXTENSION          e.g. `fd controller -e ex`
