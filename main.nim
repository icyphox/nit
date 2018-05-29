import os
import ospaths

proc init(repo: string) =
  os.createDir(ospaths.joinPath(repo, ".git"))
  for name in ["objects", "refs", "refs/heads"]:
    os.createDir(ospaths.joinPath(repo, ".git", name))
  writeFile(ospaths.joinPath(repo, ".git", "HEAD"), "ref: refs/heads/master")


proc main() =
  init("test")

main()
