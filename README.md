# New MAMP [Perfect Setup](https://bitbucket.org/tribeswell-llc/perfect-setup) Install via Shell

Roll a new [Perfect Setup](https://bitbucket.org/tribeswell-llc/perfect-setup) installation for MAMP PRO with this quick shell script.

### Prerequisites

1. You must have MAMP installed in `/Applications/MAMP/`.
1. You must have your Apache port set to `7888`.
1. You must put all of your sites in `~/Sites/`. If this directory does not exist, create it now.
1. You must be a member of the `tribeswell-llc` team on BitBucket.
1. You must be using MAMP PRO.

### Instructions

1. Download the latest version of the shell script ([there's a version number at the top](https://github.com/zackphilipps/new-wp-mamp-shell/blob/master/perfect_setup.sh)). Copy it to your home directory. Make it executable, i.e. `chmod +x ./perfect_setup.sh`.
1. Make sure Apache and MySQL are both turned on in MAMP PRO.
1. Run `./perfect_setup.sh` from your home directory in Terminal.
1. Answer the prompts until the project starts cloning.
	1. If you created a brand new repo, answer `perfect-setup` to the first question and the name of your repo to the second.
	1. If someone else created the repo, answer the name of the repo to the first and accept the default for the second.
1. Wait until the script finishes and displays no error messages.
1. Add your host in MAMP PRO and map it to the newly created directory in `~/Sites/`.
1. Done!