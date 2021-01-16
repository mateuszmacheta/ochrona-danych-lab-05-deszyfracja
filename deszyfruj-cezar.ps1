function deszyfrujCezar([string]$plikZrodlowy, $alfabet, [string]$plikWynikowy)
{
    $zrodlo = Get-Content $plikZrodlowy
    $zrodlo = $zrodlo.ToCharArray()

    $alfabet = New-Object -TypeName 'System.Collections.Generic.Dictionary[[char], [char]]'
    
    # tekst 0
    <#$alfabet = @{
        [char]88  = ' ';
        [char]34  = 'a';
        [char]187 = 't';
        [char]43  = 'k';

        [char]240 = 'e';
        [char]190 = 'i';
        [char]217 = 'o';
        [char]168 = 'z';
        [char]9   = 'y';
        [char]16  = 'w';
        [char]150 = 'n'; 
    }#>
    
    if ($plikWynikowy -eq '')
    {
        foreach ($c in $zrodlo)
        {
            #Write-Host $c
            if ($alfabet.ContainsKey($c))
            { Write-Host $alfabet[$c] -ForegroundColor White -NoNewline }
            else
            { Write-Host $c -ForegroundColor Gray -NoNewline }
        }
    }
    else
    {
        foreach ($c in $zrodlo)
        {
            if ($alfabet.ContainsKey($c))
            { $alfabet[$c] | Out-File -FilePath $plikWynikowy -Append -NoNewline }
            else
            { '*' | Out-File -FilePath $plikWynikowy -Append -NoNewline }
        }
    }
}

<#tekst 1

        $alfabet = @{
        [char]88 = ' ';
        [char]190 = 'a';
        [char]34 = 'e';
        [char]240 = 'i';
        [char]217 = 'o';
        [char]168 = 'z';
        [char]16 = 'n';
        [char]102 = 'c';
        [char]9 = 'w';
        [char]137 = 'r';   
    }#>

#deszyfrujCezar szyfrogram_f_0.txt


