# Project Structure

This document describes the organization of the ioload project.

```
ioload/
├── .github/                  # GitHub configuration
│   ├── ISSUE_TEMPLATE/      # Issue templates
│   └── workflows/           # CI/CD workflows
├── docs/                    # Additional documentation
│   ├── INSTALL.md          # Installation guide
│   ├── EXAMPLES.md         # Usage examples
│   ├── ROADMAP.md          # Future plans
│   └── POPULARITY_CHECKLIST.md  # Growth guide
├── scripts/                 # Installation scripts
│   ├── install.sh          # Unix/macOS/Linux installer
│   └── install.ps1         # Windows installer
├── tests/                   # Test files
│   ├── __init__.py
│   └── test_ioload.py      # Unit tests
├── .gitignore              # Git ignore patterns
├── CHANGELOG.md            # Version history
├── CONTRIBUTING.md         # Contribution guidelines
├── LICENSE                 # MIT License
├── README.md               # Main documentation
├── ioload.py               # Main application (single-file module)
├── pyproject.toml          # Python packaging config
├── requirements.txt        # Python dependencies
└── setup.py                # Package setup for PyPI
```

## Directory Descriptions

### Root Directory
- **ioload.py** - Main application code (single-file module for simplicity)
- **README.md** - Primary documentation and project overview
- **LICENSE** - MIT License
- **CHANGELOG.md** - Version history and release notes
- **CONTRIBUTING.md** - Guidelines for contributors
- **setup.py** - Package configuration for PyPI distribution
- **pyproject.toml** - Modern Python packaging configuration
- **requirements.txt** - Python package dependencies
- **.gitignore** - Git ignore patterns

### `.github/`
GitHub-specific configuration files:
- **ISSUE_TEMPLATE/** - Templates for bug reports and feature requests
- **workflows/** - GitHub Actions CI/CD workflows

### `docs/`
Additional documentation beyond the main README:
- **INSTALL.md** - Detailed installation instructions
- **EXAMPLES.md** - Usage examples and use cases
- **ROADMAP.md** - Planned features and development roadmap
- **POPULARITY_CHECKLIST.md** - Guide for project growth

### `scripts/`
Installation and utility scripts:
- **install.sh** - Automated installer for Unix/macOS/Linux
- **install.ps1** - Automated installer for Windows

### `tests/`
Test files (currently minimal, to be expanded):
- **test_ioload.py** - Unit tests for core functionality

## Design Decisions

### Single-File Module
The main application (`ioload.py`) is kept as a single file for:
- **Simplicity** - Easy to understand and modify
- **Portability** - Single file is easy to distribute
- **Clarity** - All code in one place for a focused tool

If the project grows significantly, we may refactor into a package structure:
```
ioload/
├── ioload/
│   ├── __init__.py
│   ├── monitor.py
│   ├── charts.py
│   └── cli.py
```

### Flat Documentation
Documentation is organized by purpose:
- Root: Essential docs (README, LICENSE, CONTRIBUTING)
- `docs/`: Extended documentation
- Each file has a clear, single purpose

## Future Structure Considerations

As the project grows, we may add:
- `ioload/` - Package directory (if refactoring from single file)
- `examples/` - Example scripts and configurations
- `docs/api/` - API documentation
- `tools/` - Development tools and utilities
- `.github/ISSUE_TEMPLATE/` - Additional issue templates
