# Contributing to ioload

Thank you for your interest in contributing to ioload! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/guntanis/ioload/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs actual behavior
   - System information (OS, Python version, etc.)
   - Screenshots if applicable

### Suggesting Features

1. Check existing issues and discussions
2. Open an issue with:
   - Clear description of the feature
   - Use case and motivation
   - Potential implementation approach (if you have ideas)

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**:
   - Follow the code style (see below)
   - Add tests if applicable
   - Update documentation
4. **Test your changes**: Ensure the code works on your system
5. **Commit your changes**: Use clear, descriptive commit messages
6. **Push to your fork**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**: Provide a clear description of changes

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/ioload.git
cd ioload

# Install dependencies
pip install -r requirements.txt

# Install development dependencies (if any)
pip install pytest black mypy  # Optional: for testing and linting
```

## Code Style

- Follow PEP 8 style guide
- Use type hints where appropriate
- Write docstrings for functions and classes
- Keep functions focused and small
- Add comments for complex logic

## Testing

Before submitting a PR, please:
- Test on your system
- Test with different terminal sizes
- Test with different refresh intervals
- Verify error handling works correctly

## Commit Messages

Use clear, descriptive commit messages:
- `Add feature: support for custom color schemes`
- `Fix: handle terminal resize correctly`
- `Docs: update installation instructions`

## Questions?

Feel free to open an issue for questions or discussions!
