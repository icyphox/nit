# nit (git + nim)
> A basic implementation of Git in Nim. Inspired by [pygit](https://github.com/benhoyt/pygit).

It currently supports the following Git commands:

- `init` 
- `add` 
- `commit` (WIP)


## Building
All the `.nim` files in the `src/` directory need to be compiled, like so:
```console
nim c -o bin/init src/init.nim
```
This of course, requires Nim to exist in your `PATH`.

## Note
The `.git/index` file is actually written as a binary file in Git. For the sake of simplicity, I've decided to write to it as a simple text file.  
This will result in Git complaining with a:
```
error: bad signature
fatal: index file corrupt
```
