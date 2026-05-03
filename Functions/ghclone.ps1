function ghclone {
    param(
        [string]$repo,
        [string]$user = "omardev29"  # github user
    )

    # Si el repo ya tiene "/" asume que pusiste usuario/repo
    if ($repo -match "/") {
        git clone "https://github.com/$repo"
    } else {
        git clone "https://github.com/$user/$repo"
    }
}
