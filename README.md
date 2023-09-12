# pydev

This repository contains a script that BVU students can run to build a Python development environment quickly.  By running the command below (see [Usage](#usage)), the import script will accomplish the following:

1. Setup a virtual environment.
2. Install a Python toolset for linting, type-checking, and unit testing.
3. Create a Makefile to automatically run all of the tools in #2.

## Usage

To install to your development directory, type the following.

```
curl https://raw.githubusercontent.com/jbshep/pydev/main/import.sh | bash
```

Once installed, developers should enter the virtual environment by typing:

```
source env/bin/activate        # if using macOS or Linux
source env/Scripts/activate    # if using Windows
```

And then, once in the virtual environment, all verification checks can be run using the command:

```
make
```

## Installed Tools and Files/Directories

Tools currently installed by the `import.sh` script are:

* [`black`](https://black.readthedocs.io/)
* [`mypy`](https://mypy-lang.org/)
* [`pylint`](https://pypi.org/project/pylint/)
* [`pytest`](https://pytest.org/)

The script will deposit the following files/directories into your current directory:

* a Makefile
* a pylint configuration file (`.pylintrc`)
* `env`: the virtual environment directory

