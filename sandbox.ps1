.\analiza-statystyczna.ps1

$map1 = analizaStatystyczna Tekst_jawny_0.txt
$map2 = analizaStatystyczna szyfrogram_f_0.txt

$rowCount = [math]::Max($map1.Length, $map2.Length)

$map = [System.Collections.ArrayList]@()

#(0..($rowCount-1)) | % { $map.Add()}

<# $alfabet = @{
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
}

$naj = Get-Content '.\najpopularniejsze_słowa copy.txt'

$odzyskany = (Get-Content .\odzyskany0.txt).Split(' ')

$total = 0

foreach ($slowo in $odzyskany)
{
    $suma = 0
    foreach ($najS in $naj)
    {
        if ($slowo.Length -eq $najS.Length)
        {
            for ($i = 0; $i -lt $slowo.Length; $i++)
            {
                if (($slowo[$i] -eq $najS[$i]) -or ($slowo[$i] -eq '*' -and (-not $alfabet.ContainsValue($najS[$i]))))`
                { $suma++ }
            }
            if ($suma -eq $slowo.Length) { $suma *= 3 }
        }
    }
    $total += $suma
} #>

"ddd"