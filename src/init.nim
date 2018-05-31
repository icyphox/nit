import os
import ospaths
import strformat

const GIT_DIR = ".git"
const OBJECTS_DIR = ospaths.joinPath(GIT_DIR, "objects")
const REFS_DIR = ospaths.joinPath(GIT_DIR, "refs")

proc create_objects_dir() =
  os.createDir(OBJECTS_DIR)
  os.createDir(ospaths.joinPath(OBJECTS_DIR, "info"))
  os.createDir(ospaths.joinPath(OBJECTS_DIR, "pack"))

proc create_refs_dir() =
  os.createDir(REFS_DIR)
  os.createDir(ospaths.joinPath(REFS_DIR, "head"))
  os.createDir(ospaths.joinPath(REFS_DIR, "tags"))

proc initialize_head() =
  writeFile(ospaths.joinPath(GIT_DIR, "HEAD"), "ref: refs/heads/master")

os.createDir(GIT_DIR)
create_objects_dir()
create_refs_dir()
initialize_head()

echo fmt"initialized git repository in {os.getCurrentDir()}"
