# ioload Installation Script for Windows
# PowerShell script to install ioload on Windows
#

$ErrorActionPreference = "Stop"

Write-Host "ioload Installation Script" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""

# Installation directory
$InstallDir = "$env:USERPROFILE\AppData\Local\Programs\ioload"
$ScriptName = "ioload.py"
$InstallPath = Join-Path $InstallDir $ScriptName

# GitHub repository
$GitHubRepo = "guntanis/ioload"
$GitHubRawBase = "https://raw.githubusercontent.com/$GitHubRepo/main"

# Check for Python 3
Write-Host "Checking for Python 3... " -NoNewline
try {
    $pythonVersion = python --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Found: $pythonVersion" -ForegroundColor Green
    } else {
        throw "Python not found"
    }
} catch {
    Write-Host "✗ Python 3 not found!" -ForegroundColor Red
    Write-Host "Please install Python 3.6 or higher from https://www.python.org/downloads/"
    exit 1
}

# Check Python version
$pythonMajor = python -c "import sys; print(sys.version_info.major)"
$pythonMinor = python -c "import sys; print(sys.version_info.minor)"
if (($pythonMajor -lt 3) -or (($pythonMajor -eq 3) -and ($pythonMinor -lt 6))) {
    Write-Host "✗ Python 3.6 or higher is required. Found: $pythonVersion" -ForegroundColor Red
    exit 1
}

# Check for pip
Write-Host "Checking for pip... " -NoNewline
try {
    python -m pip --version | Out-Null
    Write-Host "✓" -ForegroundColor Green
    $pipCmd = "python -m pip"
} catch {
    Write-Host "⚠ pip not found. Attempting to install..." -ForegroundColor Yellow
    python -m ensurepip --upgrade
    $pipCmd = "python -m pip"
}

# Create installation directory
Write-Host "Creating installation directory... " -NoNewline
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
Write-Host "✓ $InstallDir" -ForegroundColor Green

# Download ioload.py
Write-Host "Downloading ioload.py... " -NoNewline
if (Test-Path $ScriptName) {
    Copy-Item $ScriptName $InstallPath
    Write-Host "✓ Using local file" -ForegroundColor Green
} else {
    try {
        # Download from root directory of repo
        Invoke-WebRequest -Uri "$GitHubRawBase/$ScriptName" -OutFile $InstallPath -UseBasicParsing
        Write-Host "✓" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to download from GitHub" -ForegroundColor Red
        Write-Host "Please download ioload.py manually and place it in the current directory, then run this script again."
        exit 1
    }
}

# Install Python dependencies
Write-Host "Installing Python dependencies... " -NoNewline
if (Test-Path "requirements.txt") {
    python -m pip install --user -q -r requirements.txt
} else {
    python -m pip install --user -q asciichartpy
}
Write-Host "✓" -ForegroundColor Green

# Add to PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$InstallDir*") {
    Write-Host ""
    Write-Host "⚠ $InstallDir is not in your PATH" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Would you like to add it now? [Y/N]: " -NoNewline
    $response = Read-Host
    if ($response -eq "Y" -or $response -eq "y") {
        [Environment]::SetEnvironmentVariable("Path", "$userPath;$InstallDir", "User")
        Write-Host "✓ Added to PATH" -ForegroundColor Green
        Write-Host "Please restart your terminal for changes to take effect."
    }
} else {
    Write-Host "✓ $InstallDir is in PATH" -ForegroundColor Green
}

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "You can now run ioload with:"
Write-Host "  ioload.py"
Write-Host ""
Write-Host "Or with a custom refresh interval:"
Write-Host "  ioload.py -i 0.5"
Write-Host ""
