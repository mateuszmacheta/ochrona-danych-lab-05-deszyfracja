function deszyfrujCezar([string]$plikZrodlowy, [string]$plikWynikowy) {
    $zrodlo = Get-Content $plikZrodlowy
    $zrodlo = $zrodlo.ToCharArray()

    $alfabet = New-Object -TypeName 'System.Collections.Generic.Dictionary[[char], [char]]'
    
    <# tekst 0
    $alfabet = @{
        [char]88  = ' ';
        [char]34  = 'a';
        [char]240 = 'e';
        [char]190 = 'i';
        [char]217 = 'o';
        [char]168 = 'z';
        [char]9   = 'n';
        [char]16  = 'y';
        [char]187 = 't';
        [char]150 = 'w';   
    }
    #>


    #tekst 1

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
    }
    

    foreach ($c in $zrodlo) {
        #Write-Host $c
        if ($alfabet.ContainsKey($c))
        { Write-Host $alfabet[$c] -ForegroundColor White -NoNewline }
        else
        { Write-Host $c -ForegroundColor Gray -NoNewline }
    }
}

deszyfrujCezar szyfrogram_f_1.txt odzyskany_0.txt