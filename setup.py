#!/usr/bin/env python3
"""
Setup script for ioload
"""

from setuptools import setup, find_packages
from pathlib import Path

# Read the README file
readme_file = Path(__file__).parent / "README.md"
long_description = readme_file.read_text(encoding="utf-8") if readme_file.exists() else ""

setup(
    name="ioload",
    version="1.0.0",
    description="A wrapper for iostat that displays I/O statistics in a real-time chart format",
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="ioload contributors",
    author_email="",
    url="https://github.com/guntanis/ioload",
    py_modules=["ioload"],
    python_requires=">=3.6",
    install_requires=[
        "asciichartpy>=1.5.3",
    ],
    extras_require={
        "dev": [
            "pytest>=7.0.0",
            "black>=22.0.0",
            "flake8>=5.0.0",
            "mypy>=1.0.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "ioload=ioload:cli",
        ],
    },
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: System Administrators",
        "Intended Audience :: Developers",
        "Topic :: System :: Monitoring",
        "Topic :: System :: Systems Administration",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Operating System :: POSIX :: Linux",
        "Operating System :: MacOS",
        "Operating System :: Unix",
        "Environment :: Console :: Curses",
    ],
    keywords="iostat monitoring io statistics terminal curses chart",
    project_urls={
        "Bug Reports": "https://github.com/guntanis/ioload/issues",
        "Source": "https://github.com/guntanis/ioload",
        "Documentation": "https://github.com/guntanis/ioload#readme",
    },
)
