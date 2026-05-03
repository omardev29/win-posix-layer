if (Test-Command bat){
    function cat { bat --paging=never $args }
} else {
    Write-Warning "bat no esta instalado, instalalo con choco install bat"
}
