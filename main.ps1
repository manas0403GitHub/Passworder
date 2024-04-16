$numberPassword = 12563, 67541, 93581, 31556, 97454, 51131, 64540, 99915, 83424, 26750, 12049, 76542
$wordPassword = "AFGHI", "BGQHY", "ZUBXY", "NSASS", "FBIGK", "LONPR", "RSPOW", "HBZVY", "ABCEG", "XZYWV", "XXZIY", "VUBCK"
$symbolPassword = "@#?&+", "#/:;,", "?!\/&", "<>?#@", "({})^", "%*-+\", "//<>#", "@#/?^", ",.()?", "/{(})", ";,\%^", ":/?;\"

$score = 0

while ($true) {
    $chooseArray = Get-Random -Minimum 1 -Maximum 4

    if ($chooseArray -eq 1){
        $number = $numberPassword | Get-Random
        Write-Host $number
    } elseif ($chooseArray -eq 2) {
        $word = $wordPassword | Get-Random
        Write-Host $word
    } elseif ($chooseArray -eq 3) {
        $symbol = $symbolPassword | Get-Random
        Write-Host $symbol
    }
    Write-Host "Memorize the code above for 3 seconds."
    Start-Sleep -Seconds 3

    Clear-Host

    $password = Read-Host "Enter the code" -Prompt
    if ($password -eq $number -or $password -eq $word -or $password -eq $symbol){
        Write-Host "Correct!"
        Write-Host "Wait for the next code..."
        $score += 1
    } else {
        Write-Host "Incorrect!"
        Write-Host "Wait for the next code..."
    }
    Start-Sleep -Seconds 3
    Clear-Host
    if ($score -eq 5){
        Write-Host "Game Over!"
        Write-Host "Your Score is $score/5"

        $again = Read-Host "Again?Y/N" -Prompt
        if ($again -eq "Y"){
            Write-Host "Reloading Game..."
            Start-Sleep -Seconds 1
        } else {
            Write-Host "Thank you for playing!"
            Exit-Process
        }
    }
}