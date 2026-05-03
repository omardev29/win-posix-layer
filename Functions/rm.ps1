function rm {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        # Entrada desde pipeline (objetos o strings)
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias("FullName")]
        [object]$InputObject,

        # Argumentos estilo Linux (-f -r)
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Args
    )

    begin {
        Add-Type -AssemblyName Microsoft.VisualBasic

        $force = $false
        $recurse = $false
        $paths = @()

        # Parseo de flags
        foreach ($arg in $Args) {
            switch ($arg) {
                "-f" { $force = $true }
                "-r" { $recurse = $true }
                "-rf" { $force = $true; $recurse = $true }
                "-fr" { $force = $true; $recurse = $true }
                default { $paths += $arg }
            }
        }
    }

    process {
        if ($null -ne $InputObject) {
            if ($InputObject -is [System.IO.FileSystemInfo]) {
                $paths += $InputObject.FullName
            } else {
                $paths += [string]$InputObject
            }
        }
    }

    end {
        foreach ($path in $paths) {

            if (-not (Test-Path $path)) {
                if (-not $force) {
                    Write-Error "No existe: $path"
                }
                continue
            }

            $item = Get-Item $path

            # Optional: more Linux-like behavior
            if ($item -is [System.IO.DirectoryInfo] -and -not $recurse) {
                Write-Error "No se puede eliminar '$path': es un directorio (usa -r)"
                continue
            }

            if ($PSCmdlet.ShouldProcess($path, "Enviar a la papelera")) {
                try {
                    if ($force) {
                        # Permanent deletion (no recycle bin)
                        if ($item -is [System.IO.DirectoryInfo]) {
                            Remove-Item -Path $item.FullName -Recurse:$recurse -Force -ErrorAction Stop
                        } else {
                            Remove-Item -Path $item.FullName -Force -ErrorAction Stop
                        }
                    } else {
                        # Send to recycle bin
                        if ($item -is [System.IO.DirectoryInfo]) {
                            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory(
                                $item.FullName,
                                [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
                                [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin
                            )
                        } else {
                            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
                                $item.FullName,
                                [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
                                [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin
                            )
                        }
                    }
                }
                catch {
                    if (-not $force) {
                        Write-Error "Error deleting: $path"
                        Write-Error $_
                    }
                }
            }
        }
    }
}
