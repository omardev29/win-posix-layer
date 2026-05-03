# mkdir -p - does not fail if already exists
function mkdirp {
    param($path)
    New-Item -ItemType Directory -Path $path -Force | Out-Null
}
