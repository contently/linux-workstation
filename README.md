# linux-workstation

## Setup Instructions

Ensure you are in your home directory:
```bash
$ cd ~
```
TODO: create DNS record that points to the below link? `dev.contently.com`?

Download setup script:
```bash
$ wget -O Downloads/setup-linux-workstation.sh https://github.com/contently/linux-workstation/releases/latest/download/setup-linux-workstation.sh
```

Make script executable:
```bash
$ chmod +x ./Downloads/setup-linux-workstation.sh
```

Execute script:
```bash
$ ./Downloads/setup-linux-workstation.sh
```
_note_: you will need to enter a "password" multiple times, this needs to be the root password for your machine.

## Development and Release

_TODO_: setup and document a proper workflow with pull requests and reviews.

Clone the repository locally:
```bash
$ git clone git@github.com:contently/linux-workstation.git
```

Make whatever changes are neccessary.

Update the 'version' attribute in `chef/metadata.rb` to have the correct, new semantic version.

Add and review the altered files:
```bash
$ git add .
```

Add a commit message which includes the semantic version number of the release used in the prior step, e.g.:
```bash
$ git commit -m 'Update apt sources
v0.11.0'
```

Add a git tag with the semantic version number of the release used in the prior steps:
```bash
$ git tag v0.11.0
```

Push your changes to github:
```bash
$ git push origin master
$ git push --tags
```

Draft a new release by visiting:
```bash
https://github.com/contently/linux-workstation/releases/new
```

The tag version and release title should both be the semantic version of the release.

The description of the release should include the detailed notes of the git commit related to the release.

Click on "Attach binaries by dropping them here or selecting them." and select the `bin/setup-linux-workstation.sh`
file included in your current branch/release.

Click "Publish release" and you are done!
