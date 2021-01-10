function analizaStatystyczna2([string]$plikZrodlowy) {
    $bytes = [System.IO.File]::ReadAllBytes($plikZrodlowy)
    $dwuznaki = New-Object -TypeName 'System.Collections.Generic.List[string]'

    (0..($bytes.Count - 2)) | % { $dwuznaki.Add([char]$bytes[$_] + [char]$bytes[$_ + 1]) | Out-Null }
        
    return $dwuznaki | Group-Object | select 'Name', 'Count' -First 50 | sort 'count' -Descending
}

analizaStatystyczna2 Tekst_jawny_1.txt