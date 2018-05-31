# add.nim: adds files to the staging area

import zip/zlib
import std/sha1
import ospaths
import os

const
  GIT_DIR = ".git"
  OBJECTS_DIR = joinPath(GIT_DIR, "objects")
  INDEX_PATH = joinPath(GIT_DIR, "index")

let path = paramStr(1)

if path == "":
  echo "no path specified"
  quit

var
  file_contents = readFile(path)
  sha = secureHash(file_contents)
  sha_str = $sha
  blob = deflate(file_contents)
  indiv_object = joinPath(OBJECTS_DIR, sha_str[0 .. 1])
  blob_path = joinPath(indiv_object, sha_str[2 .. sha_str.high])
  index_path = open(INDEX_PATH, fmAppend)

createDir(indiv_object)
writeFile(blob_path, blob)
index_path.write(fmt"{sha_str} {path}")

