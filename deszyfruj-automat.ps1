# TEKSTY: PROBKA ORYGINALNEGO I ZASZYFROWANY

$oryginal = '.\Tekst_jawny_0.txt'
$szyfrogram = '.\szyfrogram_f_0.txt'
$najSciezka = '.\najpopularniejsze-slowa.txt'
$dlugoscMapy = 20

$naj = Get-Content '.\najpopularniejsze-slowa.txt'

# WŁĄCZ FUNKCJE

. .\analiza-statystyczna.ps1
. .\deszyfruj-cezar.ps1
. .\zapisz-alfabet.ps1

# DO LICZENIA SHA1

$map1 = analizaStatystyczna $oryginal
$map2 = analizaStatystyczna $szyfrogram

# PRZYGOTOWANIE MAPOWAŃ ZNAKÓW

$map2 | Add-Member -NotePropertyName 'Kumulatywna' -NotePropertyValue 0

$map2[0].Kumulatywna = $map2[0].Ilosc

(1..($map2.Length - 1)) | % { $map2[$_].Kumulatywna = $map2[$_ - 1].Kumulatywna + $map2[$_].Ilosc }

$alfabet = @('', '')

(0..($dlugoscMapy - 1)) | % { $alfabet[0] = $alfabet[0] + $map1[$_].Znak }

$max = ($map2 | Measure-Object -Property 'Ilosc' -Sum).Sum

# GŁÓWNA PĘTLA

$j = 0
# for powershell <7
#(0..[int16]::MaxValue) | ForEach-Object -Parallel { deszyfrujMain $alfabet }

While ($true)
{
    $stringAsStream = [System.IO.MemoryStream]::new()
    $writer = [System.IO.StreamWriter]::new($stringAsStream)
    
    # Losowe mapowanie
    $temp = [System.Collections.ArrayList]@()
    (1..($map2.Count - 1)) | % { $temp.Add($map2[$_]) | Out-Null }
    $alfabet[1] = 'X'
    while ($alfabet[1].Length -lt $dlugoscMapy)
    {
        #"temp.Count: {0}" -f $temp.Count
        [int]$rnd = Get-Random -Minimum 1 -Maximum $max
        foreach ($i in (0..($temp.Count - 1)))
        {
            if ($rnd -le $temp[$i].Kumulatywna)
            {
                #"i: $i"
                $alfabet[1] += $temp[$i].Znak
                $temp.RemoveAt($i)
                $rm++
                break
            }
        }
    }
    # SPRAWDŹ CZY JUŻ TAKIE MAPOWANIE NIE BYŁO WYGENEROWANE
    # ROBIMY CRC64 I SPRAWDZAMY CZY JUŻ JEST W FOLDERZE Z MAPOWANIAMI

    $tempS = $alfabet[0] + $alfabet[1]

    $writer.write($tempS)
    $writer.Flush()
    $stringAsStream.Position = 0

    $sha = (Get-FileHash -InputStream $stringAsStream).Hash

    if (Test-Path ".\auto_alfabet\$sha.txt")
    { continue }

    zapiszAlfabet $alfabet ".\auto_alfabet\$sha.txt"

    deszyfrujCezar $szyfrogram $alfabet ".\auto_tekst\$sha.txt"

    # EWALUACJA

    $odzyskany = (Get-Content ".\auto_tekst\$sha.txt").Split(' ')

    $total = 0

    foreach ($slowo in $odzyskany)
    {
        $sumaMax = -1
        foreach ($najS in $naj)
        {
            if ($slowo.Length -eq $najS.Length)
            {
                $suma = 0
                for ($i = 0; $i -lt $slowo.Length; $i++)
                {
                    if (($slowo[$i] -eq $najS[$i]) -or ($slowo[$i] -eq '*' -and (-not $alfabet[0].Contains($najS[$i])))) { $suma++ } 
                }
                if ($suma -eq $slowo.Length) { $suma *= 3 }

                $sumaMax = [math]::Max($suma, $sumaMax)
            }
        }
        $total += $sumaMax
    }

    $prefix = $total.ToString().PadLeft(12, '0')
   
    Rename-Item -Path (".\auto_tekst\{0}.txt" -f $sha)   -NewName ("{0}_{1}.txt" -f $prefix, $sha)

    $j++
    "wykonano $j razy"
}

