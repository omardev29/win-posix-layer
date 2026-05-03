function cd {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$args
    )

    # Sin argumentos → selector interactivo
    if ($args.Count -eq 0) {
        zi
        return
    }

    # Casos clásicos que deben seguir funcionando
    if ($args[0] -in @(".", "..", "-", "~") -or (Test-Path $args[0])) {
        Set-Location @args
        return
    }

    # Fallback to zoxide
    z @args
}
