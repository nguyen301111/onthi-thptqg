$relsXml = [xml](Get-Content 'sheet_extracted/xl/worksheets/_rels/sheet1.xml.rels' -Raw -Encoding utf8)
$sheetXml = [xml](Get-Content 'sheet_extracted/xl/worksheets/sheet1.xml' -Raw -Encoding utf8)
$stringsXml = [xml](Get-Content 'sheet_extracted/xl/sharedStrings.xml' -Raw -Encoding utf8)

$relMap = @{}
foreach ($rel in $relsXml.Relationships.Relationship) {
    $relMap[$rel.Id] = $rel.Target
}

$sharedStrings = @()
foreach ($si in $stringsXml.sst.si) {
    $text = if ($si.t) { $si.t } else { ($si.r | ForEach-Object { $_.t }) -join "" }
    $sharedStrings += $text
}

$hyperlinks = @{}
foreach ($hl in $sheetXml.worksheet.hyperlinks.hyperlink) {
    $ref = $hl.ref
    $rId = $hl.id
    if ($relMap.ContainsKey($rId)) {
        $hyperlinks[$ref] = $relMap[$rId]
    }
}

$rows = @()
$currentBuoi = ""
$currentNgay = ""

foreach ($row in $sheetXml.worksheet.sheetData.row) {
    $rowNum = $row.r
    if ([int]$rowNum -le 2) { continue } # Skip header
    
    $cells = @{}
    foreach ($c in $row.c) {
        $colLetter = $c.r -replace '\d+', ''
        $val = ""
        if ($c.t -eq "s") {
            $idx = [int]$c.v
            $val = $sharedStrings[$idx]
        } else {
            $val = $c.v
        }
        $link = if ($hyperlinks.ContainsKey($c.r)) { $hyperlinks[$c.r] } else { "" }
        $cells[$colLetter] = @{ Val = $val; Link = $link }
    }
    
    $stt = if ($cells.ContainsKey('A')) { $cells['A'].Val } else { "" }
    $buoi = if ($cells.ContainsKey('B') -and $cells['B'].Val) { $cells['B'].Val } else { "" }
    if ($buoi) { $currentBuoi = $buoi }
    
    $ngay = if ($cells.ContainsKey('C') -and $cells['C'].Val) { $cells['C'].Val } else { "" }
    if ($ngay) { $currentNgay = $ngay }
    
    $ca = if ($cells.ContainsKey('D')) { $cells['D'].Val } else { "" }
    $noiDung = if ($cells.ContainsKey('E')) { $cells['E'].Val } else { "" }
    $fileDe = if ($cells.ContainsKey('F')) { $cells['F'].Link } else { "" }
    $video = if ($cells.ContainsKey('G')) { $cells['G'].Link } else { "" }
    $fileVietTay = if ($cells.ContainsKey('H')) { $cells['H'].Link } else { "" }
    $ghiChu = if ($cells.ContainsKey('I')) { $cells['I'].Val } else { "" }
    
    if ($noiDung) {
        $rows += [PSCustomObject]@{
            Row = $rowNum
            STT = $stt
            BuoiHoc = $currentBuoi
            NgayLive = $currentNgay
            CaLive = $ca
            NoiDung = $noiDung
            FileDe = $fileDe
            Video = $video
            FileVietTay = $fileVietTay
            GhiChu = $ghiChu
        }
    }
}

$rows | ConvertTo-Json -Depth 3 | Out-File -FilePath 'extracted_courses.json' -Encoding utf8
Write-Output "Extracted $($rows.Count) items. First 5:"
$rows | Select-Object -First 5 | Format-Table -AutoSize
