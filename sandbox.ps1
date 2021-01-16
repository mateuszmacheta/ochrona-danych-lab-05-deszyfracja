$naj = Get-Content '.\najpopularniejsze-slowa.txt'

foreach ($file in (Get-ChildItem .\auto_tekst))
{
    
    $hash = $file.Name.Substring(0, $file.Name.Length - 4)

    $odzyskany = (Get-Content ".\auto_tekst\$hash.txt").Split(' ')

    $alfabet = ''

    $alfabetTmp = Get-Content ".\auto_alfabet\$hash.txt"

    foreach ($line in $alfabetTmp)
    {
        $alfabet = $alfabet + [char][int]$line.Split('=')[0]
    }

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
                    if (($slowo[$i] -eq $najS[$i]) -or ($slowo[$i] -eq '*' -and (-not $alfabet.Contains($najS[$i])))) { $suma++ } 
                }
                if ($suma -eq $slowo.Length) { $suma *= 3 }
            }
        }
        $total += $suma
    }

    $prefix = $total.ToString().PadLeft(12, '0')
    
    Rename-Item -Path (".\auto_tekst\{0}" -f $file.Name)   -NewName ("{0}_{1}" -f $prefix, $file.Name)
}
