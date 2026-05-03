function ghclone {
    param(
        [string]$repo,
        [string]$user = "omardev29"  # github user
    )

    # If repo already contains "/", assumes user/repo format
    if ($repo -match "/") {
        git clone "https://github.com/$repo"
    } else {
        git clone "https://github.com/$user/$repo"
    }
}
