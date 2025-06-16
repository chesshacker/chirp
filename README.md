# CHIRP Project

This is the official git repository for the
__[CHIRP](https://www.chirpmyradio.com)__ project.

When submitting PRs, please see [this file](.github/pull_request_template.md)
for rules and guidelines.

# CHIRP

CHIRP is a free, open-source tool for programming your amateur radio. It supports a large number of manufacturers and models, as well as provides a way to interface with multiple data sources and formats.

## Development Setup on macOS

To set up CHIRP for development:

1. Clone the repository:
   ```bash
   git clone https://github.com/chirp/chirp.git
   cd chirp
   ```

2. Create and activate a Python virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Install CHIRP and its dependencies:
   ```bash
   pip install -e .
   pip install wxPython
   ```

4. Create a macOS application bundle:
   ```bash
   ./create_app.sh
   ```

5. Launch CHIRP:
   - Open the Applications folder
   - Double-click on CHIRP.app

Note: The application bundle is a launcher that points to your development environment. This means:
- Any changes you make to the code will be immediately available when you launch the app
- The virtual environment and source code remain in your development directory
- You can modify the code and test changes without reinstalling

If you need to rebuild the application after making changes:
1. Make sure your virtual environment is activated:
   ```bash
   source venv/bin/activate
   ```
2. Run the create_app.sh script again:
   ```bash
   ./create_app.sh
   ```
