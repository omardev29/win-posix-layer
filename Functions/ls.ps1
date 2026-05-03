if (Test-Command eza){
    function ls { eza --icons --git -l $args }
} else {
    Write-Warning "eza is not installed, install it with scoop install eza"
}
