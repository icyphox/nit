# init.nim: initializes a git repository
import
  os,
  ospaths,
  strformat

const
  GIT_DIR = ".git"
  OBJECTS_DIR = joinPath(GIT_DIR, "objects")
  REFS_DIR = joinPath(GIT_DIR, "refs")

proc create_objects_dir() =
  createDir(OBJECTS_DIR)
  createDir(joinPath(OBJECTS_DIR, "info"))
  createDir(joinPath(OBJECTS_DIR, "pack"))

proc create_refs_dir() =
  createDir(REFS_DIR)
  createDir(joinPath(REFS_DIR, "head"))
  createDir(joinPath(REFS_DIR, "tags"))

proc initialize_head() =
  writeFile(joinPath(GIT_DIR, "HEAD"), "ref: refs/heads/master")

createDir(GIT_DIR)
create_objects_dir()
create_refs_dir()
initialize_head()

echo fmt"initialized git repository in {os.getCurrentDir()}"
