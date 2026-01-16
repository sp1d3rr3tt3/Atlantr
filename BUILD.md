# Building Atlantr

This document describes how to build Atlantr IMAP Checker.

## Prerequisites

- Python 3.x
- pip (Python package manager)

## Important Note

The code has been updated for Python 3 compatibility. The main changes include:
- Converted `print` statements to `print()` functions
- Replaced `xrange` with `range`
- Updated `.iteritems()` to `.items()`
- Removed deprecated `compiler` module import

The original Python 2.7 code is backed up as `3.0/atr3.py.backup`.

## Quick Build

### Linux/Mac

```bash
# Option 1: Using the build script
./build.sh

# Option 2: Using Make
make build

# Option 3: Manual build
pip3 install -r requirements.txt
pip3 install pyinstaller
pyinstaller --clean atlantr.spec
```

### Windows

```batch
# Option 1: Using the build script
build.bat

# Option 2: Manual build
pip install -r requirements.txt
pip install pyinstaller
pyinstaller --clean atlantr.spec
```

## Build Output

After building, you will find the executable in the `dist/` directory:
- Linux/Mac: `dist/atlantr`
- Windows: `dist/atlantr.exe`

## Dependencies

The following dependencies are required and will be installed automatically:
- gevent - For asynchronous networking
- tqdm - For progress bars

## Build Configuration

The build configuration is defined in `atlantr.spec`. This file:
- Specifies the main script (`3.0/atr3.py`)
- Includes data files (`hoster.dat`, `matchers.dat`)
- Configures the executable name and options

## Running from Source

If you prefer to run Atlantr from source without building:

```bash
cd 3.0
python3 atr3.py --help
```

## Troubleshooting

### Missing Dependencies

If you encounter missing dependencies:
```bash
pip3 install -r requirements.txt
```

### PyInstaller Not Found

Install PyInstaller:
```bash
pip3 install pyinstaller
```

### Python 2.7 Issues

Note: The original code was written for Python 2.7. While the build system uses Python 3, you may need to update the source code to be fully Python 3 compatible. Common issues include:
- `print` statements need parentheses
- `xrange` should be `range`
- String encoding differences

## Clean Build

To clean all build artifacts:

```bash
# Using Make
make clean

# Manual
rm -rf build/ dist/
```

## Advanced Build Options

You can customize the build by editing `atlantr.spec`:
- Change the executable name
- Add/remove data files
- Adjust compression settings
- Configure bundling options

See the [PyInstaller documentation](https://pyinstaller.readthedocs.io/) for more details.
