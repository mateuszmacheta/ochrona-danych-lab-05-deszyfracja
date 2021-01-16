function analizaStatystyczna([string]$plikZrodlowy)
{
    $bytes = [System.IO.File]::ReadAllBytes($plikZrodlowy)
    $bytes = $bytes | Group-Object
    return $bytes |`
        Select-Object @{l = 'Znak'; e = { [char][int]$_.name } }, @{l = 'Kod'; e = { $_.name } }, @{l = 'Ilosc'; e = { $_.Count } }`
    | Sort-Object 'Ilosc' -Descending
}



analizaStatystyczna  'C:\Users\machetam\Documents\WindowsPowerShell\lab05\szyfrogram_f_0.txt'