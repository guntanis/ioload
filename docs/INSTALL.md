# Installation Guide

## Quick Install

**One-liner:**
```bash
curl -fsSL https://raw.githubusercontent.com/guntanis/ioload/main/scripts/install.sh | bash
```

**Or step by step:**
```bash
# Download the installer
curl -fsSL https://raw.githubusercontent.com/guntanis/ioload/main/scripts/install.sh -o install.sh

# Make it executable
chmod +x install.sh

# Run it
./install.sh
```

## What the Installer Does

1. ✅ Checks for Python 3.8+
2. ✅ Checks for pip
3. ✅ Checks for iostat (warns if not found)
4. ✅ Downloads `ioload.py` to `~/.local/bin/`
5. ✅ Installs Python dependencies (`asciichartpy`)
6. ✅ Makes the script executable
7. ✅ Adds installation directory to PATH (with your permission)

## Manual Installation

If you prefer to install manually:

1. **Install Python 3.8+** from [python.org](https://www.python.org/downloads/)

2. **Install dependencies:**
   ```bash
   pip install asciichartpy
   ```

3. **Install iostat:**
   - macOS: `brew install sysstat`
   - Ubuntu/Debian: `sudo apt-get install sysstat`
   - RHEL/CentOS: `sudo yum install sysstat`

4. **Download ioload.py:**
   ```bash
   curl -fsSL https://raw.githubusercontent.com/yourusername/ioload/main/ioload.py -o ioload.py
   chmod +x ioload.py
   ```

5. **Run it:**
   ```bash
   ./ioload.py
   ```

## Troubleshooting

### "Command not found: ioload.py"

The installer adds `~/.local/bin` to your PATH. If it's not working:

1. **Check if it's in PATH:**
   ```bash
   echo $PATH | grep -q ".local/bin" && echo "In PATH" || echo "Not in PATH"
   ```

2. **Add it manually:**
   ```bash
   echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc  # or ~/.zshrc
   source ~/.bashrc  # or source ~/.zshrc
   ```

3. **Or run directly:**
   ```bash
   ~/.local/bin/ioload.py
   ```

### "iostat: command not found"

Install the `sysstat` package for your system. See step 3 in Manual Installation above.

### "ModuleNotFoundError: No module named 'asciichartpy'"

Install the dependency:
```bash
pip install asciichartpy
```

Or use the installer which handles this automatically.

## Updating

To update ioload, simply re-run the installer:
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/ioload/main/install.sh | bash
```

The installer will overwrite the existing installation with the latest version.
