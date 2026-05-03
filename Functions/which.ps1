function which {
    param($cmd)
    (Get-Command $cmd).Source
}
