# Enhanced which
function which {
    param($cmd)
    (Get-Command $cmd).Source
}
