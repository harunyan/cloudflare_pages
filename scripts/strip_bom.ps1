$files = Get-ChildItem -Path . -Recurse -Include '*.ts','*.js','*.css','*.html','*.json','*.toml','*.md' -File -ErrorAction SilentlyContinue
foreach ($f in $files) {
  $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
  if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
    $content = [System.Text.Encoding]::UTF8.GetString($bytes,3,$bytes.Length-3)
    [System.IO.File]::WriteAllText($f.FullName,$content,[System.Text.Encoding]::UTF8)
    Write-Host "Stripped BOM: $($f.FullName)"
  }
}
