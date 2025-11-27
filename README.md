# zed-robot

A Zed editor extension aiming to provide comprehensive support for [Robot Framework](https://robotframework.org/).

## Features

This extension enhances your Robot Framework development experience in Zed with:

- **Syntax Highlighting**: Full syntax highlighting for Robot Framework test cases, keywords, and variables
- **Code Folding**: Intelligent code folding for test cases, keywords, and sections

## Installation

1. Install the extension from the Zed extensions marketplace
2. Search for "Robot Framework"
3. Click Install

Alternatively, you can install directly from the extension ID: `robot`

## Usage

Once installed, the extension will automatically activate when you open files with the `.robot` extension.

### Structure

- `languages/robot/`: Language configuration including:
  - `config.toml`: Main language configuration
  - `highlights.scm`: Syntax highlighting rules
  - `folds.scm`: Code folding rules
  - `indents.scm`: Indentation rules

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
