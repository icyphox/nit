import os
import ospaths
import strformat

proc init(repo: string) =
  os.createDir(ospaths.joinPath(repo, ".git"))
  for name in ["objects", "refs", "refs/heads"]:
    os.createDir(ospaths.joinPath(repo, ".git", name))
  writeFile(ospaths.joinPath(repo, ".git", "HEAD"), "ref: refs/heads/master")
  echo fmt"initialized empty repository: {repo}"


proc main() =
  init("test")

main()
