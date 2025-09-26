---
filetags: ":git:security:sops:epubnote:"
id: 563d5df1-87e1-4fec-9783-509f18c0112f
title: Securing Git Secrets
---

About Secrets OPerationS (SOPS) to support securing secrets stored in
git

## Securing DevOps Show & Tell: Mozilla Sops

Sources: [Securing DevOps Show & Tell: Mozilla
Sops](https://www.youtube.com/watch?v=V2PRhxphH2w)

- Use sops to encrypt YAML, JSON, ENV, or binary files.
- sops can encrypt just values in key value pairs, preserving other
  content as is
- Recommended keys to use are AWS KMS, GCP KMS, Azure Key Vault, or PGP.
  AWS Key management service is demoed in to the source video. Hashi
  corp vault, `age` is also supported

Example

``` bash
# Encrypt file using AWS ARN
sops --kms 'arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012' aws-secrets.yaml
```

- sop calls AWS KMS to get encrypted data
  - AWS stores key in HSM, keys are not directly accessible
- Google Cloud Platform (GCP), Azure works similarly

### Efficient Configuration

Use `sops.yaml` to store creation rules so keys are automatically picked
to encrypt files.

After the `sops.yaml` you can just do `sops aws-secrets.yaml` and it
will use the rules in the `sops.yaml` file to create the file.

Recommendations, use multiple keys

- KMS
- GCP
- PGP (as a backup, stored securely)

Any of those keys can be used to decrypt the secret. Later on, you can
use different keys or multiple keys for different secrets.

## SOPS Usage

Source: [SOPS Usage](https://github.com/mozilla/sops#2usage)

PGP and AWS KMS, Azure Key vault and GCP keys can be used simultaneously

### Encrypting, Decryption of Files

``` bash
# If you're using AWS KMS
# create one or multiple master keys in the IAM console and export them, comma separated, in the SOPS_KMS_ARN env variable.
# It is recommended to use at least two master keys in different regions.
# Your AWS credentials must be present in ~/.aws/credentials. sops uses aws-sdk-go
export SOPS_KMS_ARN="arn:aws:kms:us-east-1:656532927350:key/920aff2e-c5f1-4040-943a-047fa387b27e,arn:aws:kms:ap-southeast-1:656532927350:key/9006a8aa-0fa6-4c14-930e-a2dfb916de1d"

cat ~/.aws/credentials
# [default]
# aws_access_key_id = AKI.....
# aws_secret_access_key = mw......

# If you want to use PGP:
# Export the fingerprints of the public keys, comma separated, in the SOPS_PGP_FP env variable
export SOPS_PGP_FP="85D77543B3D624B63CEA9E6DBC17301B491B3F21,E60892BB9BD89A69F759A1A0A3D652173B763E8F

# Optionally set $EDITOR to what sops will open for editing files, default is vim
export EDITOR=nano

# Call sops with a file path as argument. It will handle the encryption/decryption transparently and
# open the cleartext file in an editor
sops mynewtestfile.yaml

# To decrypt a file in a cat fashion, use the -d flag
sops -d mynewtestfile.yaml
```

### Key Management

``` bash
# It is recommended to renew the data key on a regular basis.
# sops supports key rotation via the -r flag. Invoking it on an existing file causes sops to reencrypt the file with a new data key, which is then encrypted with the various KMS and PGP master keys defined in the file.

sops -r example.yaml
```

### SOPS Configuration

You can create a `.sops.yaml` configuration file at the root directory
to define which keys are used for which filename.

- When creating any file under mysecretrepo, whether at the root or
  under a subdirectory, sops will recursively look for a `.sops.yaml`
  file.
- If one is found, the filename of the file being created is compared
  with the filename regexes of the configuration file.
- The first regex that matches is selected, and its keys are used to
  encrypt the file. It should be noted that the looking up of .sops.yaml
  is from the working directory (CWD) instead of the directory of the
  encrypting file

Example:

``` example
# creation rules are evaluated sequentially, the first match wins
creation_rules:
        # upon creation of a file that matches the pattern *.dev.yaml,
        # KMS set A is used
        - path_regex: \.dev\.yaml$
          kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod'
          pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'

        # prod files use KMS set B in the PROD IAM
        - path_regex: \.prod\.yaml$
          kms: 'arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod,arn:aws:kms:eu-central-1:361527076523:key/cb1fab90-8d17-42a1-a9d8-334968904f94+arn:aws:iam::361527076523:role/hiera-sops-prod'
          pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'
          hc_vault_uris: "http://localhost:8200/v1/sops/keys/thirdkey"

        # Finally, if the rules above have not matched, this one is a
        # catchall that will encrypt the file using KMS set C and PGP
        # The absence of a path_regex means it will match everything
        - kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:142069644989:key/846cfb17-373d-49b9-8baf-f36b04512e47,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e'
          pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'
```

### Encryption using multiple keys

- By default, sops encrypts the data key for a file with each of the
  master keys, such that if any of the master keys is available, the
  file can be decrypted. However, it is sometimes desirable to require
  access to multiple master keys in order to decrypt files. This can be
  achieved with key groups.

- When using key groups in sops, data keys are split into parts such
  that keys from multiple groups are required to decrypt a file. sops
  uses **Shamir's Secret Sharing** to split the data key such that each
  key group has a fragment, each key in the key group can decrypt that
  fragment, and a configurable number of fragments (threshold) are
  needed to decrypt and piece together the complete data key.

  - When decrypting a file using multiple key groups, sops goes through
    key groups in order, and in each group, tries to recover the
    fragment of the data key using a master key from that group.
  - Once the fragment is recovered, sops moves on to the next group,
    until enough fragments have been recovered to obtain the complete
    data key.

### Output to Files

Use `--output`, for example to output a configuration.yaml to a
temporary file called sops-file.yaml:

`sops --output sops-file.yaml --decrypt configuration.yaml`

### Passing Secrets to Other Processes

In addition to writing secrets to standard output and to files on disk,
sops has two commands for passing decrypted secrets to a new process:
exec-env and exec-file. `exec-file` is appropriate for commands only
operating on files.

``` bash
# print secrets to stdout to confirm values
$ sops -d out.json
{
        "database_password": "jf48t9wfw094gf4nhdf023r",
        "AWS_ACCESS_KEY_ID": "AKIAIOSFODNN7EXAMPLE",
        "AWS_SECRET_KEY": "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

# decrypt out.json and run a command
# the command prints the environment variable and runs a script that uses it
$ sops exec-env out.json 'echo secret: $database_password; ./database-import'
secret: jf48t9wfw094gf4nhdf023r

# launch a shell with the secrets available in its environment
$ sops exec-env out.json 'sh'
sh-3.2# echo $database_password
jf48t9wfw094gf4nhdf023r

# the secret is not accessible anywhere else
sh-3.2$ exit
$ echo your password: $database_password
your password:
```

### Encrypting an existing file

The path points to an existing cleartext file, so we give sops flag -e
to encrypt the file, and redirect the output to a destination file.

``` bash
sops -e /path/to/existing/file.yaml > /path/to/new/encrypted/file.yaml
# Decrypt as normal
sops -d /path/to/new/encrypted/file.yaml

# Encrypt in place
# file.yaml is in cleartext
$ sops -e -i /path/to/existing/file.yaml
# file.yaml is now encrypted
$ sops -d -i /path/to/existing/file.yaml
# file.yaml is back in cleartext
```

### Encrypting only parts of a file

- By default, sops encrypts all the values of a YAML or JSON file and
  leaves the keys in cleartext. In some instances, you may want to
  exclude some values from being encrypted. This can be accomplished by
  several ways:
  - Adding the suffix <sub>unencrypted</sub> to any key of a file. When
    set, all values underneath the key that set the
    <sub>unencrypted</sub> suffix will be left in cleartext.
    - Note that, while in cleartext, unencrypted content is still added
      to the checksum of the file, and thus cannot be modified outside
      of sops without breaking the file integrity check.
    - The unencrypted suffix can be set to a different value using the
      –unencrypted-suffix option.
- Conversely, you can opt in to only encrypt some values in a YAML or
  JSON file, by adding a chosen suffix to those keys and passing it to
  the –encrypted-suffix option.
- Use the –encrypted-regex which will only encrypt values under keys
  that match the supplied regular expression. For example

`sops --encrypt --encrypted-regex '^(data|stringData)$' k8s-secrets.yaml`

will encrypt the values under the `data` and `stringData` keys in a YAML
file containing kubernetes secrets. It will not encrypt other values
that help you to navigate the file, like metadata which contains the
secrets' names.

Similarly, or use the `unencrypted-regex` option:

`sops --encrypt --unencrypted-regex '^(description|metadata)$' k8s-secrets.yaml`

You can also specify these options in the .sops.yaml config file, but
note syntax differences. In sops.yaml, it is `encrypted_regex`.

### Other Features

sops can operate on specific values without an editor
