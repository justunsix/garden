---
filetags: ":snippets:sops:secrets-operations:epubnote:"
id: b00b9f8a-3711-4864-8878-4f908f590874
title: SOPS Secrets OPerations Snippets
---

See [SOPS: Secrets OPerationS \| SOPS: Secrets
OPerationS](https://getsops.io/docs/) Documentation for more specific
examples with AWS KMS, PGP, GPG, GCP KMS, Azure Key Vault, `yaml` file
configuration, and results of encryption on key value pairs. Each key
and/or encryption provider will have different settings like AWS
accounts and roles.

## Environment Settings

``` shell

# Environment variable settings, set keys
## AWS KMS - Export key using SOPS_KMS_ARN environment variable
export SOPS_KMS_ARN="arn:aws:kms:us-east-1:656532927350:key/920aff2e-c5f1-4040-943a-047fa387b27e,arn:aws:kms:ap-southeast-1:656532927350:key/9006a8aa-0fa6-4c14-930e-a2dfb916de1d"

## PGP - export fingerprints of the public keys, comma separated
export SOPS_PGP_FP="85D77543B3D624B63CEA9E6DBC17301B491B3F21,E60892BB9BD89A69F759A1A0A3D652173B763E8F"

## GCP KMS
export SOPS_GCP_KMS_IDS="...."

## Set GPG Executable
export SOPS_GPG_EXEC="your_gpg_client_wrapper"
### Set GPG Executable in Nushell for msys2 Windows C Drive
$env.SOPS_GPG_EXEC = 'gpg --homedir /c/.gnupg'

```

## Decryption and Secrets Usage

``` shell

# Create or Edit file in place with encryption and decryption, sops will using $EDITOR environment variable for editing or command flags for configuration
sops edit testfile.yaml

# Set order in which available decryption methods are tried
# can be specified with --decryption-order option or SOPS_DECRYPTION_ORDER environment variable
# The default is below
sops --decryption-order age,pgp

# Decrypt files (all key providers)
sops decrypt testfile.yaml
# Decrypt file and output like cat with -d
sops -d testfile.yaml
# Decrypt binary files
sops decrypt -i /tmp/somerandom

# GPG Add key, edit file
## Add test key and data from sops repo
git clone --depth 1 --filter=blob:none https://github.com/getsops/sops.git
cd sops
gpg --import pgp/sops_functional_tests_key.asc
sops edit example.yaml

```

## Encryption

``` shell

# Using AWS KMS
## Set AWS KMS environment variables
sops edit testfile.yaml
sops encrypt --kms testfile.yaml

# AWS KMS and PGP
sops edit --kms "arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500" --pgp C9CAB0AF1165060DB58D6D6B2653B624D620786D /path/to/new/file.yaml

# Using Age, recommended over PGP
sops encrypt --age age1yt3tfqlfrwdwx0z0ynwplcr6qxcxfaqycuprpmy89nr83ltx74tqdpszlw test.yaml > test.enc.yaml

# Using pgp
sop encrypt --pgp testfile.yaml

# Using GCP KMS
## Log into Google cloud and get KMS ResourceID
sops encrypt --gcp-kms projects/my-project/locations/global/keyRings/sops/cryptoKeys/sops-key test.yaml > test.enc.yaml

# Using Azure Key Vault (KV)
## Log into Azure and get resource identifier
sops encrypt --azure-kv https://sops.vault.azure.net/keys/sops-key/some-string test.yaml > test.enc.yaml

# Using sop output in other programs
## Linux only, for Windows use named pipes
cat encrypted-data | sops decrypt /dev/stdin > decrypted-data
## Specify data type during operations
cat encrypted-data | sops decrypt --input-type yaml --output-type yaml /dev/stdin > decrypted-data
## Tell sops which filename to use to match creation rules with --filename-override
echo 'foo: bar' | sops encrypt --filename-override path/filename.sops.yaml /dev/stdin > encrypted-data

# Using Hashcorp Vault
## Set vault environment variables and enable transit engine and keys
sops encrypt --hc-vault-transit $VAULT_ADDR/v1/sops/keys/firstkey vault_example.yml

# Encrypting binary files
sops encrypt -i /tmp/somerandom
## -i encrypt in place
# Encrypt binaryfile with output
sops encrypt inputfile --output output.sops

```

## Key Management

``` shell

# Add or remove and update keys based on .sops.yaml configuration file changes
## Use add and remove keys with --add-kms, --add-pgp, --add-gcp-kms, --add-azure-kv, --rm-kms, --rm-pgp, --rm-gcp-kms and --rm-azure-kv can be used to add and remove keys from a file
sops updatekeys test.enc.yaml

# Edit and display master keys with -s
sops edit -s testfile.yaml

# Rotate keys and write the rotated file back with -i
sops rotate -i example.yaml
## sops will reencrypt the file with a new data key, which is then encrypted with the various KMS and PGP master keys defined in the file

## Add a new pgp key to the file and rotate the data key
sops rotate -i --add-pgp 85D77543B3D624B63CEA9E6DBC17301B491B3F21 example.yaml

## Remove a pgp key from the file and rotate the data key
sops rotate -i --rm-pgp 85D77543B3D624B63CEA9E6DBC17301B491B3F21 example.yaml

# Key groups - Add a new key group with 3 PGP keys and 3 KMS keys to the file my_file.yaml
sops groups add --file my_file.yaml --pgp fingerprint1 --pgp fingerprint2 --pgp fingerprint3 --kms arn1 --kms arn2 --kms arn3

# Key group - delete group 0 from file
sops groups delete --file my_file.yaml 0

# Start SOPS keyservice for local keys
sops keyservice

```

## .sops.yaml configuration file

> Note that the configuration file is ignored when KMS or PGP parameters
> are passed on the SOPS command line or in environment variables.
>
> \[…\]
>
> SOPS will recursively look for a `.sops.yaml` file. If one is found,
> the filename of the file being created is compared with the filename
> regexes of the configuration file. The first regex that matches is
> selected, and its KMS and PGP keys are used to encrypt the file. It
> should be noted that the looking up of `.sops.yaml` is from the
> working directory (CWD) instead of the directory of the encrypting
> file.

``` yaml

# creation rules are evaluated sequentially, the first match wins
creation_rules:
    # upon creation of a file that matches the pattern *.dev.yaml,
    # KMS set A as well as PGP and age is used
    - path_regex: \.dev\.yaml$
      kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'
      age: 'age129h70qwx39k7h5x6l9hg566nwm53527zvamre8vep9e3plsm44uqgy8gla'

    # prod files use KMS set B in the PROD IAM, PGP and age
    - path_regex: \.prod\.yaml$
      kms: 'arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod,arn:aws:kms:eu-central-1:361527076523:key/cb1fab90-8d17-42a1-a9d8-334968904f94+arn:aws:iam::361527076523:role/hiera-sops-prod'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'
      age: 'age129h70qwx39k7h5x6l9hg566nwm53527zvamre8vep9e3plsm44uqgy8gla'
      hc_vault_uris: "http://localhost:8200/v1/sops/keys/thirdkey"

    # gcp files using GCP KMS
    - path_regex: \.gcp\.yaml$
      gcp_kms: projects/mygcproject/locations/global/keyRings/mykeyring/cryptoKeys/thekey

    # Finally, if the rules above have not matched, this one is a
    # catchall that will encrypt the file using KMS set C as well as PGP
    # The absence of a path_regex means it will match everything
    - kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:142069644989:key/846cfb17-373d-49b9-8baf-f36b04512e47,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'

```

``` yaml

# Use only PGP with the public key generated by GPG listed below
creation_rules:
    - pgp: >-
        A2B73FB4DA0891B38EECD35B47991CD146C9C4BC

```

Folder specific configurations and catch all for all other files and
auditing

``` yaml

# .sops.yaml

creation_rules:
    # upon creation of a file under development,
    # KMS set A is used
    - path_regex: .*/development/.*
      kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'

    # prod files use KMS set B in the PROD IAM
    - path_regex: .*/production/.*
      kms: 'arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e+arn:aws:iam::361527076523:role/hiera-sops-prod,arn:aws:kms:eu-central-1:361527076523:key/cb1fab90-8d17-42a1-a9d8-334968904f94+arn:aws:iam::361527076523:role/hiera-sops-prod'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'

    # other files use KMS set C
    - kms: 'arn:aws:kms:us-west-2:927034868273:key/fe86dd69-4132-404c-ab86-4269956b4500,arn:aws:kms:us-west-2:142069644989:key/846cfb17-373d-49b9-8baf-f36b04512e47,arn:aws:kms:us-west-2:361527076523:key/5052f06a-5d3f-489e-b86c-57201e06f31e'
      pgp: 'FBC7B9E2A4F9289AC0C1D4843D16CEE4A27381B4'

---

# /etc/sops/audit.yaml

# Enable auditing to a PostgreSQL database named sops running on localhost, using the user sops and the password sops
backends:
    postgres:
        - connection_string: "postgres://sops:sops@localhost/sops?sslmode=verify-full"


```

## See Also

### Resources

- [GitHub - getsops/sops: Simple and flexible tool for managing
  secrets](https://github.com/getsops/sops?tab=readme-ov-file#2usage)
- [SOPS: Secrets OPerationS \| SOPS: Secrets
  OPerationS](https://getsops.io/docs/) Documentation
