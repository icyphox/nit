# commit.nim: commits whatever's in the staging area

import std/sha1
import times

const
  GIT_DIR = ".git"
  INDEX_PATH = joinPath(GIT_DIR, "index")
  COMMIT_MESSAGE_TEMPLATE = """
  # title
  #
  # body
  """

proc index_files() =

