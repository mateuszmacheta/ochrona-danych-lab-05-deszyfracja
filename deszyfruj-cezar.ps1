function deszyfrujCezar([string]$plikZrodlowy, $alfabet, [string]$plikWynikowy)
{
    $zrodlo = Get-Content $plikZrodlowy
    $zrodlo = $zrodlo.ToCharArray()
    
    if ($plikWynikowy -eq '')
    {
        foreach ($c in $zrodlo)
        {
            #Write-Host $c
            if ($alfabet[1].Contains($c))
            { Write-Host $alfabet[0][$alfabet[1].IndexOf($c)] -ForegroundColor White -NoNewline }
            else
            { Write-Host $c -ForegroundColor Gray -NoNewline }
        }
    }
    else
    {
        foreach ($c in $zrodlo)
        {
            if ($alfabet[1].Contains($c))
            { $alfabet[0][$alfabet[1].IndexOf($c)] | Out-File -FilePath $plikWynikowy -Append -NoNewline }
            else
            { '*' | Out-File -FilePath $plikWynikowy -Append -NoNewline }
        }
    }
}

<# $o = @(
    [char]'X',
    [char]'"',
    [char]240,
    [char]190,
    [char]217,
    [char]168,
    [char]9,
    [char]16,
    [char]187,
    [char]150)

$s = $o -join ''

deszyfrujCezar szyfrogram_f_0.txt @(' aeioznytw', $s) out.txt #>


