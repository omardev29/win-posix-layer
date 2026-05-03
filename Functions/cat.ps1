if (Test-Command bat){
    function cat { bat --paging=never $args }
} else {
    Write-Warning "bat is not installed, install it with scoop install bat"
}
