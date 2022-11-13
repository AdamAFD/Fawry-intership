#!/bin/bash

import hashlib

# encode string "password" to bytes
plaintext = "password".encode()
# call the sha256(...) function returns a hash object
d = hashlib.sha256(plaintext)

# generate binary hash of "password" string
hash = d.hexdigest()
print(hash)

with open("hash.txt", 'w') as hashfile:
    hashfile.write(hash)