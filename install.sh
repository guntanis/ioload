#!/bin/bash
#
# ioload Installation Script
# This script installs ioload and its dependencies
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Installation directory
INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_NAME="ioload.py"
INSTALL_PATH="${INSTALL_DIR}/${SCRIPT_NAME}"

# GitHub repository
GITHUB_REPO="guntanis/ioload"
GITHUB_RAW_BASE="https://raw.githubusercontent.com/${GITHUB_REPO}/main"
SCRIPT_PATH="scripts/install.sh"
MAIN_SCRIPT="ioload.py"

echo -e "${GREEN}ioload Installation Script${NC}"
echo "================================"
echo ""

# Check for Python 3
echo -n "Checking for Python 3... "
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
    echo -e "${GREEN}✓${NC} Found: $PYTHON_VERSION"
else
    echo -e "${RED}✗${NC} Python 3 not found!"
    echo "Please install Python 3.6 or higher and try again."
    exit 1
fi

# Check Python version (3.6+)
PYTHON_MAJOR=$(python3 -c 'import sys; print(sys.version_info.major)')
PYTHON_MINOR=$(python3 -c 'import sys; print(sys.version_info.minor)')
if [ "$PYTHON_MAJOR" -lt 3 ] || ([ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -lt 6 ]); then
    echo -e "${RED}✗${NC} Python 3.6 or higher is required. Found: $PYTHON_VERSION"
    exit 1
fi

# Check for pip
echo -n "Checking for pip... "
if command -v pip3 &> /dev/null; then
    echo -e "${GREEN}✓${NC}"
    PIP_CMD="pip3"
elif python3 -m pip --version &> /dev/null; then
    echo -e "${GREEN}✓${NC}"
    PIP_CMD="python3 -m pip"
else
    echo -e "${YELLOW}⚠${NC} pip not found. Attempting to install..."
    python3 -m ensurepip --upgrade || {
        echo -e "${RED}✗${NC} Could not install pip. Please install pip manually."
        exit 1
    }
    PIP_CMD="python3 -m pip"
fi

# Check for iostat
echo -n "Checking for iostat... "
if command -v iostat &> /dev/null; then
    echo -e "${GREEN}✓${NC}"
else
    echo -e "${YELLOW}⚠${NC} iostat not found."
    echo "  On macOS: brew install sysstat"
    echo "  On Ubuntu/Debian: sudo apt-get install sysstat"
    echo "  On RHEL/CentOS: sudo yum install sysstat"
    echo ""
    read -p "Continue anyway? (iostat will be required to run ioload) [y/N]: " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create installation directory
echo -n "Creating installation directory... "
mkdir -p "$INSTALL_DIR"
echo -e "${GREEN}✓${NC} $INSTALL_DIR"

# Download ioload.py
echo -n "Downloading ioload.py... "
if [ -f "$SCRIPT_NAME" ]; then
    # If script exists in current directory, use it
    cp "$SCRIPT_NAME" "$INSTALL_PATH"
    echo -e "${GREEN}✓${NC} Using local file"
else
    # Try to download from GitHub
    if command -v curl &> /dev/null; then
        curl -sSL "${GITHUB_RAW_BASE}/${SCRIPT_NAME}" -o "$INSTALL_PATH" || {
            echo -e "${RED}✗${NC} Failed to download from GitHub"
            echo "Please download ioload.py manually and place it in the current directory, then run this script again."
            exit 1
        }
    elif command -v wget &> /dev/null; then
        wget -q "${GITHUB_RAW_BASE}/${SCRIPT_NAME}" -O "$INSTALL_PATH" || {
            echo -e "${RED}✗${NC} Failed to download from GitHub"
            echo "Please download ioload.py manually and place it in the current directory, then run this script again."
            exit 1
        }
    else
        echo -e "${RED}✗${NC} Neither curl nor wget found. Cannot download."
        echo "Please download ioload.py manually and place it in the current directory, then run this script again."
        exit 1
    fi
    echo -e "${GREEN}✓${NC}"
fi

# Make script executable
chmod +x "$INSTALL_PATH"
echo -e "${GREEN}✓${NC} Made executable"

# Install Python dependencies
echo -n "Installing Python dependencies... "
if [ -f "requirements.txt" ]; then
    $PIP_CMD install --user -q -r requirements.txt
else
    $PIP_CMD install --user -q asciichartpy
fi
echo -e "${GREEN}✓${NC}"

# Check if INSTALL_DIR is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo -e "${YELLOW}⚠${NC} $INSTALL_DIR is not in your PATH"
    echo ""
    echo "Add this line to your shell configuration file (~/.bashrc, ~/.zshrc, etc.):"
    echo -e "${GREEN}export PATH=\"\$PATH:$INSTALL_DIR\"${NC}"
    echo ""
    read -p "Would you like to add it now? [y/N]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        SHELL_RC=""
        if [ -f "$HOME/.zshrc" ]; then
            SHELL_RC="$HOME/.zshrc"
        elif [ -f "$HOME/.bashrc" ]; then
            SHELL_RC="$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
            SHELL_RC="$HOME/.bash_profile"
        fi
        
        if [ -n "$SHELL_RC" ]; then
            if ! grep -q "$INSTALL_DIR" "$SHELL_RC"; then
                echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$SHELL_RC"
                echo -e "${GREEN}✓${NC} Added to $SHELL_RC"
                echo "Please run: source $SHELL_RC"
            else
                echo -e "${GREEN}✓${NC} Already in $SHELL_RC"
            fi
        else
            echo -e "${YELLOW}⚠${NC} Could not detect shell configuration file. Please add manually."
        fi
    fi
else
    echo -e "${GREEN}✓${NC} $INSTALL_DIR is in PATH"
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "You can now run ioload with:"
echo "  ioload.py"
echo ""
echo "Or with a custom refresh interval:"
echo "  ioload.py -i 0.5"
echo ""
