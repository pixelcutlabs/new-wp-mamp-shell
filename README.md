New MAMP [Perfect Setup](https://bitbucket.org/tribeswell-llc/perfect-setup) Install via Shell
===

Roll a new [Perfect Setup](https://bitbucket.org/tribeswell-llc/perfect-setup) installation for MAMP PRO with this quick shell script.

Assuming you have MAMP installed in `/Applications/MAMP/`, you put all of your sites in `~/Sites/`, you have your Apache port set to `7888`, you are a member of the `tribeswell-llc` team on BitBucket, and you are using MAMP PRO:

1. Download the shell script. Copy it to your home directory.
1. Run `./perfect_setup.sh` from your home directory in Terminal.
1. Answer the prompts until the project starts cloning.
1. Add your host in MAMP PRO while the project is cloning, and map it to the newly created directory in `~/Sites/`.
1. Make sure Apache and MySQL are both turned on.
1. Answer moar prompts.
1. Done!