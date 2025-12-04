# Installation Scripts

This directory contains installation scripts for different platforms.

## Files

- **install.sh** - Installation script for Unix/macOS/Linux
- **install.ps1** - Installation script for Windows (PowerShell)

## Usage

See the main [INSTALL.md](../docs/INSTALL.md) for usage instructions.

These scripts can be downloaded and run directly:

```bash
# Unix/macOS/Linux
curl -fsSL https://raw.githubusercontent.com/guntanis/ioload/main/scripts/install.sh | bash

# Windows
Invoke-WebRequest -Uri https://raw.githubusercontent.com/guntanis/ioload/main/scripts/install.ps1 -OutFile install.ps1; .\install.ps1
```
