# tail - last N lines
function tail {
    param($file, $n = 10)
    Get-Content $file | Select-Object -Last $n
}

# tail -f - real-time follow
function tailf {
    param($file)
    Get-Content $file -Wait
}
