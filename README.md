# WinPosixLayer

A PowerShell 7 module that brings POSIX/Linux-like commands to Windows, making the terminal experience more familiar for Linux users.

## Features

This module provides Linux-style commands and aliases for PowerShell on Windows:

- **`ls`** - Enhanced directory listing using `eza` (with icons and git status)
- **`cat`** - Syntax-highlighted file viewing using `bat`
- **`cd`** - Smart directory navigation with zoxide integration and interactive selector
- **`rm`** - Linux-style remove with recycle bin support and `-r`, `-f` flags
- **`touch`** - Create files or update timestamps
- **`mkdirp`** - Create directories without errors if they exist
- **`head`** / **`tail`** / **`tailf`** - View file contents (beginning, end, or follow)
- **`which`** - Find command sources
- **`ghclone`** - Quick GitHub repository cloning
- **`vz`** - Directory size visualization
- **`spf`** - Superfile file manager integration
- **`..`** / **`...`** - Quick parent directory navigation

### Aliases

- `grep` → `rg` (ripgrep)
- `df` → `duf` (disk usage)
- `poweroff` → `Stop-Computer`
- `reboot` → `Restart-Computer`

## Dependencies

The following external tools are recommended for full functionality:

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| **eza** | Modern `ls` replacement with icons and git support | `choco install eza` or `winget install eza` |
| **bat** | Syntax-highlighted `cat` replacement | `choco install bat` or `winget install bat` |
| **ripgrep (rg)** | Fast text search (for `grep` alias) | `choco install ripgrep` or `winget install ripgrep` |
| **duf** | Modern `df` replacement for disk usage | `choco install duf` or `winget install duf` |
| **zoxide** | Smart directory jumping (for `cd` function) | `choco install zoxide` or `winget install zoxide` |
| **superfile (spf)** | Terminal file manager | `winget install superfile` |

If a dependency is not installed, the module will show a warning but continue to load.

## Installation

### Option 1: Import from local directory

1. Clone or download this repository:
   ```powershell
   git clone https://github.com/omardev29/win-posix-layer.git
   ```

2. Import the module in your PowerShell profile:
   ```powershell
   Import-Module "C:\path\to\win-posix-layer\WinPosixLayer.psd1"
   ```

### Option 2: Add to PowerShell profile (recommended)

Add this line to your PowerShell profile (`$PROFILE`):

```powershell
Import-Module "C:\Users\omaro\Documents\win-posix-layer\WinPosixLayer.psd1"
```

Then reload your profile or restart PowerShell:
```powershell
. $PROFILE
```

### Option 3: Install as a proper PowerShell module

Copy the module to your PowerShell modules directory:

```powershell
$ModulesDir = "$HOME\Documents\PowerShell\Modules\WinPosixLayer"
New-Item -ItemType Directory -Path $ModulesDir -Force
Copy-Item -Path "C:\path\to\win-posix-layer\*" -Destination $ModulesDir -Recurse
```

Then import with just the module name:
```powershell
Import-Module WinPosixLayer
```

## Usage

After importing the module, you can use the POSIX-like commands directly:

```powershell
# List files with icons and git status (requires eza)
ls

# View file with syntax highlighting (requires bat)
cat file.txt

# Smart cd - uses zoxide for smart navigation
cd my-project

# Create file or update timestamp
touch newfile.txt

# Remove file (sends to recycle bin)
rm file.txt

# Force remove directory recursively
rm -rf old-dir

# Quick GitHub clone (defaults to your user)
ghclone my-repo
ghclone otheruser/their-repo

# Navigate up
..    # Goes to parent directory
...   # Goes to grandparent directory

# View file beginning/end
head file.txt
tail file.txt
tailf log.txt  # Follow mode
```

## Module Structure

```
win-posix-layer/
├── WinPosixLayer.psd1          # Module manifest
├── WinPosixLayer.psm1          # Main module file
├── Functions/                   # Individual function files
│   ├── Test-Command.ps1
│   ├── spf.ps1
│   ├── ls.ps1
│   ├── cat.ps1
│   ├── cd.ps1
│   ├── rm.ps1
│   ├── ghclone.ps1
│   ├── dots.ps1
│   ├── touch.ps1
│   ├── mkdirp.ps1
│   ├── head.ps1
│   ├── tail.ps1
│   ├── which.ps1
│   └── vz.ps1
└── README.md
```

## Requirements

- PowerShell 7.0 or higher
- Windows 10/11

## License

MIT License - feel free to modify and distribute.

## Contributing

Pull requests are welcome! If you have suggestions for more POSIX commands or improvements, please open an issue or submit a PR.

## Notes

- The `cd` function requires `zoxide` and `zi` (zoxide interactive) to be installed for full functionality
- The `rm` function sends files to the recycle bin by default (Linux-style safety)
- All functions are designed to be as close as possible to their Linux counterparts while respecting Windows conventions
