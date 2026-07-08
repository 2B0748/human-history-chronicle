$ErrorActionPreference = "Continue"
$outDir = "$PSScriptRoot\real"
$peopleDir = "$PSScriptRoot\people"

# ============================================================
#  SCENE IMAGES — improved search terms
# ============================================================
$scenes = [ordered]@{
  # Korean sites — try Korean names + English alternatives
  "bulguksa.jpg"              = @("Bulguksa", "Bulguksa_Temple")
  "seokguram.jpg"             = @("Seokguram_Grotto", "Seokguram")
  "tripitaka_koreana.jpg"     = @("Tripitaka_Koreana", "Haeinsa_Temple")
  "celadon_vase.jpg"          = @("Goryeo_celadon", "Korean_celadon")
  "gyeongbokgung.jpg"         = @("Gyeongbokgung_Palace", "Gyeongbokgung")
  "turtle_ship.jpg"           = @("Geobukseon", "Turtle_ship_(Korean)")
  # Cambodia
  "bayon_faces.jpg"           = @("Bayon_temple", "Bayon_faces")
  # Africa
  "djenne_mosque.jpg"         = @("Great_Mosque_of_Djenné", "Mosque_of_Djenne")
  "nok_sculpture.jpg"         = @("Nok_terracotta", "Nok_culture")
  # Pacific
  "easter_island.jpg"         = @("Moai", "Easter_Island_moai")
  "maori_marae.jpg"           = @("Marae", "Wharenui")
  "waitangi.jpg"              = @("Treaty_of_Waitangi", "Waitangi_Treaty_Grounds")
  # Japan
  "sensoji_asakusa.jpg"       = @("Sensō-ji", "Asakusa_Kannon_Temple")
}

# ============================================================
#  PEOPLE IMAGES
# ============================================================
$people = [ordered]@{
  "nkrumah.png" = @("Kwame_Nkrumah", "Kwame_Nkrumah_(1961)")
  "suryavarman.png" = @("Suryavarman_II", "Suryavarman_II_statue")
}

function Get-ImageFromWiki($terms, $outPath) {
  foreach ($term in $terms) {
    try {
      $api = "https://en.wikipedia.org/api/rest_v1/page/summary/" + $term
      $r = Invoke-RestMethod -Uri $api -TimeoutSec 12 -UserAgent "ReDownload/2.0"
      $url = if ($r.originalimage.source) { $r.originalimage.source } else { $r.thumbnail.source }
      if ($url) {
        Invoke-WebRequest -Uri $url -OutFile $outPath -TimeoutSec 25 -UserAgent "ReDownload/2.0"
        $sz = (Get-Item $outPath).Length
        if ($sz -gt 5000) { return $true }
        Remove-Item $outPath -Force
      }
    } catch { }
    Start-Sleep -Seconds 1.5
  }
  return $false
}

$total = $scenes.Count + $people.Count
$current = 0; $ok = 0

# Download scene images
Write-Host "=== SCENE IMAGES ($($scenes.Count)) ===" -ForegroundColor Cyan
foreach ($kv in $scenes.GetEnumerator()) {
  $current++
  $path = Join-Path $outDir $kv.Key
  $currentSz = if (Test-Path $path) { (Get-Item $path).Length } else { 0 }
  if ($currentSz -gt 5000) { Write-Host "[$current/$total] $($kv.Key) SKIP (exists $([math]::Round($currentSz/1024))KB)" -ForegroundColor DarkGray; $ok++; continue }

  Write-Host "[$current/$total] $($kv.Key) ← $($kv.Value -join ' | ')" -NoNewline
  if (Get-ImageFromWiki $kv.Value $path) {
    $sz = [math]::Round((Get-Item $path).Length/1024)
    Write-Host " OK (${sz}KB)" -ForegroundColor Green
    $ok++
  } else {
    Write-Host " FAIL (keeping placeholder)" -ForegroundColor Yellow
  }
}

# Download people images
Write-Host "`n=== PEOPLE IMAGES ($($people.Count)) ===" -ForegroundColor Cyan
foreach ($kv in $people.GetEnumerator()) {
  $current++
  $path = Join-Path $peopleDir $kv.Key
  $currentSz = if (Test-Path $path) { (Get-Item $path).Length } else { 0 }
  if ($currentSz -gt 5000) { Write-Host "[$current/$total] $($kv.Key) SKIP (exists $([math]::Round($currentSz/1024))KB)" -ForegroundColor DarkGray; $ok++; continue }

  Write-Host "[$current/$total] $($kv.Key) ← $($kv.Value -join ' | ')" -NoNewline
  if (Get-ImageFromWiki $kv.Value $path) {
    $sz = [math]::Round((Get-Item $path).Length/1024)
    Write-Host " OK (${sz}KB)" -ForegroundColor Green
    $ok++
  } else {
    Write-Host " FAIL (keeping placeholder)" -ForegroundColor Yellow
  }
}

Write-Host "`n=== DONE: $ok/$total ===" -ForegroundColor Cyan
