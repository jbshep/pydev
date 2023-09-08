# pydev

BVU students can use this repository to build their own quick Python development environment quickly.  By running the command below, the import script will accomplish the following:

1. Setup a virtual environment.
2. Install a Python toolset for linting, type-checking, and unit testing.
3. Create a Makefile to automatically run all of the tools in #2.

## Usage

To install to your development directory, type the following.

```
curl https://raw.githubusercontent.com/jbshep/pydev/main/import.sh | bash
```

All verification checks can be run using the command `make all`.

## Current Tools

Tools currently installed by the `import.sh` script are `black`, `mypy`, `pylint`, and `pytest`.  The script generates a Makefile and a pylint configuration file.
