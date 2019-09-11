# linux-workstation

## Setup Instructions



Download setup script:
TODO: create DNS record that points to the below link? `dev.contently.com`?
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

Run the chef script in the cloned linux-workstation directory (e.g. ~/Projects/linux-workstation)

Make sure that you are the owner of all of the files in your home directory before running this.
```bash
$ ~/Projects/linux-workstation/bin/chef-up.sh
``` 

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

## Troubleshooting

* Can't boot from USB - Enter BIOS and disable "Secure boot" under "Security"
* Boots from USB but install goes to black screen - Enter BIOS and under Startup enable CSM
* WiFi isn't working - Check your kernel version. I had to upgrade to 4.19 to get firmware support
* Ruby isn't installing - For v2.3.8 try `sudo apt-get install libssl1.0-dev`
* VPN is working for network locations but nothing else - update settings under IPv4 and IPv6. Toggle on "Use this connection only for resources on this network"
* `docker-compose up` from the platform fails to boot postgres - by default the installed version of postgress starts on boot. `sudo vim /etc/postgresql/9.6/main/start.conf` change `auto` to `manual` and `ps aux | postgres` to find the PID to kill or reboot.

