function analizaStatystyczna([string]$plikZrodlowy)
{
    $zrodlo = Get-Content $plikZrodlowy
    $zrodlo = $zrodlo.ToCharArray() | Group-Object
    return $zrodlo | Select-Object Name,@{l="Code";e={[int][char]$_.Name}},Count | Sort Count -Descending
}

analizaStatystyczna szyfrogram_f_1.txt