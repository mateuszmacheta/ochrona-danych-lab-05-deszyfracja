$topFiles = @('44BB691725A394DA1A99F4E43AAE8709EC527E51A54EBD26CB94DB9D0331B286.txt', 'F6A00A2F1D47C50F0CBE12C1B01F64155C581C49142CE242207CF6FBC7097AE3.txt', 'E61E7BE780449236AE6826E98F67EF859F9C0B8527ECCE2D379894FF3CFB1688.txt', 'A5444A2E225C9988904FE4FAA7D90BF1E04046FFC098DDC423976A66D81C6C9D.txt', 'D47EB7B22B6CE178E6E03F243C467DAF122780145A9BAE4BC4CD01246562C722.txt')

$i = 0
foreach ($file in $topFiles)
{
    $i++
    Write-Host "Plik $i"
    $cont = Get-Content ".\auto_alfabet\$file".Split("`n")
    foreach ($item in $cont)
    {
        $znak = [int]($item.Split('=')[1])
        if (($znak -lt 32))
        {
            Write-Host ('(' + $znak.ToString() + ')') -NoNewline
        }
        else
        {
            $c = [char]$znak
            Write-Host $c -NoNewline
        }
    }
    Write-Host
    Write-Host '>>>>'
}