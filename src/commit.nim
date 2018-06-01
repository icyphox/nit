# commit.nim: commits whatever's in the staging area

import std/sha1
import times
import ospaths
import os

const
  GIT_DIR = ".git"
  INDEX_PATH = joinPath(GIT_DIR, "index")
  COMMIT_MESSAGE_TEMPLATE = """
  # title
  #
  # body
  """

proc index_files(): string =
  var file = open(INDEX_PATH, fmRead)
  var line = file.readLine()
  return $line

proc index_tree() =
  

  

