# WinPosixLayer - POSIX-like commands for PowerShell on Windows
# Import all function files

$ModuleRoot = $PSScriptRoot

# Quitar alias de pwsh que interfieren
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:cat -ErrorAction SilentlyContinue
Remove-Item Alias:cd -ErrorAction SilentlyContinue
Remove-Item Alias:rm -ErrorAction SilentlyContinue
Remove-Item Alias:find -ErrorAction SilentlyContinue

# ── Basic Aliases ──────────────────────────────────────────
Set-Alias grep rg -ErrorAction SilentlyContinue
Set-Alias df duf -ErrorAction SilentlyContinue
Set-Alias find fd -ErrorAction SilentlyContinue
Set-Alias poweroff Stop-Computer -ErrorAction SilentlyContinue
Set-Alias reboot Restart-Computer -ErrorAction SilentlyContinue

# Import helper function first
. "$ModuleRoot\Functions\Test-Command.ps1"

# Import all functions
. "$ModuleRoot\Functions\spf.ps1"
. "$ModuleRoot\Functions\ls.ps1"
. "$ModuleRoot\Functions\cat.ps1"
. "$ModuleRoot\Functions\cd.ps1"
. "$ModuleRoot\Functions\rm.ps1"
. "$ModuleRoot\Functions\ghclone.ps1"
. "$ModuleRoot\Functions\dots.ps1"
. "$ModuleRoot\Functions\touch.ps1"
. "$ModuleRoot\Functions\mkdirp.ps1"
. "$ModuleRoot\Functions\head.ps1"
. "$ModuleRoot\Functions\tail.ps1"
. "$ModuleRoot\Functions\which.ps1"
. "$ModuleRoot\Functions\vz.ps1"
