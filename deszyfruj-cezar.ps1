function deszyfrujCezar([string]$plikZrodlowy, [string]$plikWynikowy)
{
    $zrodlo = Get-Content $plikZrodlowy
    $zrodlo = $zrodlo.ToCharArray()

    $alfabet = New-Object -TypeName 'System.Collections.Generic.Dictionary[[char], [char]]'
    
    # tekst 0
    $alfabet = @{
        [char]'X' = ' ';
        [char]'"' = 'a';
        [char]240 = 'e';
        [char]190 = 'i';
        [char]217 = 'o';
        [char]168 = 'z';
        [char]9 = 'n';
        [char]16 = 'y';
        [char]187 = 't';
        [char]8211 = 'w';   
    }


    <# tekst 1

        $alfabet = @{
        [char]'X' = ' ';
        [char]190 = 'a';
        [char]34 = 'e';
        [char]240 = 'i';
        [char]217 = 'o';
        [char]168 = 'z';
        [char]16 = 'n';
        [char]9 = 'c';
        [char]102 = 'w';
        [char]8240 = 'r';   
    }
    #>

    foreach ($c in $zrodlo)
    {
        #Write-Host $c
        if ($alfabet.ContainsKey($c))
        { Write-Host $alfabet[$c] -ForegroundColor White -NoNewline }
        else
        { Write-Host $c -ForegroundColor Gray -NoNewline}
    }
}

deszyfrujCezar szyfrogram_f_0.txt odzyskany_0.txt