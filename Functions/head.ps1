function head {
    param($file, $n = 10)
    Get-Content $file | Select-Object -First $n
}
