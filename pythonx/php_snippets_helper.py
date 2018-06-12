# This is a modified version from a script I found on GitHub. Unfortunately I
# don't remember the account and searching GitHub didn't return any results.
# Once I figure out who originally made this I'll put a credit on it.
import os
import os.path
import re
import json


def namespace(path):
    m = re.search(r'(?<=/)[A-Z]\w+(/[A-Z]\w+)*(?=/[^/]+$)', path)

    ns = m.group().replace('/', '\\') if m else ''
    if not os.path.isfile('composer.json'):
        return ns

    with open('composer.json') as json_file:
        data = json.load(json_file)
        if not ('autoload' in data) or not ('psr-4' in data['autoload']):
            return ns

        psr4dev = data['autoload-dev']['psr-4']
        for key in psr4dev:
            if psr4dev[key] in path:
                return (key + ns).strip('\\')

        psr4 = data['autoload']['psr-4']
        for key in psr4:
            if psr4[key] in path:
                return (key + ns).strip('\\')

def fqn(path):
    m = re.search(r'(?<=/)[A-Z]\w+(/[A-Z]\w+)+(?=\.php)', path)
    if m:
        return m.group().replace('/', '\\')
