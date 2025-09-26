---
filetags: ":gpg:snippets:epubnote:"
id: c6e319c0-ec8d-4c94-be38-ae77ec34c683
title: GNU Privacy Guard GPG Snippets
---

``` shell

# Create a GPG key pair
gpg --full-generate-key

# Generate new GPG keys for Encryption in expert mode
gpg --expert --full-gen-key
# Generate a new key pair, for options:
# - Kind of key: ECC and ECC (Elliptic curve cryptography)
# - elliptic curve: Cure 25519 (ed25519)
# - Key expiry date: 2 years

## List keys with Key ID
gpg --list-keys --keyid-format LONG
# can also use -k
# List long form of GPG keys
gpg --list-secret-keys --keyid-format=long

## Get fingerprint with a key ID
gpg --fingerprint <keyID>

# Prints the GPG key ID, in ASCII armor format using key's ID
gpg --armor --export 3AA5C34371567BD2

# Export your public key, give this file to people you want to communicate with
gpg --armor --export user-id-or-email > pubkey.asc

# Export public key for a person
gpg --export --armor alice@example.com

# Sign a file without encryption
gpg --clearsign doc.txt

# Encrypt and sign a document for multiple people
gpg --output doc.txt.gpg --encrypt --sign --recipient alice@example.com --recipient bob@example.com doc.txt
# --output : encrypted file after command
# --encrypt : encrypt a file
# --receipient : email corresponding to the GPG key of the receiver imported previously
# --sign : sign with your key

# Decrypt a file
gpg --output doc.txt --decrypt doc.txt.gpg

# Encrypt file with only passphrase
gpg --symmetric doc.txt
gpg -c doc.txt

# Decrypt file to output -o files doc.txt
gpg -o 'doc.txt' -d 'doc.txt.gpg'

# Import a public key
gpg --import public.gpg

## Sign someone's public because you know it is from them and trust them locally
gpg --sign-key <keyID>

```

## gpgtar - working with archives

``` shell

# Encrypt file or directories as archive
gpgtar -e -r alice@example.com -o mydir.gpg mydir
# -e encrypt
# -r recipient ID
# -o output file

# List contents of archive
gpgtar --list-archive myarchive.gpg

# Decrypt archive
mkdir mydir
gpgtar -d --directory mydir myarchive.gpg

```

## See Also

- [GNU Privacy Guard (GPG)](../500-8-tech-security-gpg) - [GNU Privacy
  Guard (GPG)](id:42b3dfbb-141c-4aa8-9dc0-06cefa20f62d)
