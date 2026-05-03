function tail {
    param($file, $n = 10)
    Get-Content $file | Select-Object -Last $n
}

function tailf {
    param($file)
    Get-Content $file -Wait
}
