function vz {
    Get-ChildItem -Force | Select-Object Name, @{Name="Size(MB)";Expression={if($_.PSIsContainer){$size = (Get-ChildItem $_.FullName -Recurse -File | Measure-Object Length -Sum).Sum; $size/1MB} else {$_.Length/1MB}}} | Sort-Object "Size(MB)" -Descending
}
