"""
Used GitPython
This module downloads all git modules used by VIM
"""
from git import Repo
from git import exc
import os

# Open file with list of vim plugins
BUNDLE_LIST = open("bundle_list.txt", "r")
ROOT = "bundle"

TOTAL = 0
SKIPPED = 0
GOOD = 0
BAD = 0

print "Trying to fetch all your vim modules..."
print ""

for line in BUNDLE_LIST:

    if len(line) == 1:
        continue

    try:
        line.index("+")

    # If there is no plus sign in the beggining of the line
    except ValueError:
        TOTAL += 1

        folder = line.split("/").pop().strip()
        dest = ROOT + "/" + folder
        line = line.strip()

        if os.path.exists(dest):
            SKIPPED += 1
            print "{0} already exists".format(folder)
            continue

        else:
            try:
                Repo.clone_from(line, dest)
                print folder + " cloned"
                GOOD += 1
            except exc.GitCommandError as error:
                print "{0} failed. Repo: {1}.".format(folder, line)
                BAD += 1

print ""
print "Total: {0}. Skipped {1} repos, {2} fetched, {3} failed" \
    .format(TOTAL, SKIPPED, GOOD, BAD)
