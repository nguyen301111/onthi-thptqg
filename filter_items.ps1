$data = Get-Content 'extracted_courses.json' -Raw -Encoding utf8 | ConvertFrom-Json
$validItems = @()
foreach ($item in $data) {
    if (-not $item.FileDe -and -not $item.FileVietTay -and -not $item.Video) {
        continue
    }
    $dateStr = ""
    if ($item.NgayLive -match '^\d+(\.\d+)?$') {
        $oa = [double]$item.NgayLive
        $dateStr = ([DateTime]::FromOADate($oa)).ToString("dd/MM/yyyy")
    } else {
        $dateStr = $item.NgayLive
    }
    
    $validItems += [PSCustomObject]@{
        STT = $item.STT -replace '\.0$', ''
        Buoi = $item.BuoiHoc
        Ngay = $dateStr
        Ca = $item.CaLive
        NoiDung = $item.NoiDung
        FileDe = $item.FileDe
        FileVietTay = $item.FileVietTay
        Video = $item.Video
    }
}

Write-Output "Total items with links: $($validItems.Count)"
$validItems | Select-Object -First 10 | Format-Table -AutoSize
