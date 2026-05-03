if (Test-Command eza){
    function ls { eza --icons --git -l $args }
} else {
    Write-Warning "eza no esta instalado, instalalo con choco install eza"
}
