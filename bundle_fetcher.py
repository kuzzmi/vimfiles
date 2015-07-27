"""
Used GitPython
This module downloads all git modules used by VIM
"""
from git import Repo

BUNDLE_LIST = open('bundle_list.txt', 'r')

for line in BUNDLE_LIST:
    if len(line) == 1:
        continue

    try:
        plus = line.index('+')
    except ValueError:
        plus = 'null'

    if plus == 'null':
        folder = line.split('/').pop().strip()
        print folder
        print line
        Repo.clone_from(line.strip(), folder)


