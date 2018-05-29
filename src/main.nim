import os
import ospaths
import strformat
import sha1
import zlib


proc init(repo: string) =
  os.createDir(ospaths.joinPath(repo, ".git"))
  for name in ["objects", "refs", "refs/heads"]:
    os.createDir(ospaths.joinPath(repo, ".git", name))
  writeFile(ospaths.joinPath(repo, ".git", "HEAD"), "ref: refs/heads/master")
  echo fmt"initialized empty repository: {repo}"

proc hash_object(data: string, obj_type: string, is_write: bool = True): string =
  # might have to encode it here
  var
    header = fmt"{obj_type} {len(data)}"
    full_data = header + '\x00' + data
    sha1 = sha1.secureHash(full_data)
  if is_write:
    var path = ospaths.joinPath(".git", "objects", sha1[:2], sha1[2:])
    os.existsOrCreateDir(path)
    writeFile(path, zlib.compress(full_data))
  return sha1

proc find_object(sha1_prefix: string): string =
  if len(sha1_prefix) < :
    raise ValueError("hash prefix must be 2 or more characters")
  var obj_dir = ospaths.joinPath(".git", "objects", sha1_prefix[:2])
  var rest = sha1_prefix[2:]
  var objects = [name for name in os.]



proc main() =


main()
