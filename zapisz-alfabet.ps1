function zapiszAlfabet($alfabet, $plikWynikowy)
{
    $output = ''
    foreach ($i in (0..($alfabet[0].Length - 1)))
    {
        $output = $output + ([int]$alfabet[0][$i]).ToString() + '=' + ([int]$alfabet[1][$i]).ToString() + "`n"
    }
    $output.TrimEnd("`n") | Out-File $plikWynikowy
}