function analizaStatystyczna([string]$plikZrodlowy) {
    $bytes = [System.IO.File]::ReadAllBytes($plikZrodlowy)
    $bytes = $bytes | Group-Object
    return $bytes |`
        Select-Object @{l = 'Znak'; e = { [char][int]$_.name } }, @{l = 'Kod'; e = { $_.name } }, @{l = 'Ilosc'; e = { $_.Count } }`
    | Sort-Object 'Ilosc' -Descending
}



analizaStatystyczna szyfrogram_f_1.txt