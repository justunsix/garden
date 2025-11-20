---
filetags: ":gpg:security:encryption:privacy:epubnote:"
id: 42b3dfbb-141c-4aa8-9dc0-06cefa20f62d
title: GNU Privacy Guard (GPG)
---

## GNU Privacy Guard (GPG)

Sources:

- [GNU Privacy Handbook](https://gnupg.md/gph/en/manual.html)
- [Practical Guide to
  GPG](https://www.linuxbabe.com/security/a-practical-guide-to-gpg-part-1-generate-your-keypair)
- [How to create GPG key
  pair](https://www.redhat.com/sysadmin/creating-gpg-keypairs)

### GNU Privacy Handbook

GnuPG (GPG) is a tool for secure communications - a free implementation
of the OpenPGP standard. It is a command line tool that can be used to
encrypt and sign data and communication, features a key management
system, along with access modules for all kinds of public key
directories.

1.  Keys

    - Generate key pairs, revocation certificate
    - Use strong passphrases to protect private keys
    - To communicate with others, you must exchange public keys, like
      exporting a public key and sharing it with them. Verify exchanges
      by check key fingerprints with key owners.
      - Once verified, you can sign the key.
    - Public key cryptography: Encryption and decryption is done with
      the public key of the recipient. The recipient can decrypt the
      message with their private key. During encryption, the creator
      must select recipients and their public keys.
    - Symmetric key cryptography: Encryption and decryption is done with
      a symmetric cipher. The key used is derived from the passphrase
      supplied during encryption. Avoid using the same passphrase as
      your private key. Like
      `gpg --output doc.gpg --symmetric outputdoc`
    - Digital signatures certify document contents and timestamps it.
      Any modifications will render the signature invalid.
      - Documents are compressed before signed and outputted in binary
        format.
      - Given a signed document, you can:
        - Verify the signature
        - Verify the signature and recover the document
    - Clearsigned documents like Usenet posts are signed but not
      encrypted. The document is wrapped in ASCII-armoured format
      signature and otherwise the document is not changed.
    - A detached signature is a separate file that contains the
      signature of a document. The document is not modified. The
      signature can be verified with the document or the document can be
      verified with the signature.

2.  Concepts

    GPG uses cryptography concepts:

    - symmetric ciphers
    - public-key ciphers
    - one-way hashing

    1.  Symmetric Ciphers

        - Same key is used for encryption and decryption and must be
          shared with communicating parties.
          - Example
            - History: German WWII Enigma machine. Keys rotated daily.
            - Modern: 3DES, Blowfish, IDEA - 128-bit keys so there are
              2<sup>128</sup> possible keys, making current computing
              power insufficient to break them.
        - Knowledge of the algorithm is not useful without having the
          key. All security is in the key, so the *key space* must be
          large enough to make brute force attacks impractical.

    2.  Public-Key Ciphers

        Symmetric ciphers weakness can be the key exchange, which needs
        a secure channel. Large number of people communicating together
        each need their own symmetric keys to communicate.

        Public-key ciphers avoid key-exchange. A person's public key can
        be given to anyone and the private key is kept secret by the
        owner. The sender encrypts the message with the recipient's
        public key and the recipient decrypts it with their private key.

        > Public-key ciphers are based on one-way trapdoor functions. A
        > one-way function is a function that is easy to compute, but
        > the inverse is hard to compute. For example, it is easy to
        > multiply two prime numbers together to get a composite, but it
        > is difficult to factor a composite into its prime components.
        > A one-way trapdoor function is similar, but it has a trapdoor.
        > That is, if some piece of information is known, it becomes
        > easy to compute the inverse. For example, if you have a number
        > made of two prime factors, then knowing one of the factors
        > makes it easy to compute the second. Given a public-key cipher
        > based on prime factorization, the public key contains a
        > composite number made from two large prime factors, and the
        > encryption algorithm uses that composite to encrypt the
        > message. The algorithm to decrypt the message requires knowing
        > the prime factors, so decryption is easy if you have the
        > private key containing one of the factors but extremely
        > difficult if you do not have it.

        Like symmetric ciphers, a good public-key cipher depends on
        security of the key. Key size is a measure of security. The
        attack a public-key cipher, an attacked must factor a composite
        number encoded in 512 bits compared to finding the right key in
        a key space for symmetric keys and the workload is different. As
        of 1999, public keys with greater than 1024 bits are
        recommended.

    3.  Hybrid Ciphers

        - Public-key ciphers have weaknesses in that symmetric ciphers
          are stronger and faster. Public-key encryption and decryption
          are more expensive.

        - Hybrid uses strengths of both. It uses public keys to share
          the symmetric key and then symmetric keys to encrypt.

        - PGP and GPG use hybrid ciphers. Symmetric session keys are
          encrypted with the public-key cipher and automatically
          combined in a session for use. Session keys are changed with
          each exchanges.

        - Hybrid ciphers are still have weaknesses of both ciphers,
          likely the public-key cipher, but a mitigation is session keys
          are used only once.

    4.  Digital Signatures

        - A hash function is a many-to-one function that maps input to a
          value in a finite set, usually a range of natural numbers.

        - A digital signature is the result of apply a hash function to
          a document.

        - The hash function needs to:

          - Hard to find 2 documents with the same hash
          - Hard to reverse the has to recover the document

        - Examples

          - SHA
          - MD5

        - Using hash functions, document is signed by hashing it and the
          hash value is the signature. Comparing a hashed value from
          your copy with the document owner's public hash value make it
          almost certain the documents are identical.

        - In practice, a process is the hash value is encrypted with the
          signer's private key and anyone can verify the signature using
          the public key by decryption of the hash value. If the hash
          values match, the document is authentic.

        - The Digital Signature Standard (DSA) is a public key signature
          algorithm that works as above.

3.  Key Management

    Key tampering is a weakness of public-key cryptography. A *man in
    the middle attack* is where an attacker intercepts a message and
    modifies it say using a new public/private keypair and altering the
    recipient public key held by the sender. The attacker can modify the
    message and the recipient will not know. The attacker can also
    modify the public key and the sender will not know.

    Good key management involves signing keys to detect tampering of
    your key ring and check a key truly belongs to the person named on
    it. Key signatures can be used in a *web of trust* to extend
    certification to keys signed by others you trust.

    1.  Managing your own key pair

        A keypair has a public and private key.

        - Public key
          - Public portion of master signing key
          - Public portion of the subordinate signing and encryption
            subkeys
          - User IDs, real name, comment, email
          - Creation date, Expiry date
        - Private key
          - Private portions of the keys

        Example of a key

        The command-line option `--edit-key` may be used to view a
        keypair. For example,

        ``` bash
        `chloe%` `**gpg --edit-key chloe@cyb.org**`
        Secret key is available.

        pub  1024D/26B6AAE1  created: 1999-06-15 expires: never      trust: -/u
        sub  2048g/0CF8CB7A  created: 1999-06-15 expires: never
        sub  1792G/08224617  created: 1999-06-15 expires: 2002-06-14
        sub   960D/B1F423E7  created: 1999-06-15 expires: 2002-06-14
        (1)  Chloe (Jester) <chloe@cyb.org>
        (2)  Chloe (Plebian) <chloe@tel.net>
        `Command>`
        ```

        More information about the key can be obtained with interactive
        commands. The command **toggle** switches between the public and
        private components of a keypair if indeed both components are
        available.

        The public key is displayed along with an indication of whether
        or not the private key is available. Information about each
        component of the public key is then listed.

        - The first column indicates the type of the key. The keyword
          `pub` identifies the public master signing key, and the
          keyword `sub` identifies a public subordinate key.
        - The second column indicates the key's bit length, type, and
          ID. The type is `D` for a DSA key, `g` for an encryption-only
          ElGamal key, and `G` for an ElGamal key that may be used for
          both encryption and signing.
        - The creation date and expiration date are given in columns
          three and four.
        - The user IDs are listed following the keys.

    2.  Key Integrity

        - Public key distributed are vulnerable to tampering like
          modification and substitution of information.
        - Using digital signatures mitigates it by signing data with a
          private key and others can verifying the signature with the
          public key. The owner can sign the public components and the
          user ID. This process is called *self-signing*.
        - A public key that has self-signed user IDs bound to it is
          called a *certificate*.

    3.  Change Key Components

        - New subkeys and new user IDs can be changed (added, deleted)
          in your key pair.
          - Example is a person has multiple work contexts and require
            different IDs when dealing with different people
        - Key components can be deleted; however, it is not always
          better due to key distribution often merging and preserving
          older key components. Instead consider revoking key components
          instead of deleting them.
        - Key's expiration times can be updated

    4.  Revoking Key Components

        - Subkeys and User IDs can be revoked, though the process is
          different.
          - Examples:
            - Revoking an old key
            - Revoking an old email address. OpenPGP does not support
              user ID revocation. De facto, user ID revocation is done
              by revoking the self-signature on the user ID since people
              will not trust user IDs without a self-signature.

    5.  Validating Other Keys

        - Keys can be validated by personally checking fingerprints of a
          public key and then signed the public key with your private
          key to detect tampering
        - Using the *web of trust*, validating public keys can be
          delegated to people you trust assuming they signed public keys
          of people you communicate with

    6.  Trust in Key's Owner

        - You can set your trust level of another person's judgment to
          sign other people's keys with 4 levels of trust

    7.  Distributing Keys

        - Keys are ideally distributes personally. In practice, keys are
          often distributed by:
          - Email
          - Web
          - Key server - helpful with frequent signing of other people's
            keys

4.  Daily Use of GnuPG

    - GPG is a tool to protect your privacy
    - Threat actors could be:
      - Untrustworthy system administrators
      - Spies from organizations, governments
      - Legal actors
      - Criminals

    1.  Mitigation

        - Appropriate key size
          - Keeping in mind large key sizes cost speed and threat actors
            will switch to other methods to attack you anyways
        - Private key protection
          - Store your revocation key in a safe, ideally read protected
            place
          - Use a strong passphrase which is using a symmetric key to
            protect the private key
        - Using expiration dates and subkeys
          - Signing keys can last a long time
          - Encryption keys should be short lived in case they are
            compromise to reduce risk and protect future documents with
            new keys
        - Managing your web of trusts
          - Advertise your public key and that you use GPG
          - Slowly build a web of trust in a small group
          - Personally verify keys in person and get others to verify
            yours, such as carry a fingerprint when meeting people

### Practical Guide to GPG

1.  Generating a new key pair

    ``` shell

    gpg --version

    # List existing keys
    gpg --list-keys

    ## List keys with Key ID
    gpg --list-keys --keyid-format LONG

    ## Get fingerprint with a key ID
    gpg --fingerprint <keyID>

    # Generate a new key pair, for options:
    # - Kind of key: ECC (Elliptic curve cryptography
    # - elliptic curve: Cure 25519 (ed25519)
    # - Key expiry date: 2 years
    # - User ID information: name, email, comment (do not enter comment)
    gpg --expert --full-gen-key

    # Export your public key, give this file to people you want to communicate with
    gpg --armor --export user-id-or-email > pubkey.asc

    # Export your public key given a specific key ID
    gpg --armor --export <keyID> > pubkey.asc

    # The private key can also be exported

    ## Sign someone's public because you know it is from them and trust them locally
    gpg --sign-key <keyID>

    ```

    - Keys are stored under `~/.gnupg/`
      - Do not share the private key
    - The public key ID matches the last 16 bits of the key fingerprint.
      The key fingerprint is a hash of your public key.
    - The expiry date can be modified later. Keys should always have an
      expiry date in case you lose the key.

2.  Send Your Public Key to a Key Server

    ``` bash
    # Check your public key
    gpg --list-sigs user-id

    # Key ID is short like 752E173A3F8B04F5 and the key fingerprint is long like 23426436ASD25VG454FSD3453

    # Share your public key on a public key server
    # This example using Ubuntu's key server which will send it to keys.openpgp.org
    # Default in GPG set  in ~/.gnupg/gpg.conf is hkp://keys.gnupg.net
    gpg --keyserver hkps://keyserver.ubuntu.com --send-key key-id

    # Import other public keys, they will go to the keyring file ~/.gnupg/pubring.kbx
    gpg --import public-key-file
    # Alternatively, use a keyserver
    gpg --search user-id
    # or
    gpg --search user-id --keyserver hkps://keyserver.ubuntu.com
    gpg --recv-keys key-id

    ```

    - After submitting a key, you will receive an email about it and you
      can verify your email address to allow people and yourself to
      search for the key using your email address

    - After getting somebody's key, validate it:

      - Check fingerprint
      - Verify it personally with the owner
      - Sign the key to certify it is valid `gpg --sign-key key-id`

    1.  Manage GPG Keys in GUI

        - GNOME: Seahorse
        - KDE: KGPG
        - Windows: [gpg4win utilities](https://www.gpg4win.md/)

        Manage keys graphically using these applications. Can work with
        keyserver like `hkps://keys.openpgp.org`.

3.  How to Verify PGP Signature of Downloaded Software

    Example is using Veracrypt

    ``` bash
    # Go to the Veracrypt website and download the installer and PGP signature
    wget latest-downloader
    # Download the provider's public key
    wget https://www.idrix.fr/VeraCrypt/VeraCrypt_PGP_public_key.asc
    # Display the fingerprint of the key using the command below.
    gpg --show-keys VeraCrypt_PGP_public_key.asc
    # Check the fingerprint matches the one on their website

    # Import the public key to your key ring
    gpg --import VeraCrypt_PGP_public_key.asc

    # Verify the signature of the software installer file by using the PGP signature downloaded
    gpg --verify veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb.sig veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
    # Output should be "Good Signature"
    ```

    How signature verifications works:

    - The signature is a hash value, encrypted with the software
      author's private key.
    - GPG uses the public key to decrypt hash value.
    - GPG calculates the hash value of VeraCrypt installer and compare
      the two.
    - If these two hash values match, then the signature is good and the
      software wasn't tampered with.

    Optionally, to get the public key, you could have used a key server
    to avoid manually downloading the PGP public key and improves
    security practices coming from a public key server.

    ``` bash

    gpg --recv-keys <key-ID>

    # Then display the fingerprint with:
    gpg --fingerprint <key-ID>

    # If you see the following error
    gpg: keyserver receive failed: No data
    # then you can try a different key server, like this:
    gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 0x680D16DE

    ```

## See Also

- [GPG Local Security](../005-8-tech-security-gpg-local) - [GPG Local
  Security](id:1e2d6314-1c66-4ee9-8127-2d85ded47e4e)
- [GNU Privacy Guard GPG
  Snippets](../005-computer-snippets-gnu-privacy-guard-gpg) - [GNU
  Privacy Guard GPG Snippets](id:c6e319c0-ec8d-4c94-be38-ae77ec34c683)
