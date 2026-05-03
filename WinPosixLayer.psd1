@{
    RootModule        = 'WinPosixLayer.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890'
    Author            = 'omardev29'
    Description       = 'POSIX-like commands for PowerShell on Windows - Bringing Linux utilities to Windows PowerShell'
    PowerShellVersion = '7.0'

    FunctionsToExport = @(
        'spf',
        'Test-Command',
        'ls',
        'cat',
        'cd',
        'rm',
        'ghclone',
        '..',
        '...',
        'touch',
        'mkdirp',
        'head',
        'tail',
        'tailf',
        'which',
        'vz'
    )

    AliasesToExport   = @(
        'grep',
        'df',
        'poweroff',
        'reboot'
    )

    PrivateData       = @{
        PSData = @{
            LicenseUri    = 'https://github.com/omardev29/win-posix-layer/blob/main/LICENSE'
            ProjectUri    = 'https://github.com/omardev29/win-posix-layer'
            Tags          = @('posix', 'linux', 'commands', 'windows', 'powershell', 'utilities')
            ReleaseNotes  = 'Initial release with POSIX-like commands for Windows PowerShell'
        }
    }
}
