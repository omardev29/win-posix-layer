# WinPosixLayer - POSIX-like commands for PowerShell on Windows
# Import all function files

$ModuleRoot = $PSScriptRoot

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

# ── Basic Aliases ──────────────────────────────────────────
Set-Alias grep rg -ErrorAction SilentlyContinue
Set-Alias df duf -ErrorAction SilentlyContinue
Set-Alias find fd -ErrorAction SilentlyContinue
Set-Alias poweroff Stop-Computer -ErrorAction SilentlyContinue
Set-Alias reboot Restart-Computer -ErrorAction SilentlyContinue

# Quitar alias de pwsh que interfieren (en scope global)
Remove-Item Alias:ls -ErrorAction SilentlyContinue -Scope Global
Remove-Item Alias:cat -ErrorAction SilentlyContinue -Scope Global
Remove-Item Alias:cd -ErrorAction SilentlyContinue -Scope Global
Remove-Item Alias:rm -ErrorAction SilentlyContinue -Scope Global
Remove-Item Alias:find -ErrorAction SilentlyContinue -Scope Global
