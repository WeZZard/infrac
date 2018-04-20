# infrac - Node Manager for Individual Computing Infracstructure

## Install

via curl

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/wezzard/infrac/master/_utils/install.sh)"
```

## Usage

### Initialize a Node

```
infrac init
```

### Invoke Indivudual Infrastructure Utilities

```
#infrac utility UTILITY_NAME

infrac utility set-hostname			# Set hostname

infrac utility ranomize-password	# Generates a random password for the user

infrac utility add-sudoer			# Add sudoers

infrac utility add-sshd-public-key	# Add sshd public key for given users

```

### Services
_Under construction._

### Recipes
_Under construction._

### Show Synopsis
```
infrac
```

## License
[WTF License](http://www.wtfpl.net/about/)