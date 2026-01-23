# zed-robot

A Zed editor extension aiming to provide comprehensive support for [Robot Framework](https://robotframework.org/).

## Features

This extension enhances your Robot Framework development experience in Zed with:

- **Syntax Highlighting**: Full syntax highlighting for Robot Framework test cases, keywords, and variables
- **Code Folding**: Intelligent code folding for test cases, keywords, and sections
- **Language Server**: [Robocorp language server](https://github.com/robocorp/robotframework-lsp/tree/master/robotframework-ls) integration

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
- `src/lib.rs`: Language server integration

### Configuration

To install the Robot Framework Language Server, run the following command:
```bash
pip install robotframework-lsp
```

To customize the language server settings in your `.zed/settings.json` and run
it from a virtual environment (`venv`), update the configuration as shown below.
This also includes specific settings for the language server (for more details,
refer to the [Robot Framework Language Server documentation](https://github.com/robocorp/robotframework-lsp/blob/master/robotframework-ls/docs/config.md)):
```json
{
  "lsp": {
    "robot": {
      "binary": {
        "path": "venv/bin/robotframework_ls",
        "arguments": ["-v"],
      },
      "settings": {
        "robot.variables": { "EXECDIR": "${workspaceFolder}" },
      },
    },
  },
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
