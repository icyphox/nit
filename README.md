# nit (git + nim)
> A basic implementation of Git in Nim. Inspired by [pygit](https://github.com/benhoyt/pygit).

It currently supports the following Git commands:

- `init` 
- `add` (WIP)
- `commit` (WIP)


## Building
All the `.nim` files in the `src/` directory need to be compiled, like so:
```console
nim c -o bin/init src/init.nim
```
This of course, requires Nim to exist in your `PATH`.
