# add.nim: adds files to the staging area
import
  zip/zlib,
  std/sha1,
  ospaths,
  os,
  strformat

const
  GIT_DIR = ".git"
  OBJECTS_DIR = joinPath(GIT_DIR, "objects")
  INDEX_PATH = joinPath(GIT_DIR, "index")

let args = commandLineParams()
var path: string

try:
  path = args[0]
except IndexError:
  echo "no path specified :v"
  quit(1)


var
  file_contents = readFile(path)
  sha = secureHash(file_contents)
  sha_str = $sha
  blob = compress(file_contents)
  indiv_object = joinPath(OBJECTS_DIR, sha_str[0 .. 1])
  blob_path = joinPath(indiv_object, sha_str[2 .. sha_str.high])
  index_path = open(INDEX_PATH, fmAppend)

createDir(indiv_object)
writeFile(blob_path, blob)
index_path.writeLine(fmt"{sha_str} {path}")

