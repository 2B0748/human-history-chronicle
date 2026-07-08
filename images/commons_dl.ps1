$ErrorActionPreference = "Continue"
$outDir = "$PSScriptRoot\real"
$peopleDir = "$PSScriptRoot\people"

# Search Wikimedia Commons for images and download first result
function Search-And-Download($searchTerm, $outPath) {
  try {
    # Search Commons for files
    $search = [uri]::EscapeDataString($searchTerm)
    $api = "https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=$search&srnamespace=6&format=json&srlimit=3"
    $r = Invoke-RestMethod -Uri $api -TimeoutSec 10 -UserAgent "CommonsDL/1.0"
    $titles = $r.query.search | ForEach-Object { $_.title }
    if (-not $titles) { return $false }

    # Get image URLs
    $titleParam = ($titles | ForEach-Object { [uri]::EscapeDataString($_) }) -join '|'
    $infoApi = "https://commons.wikimedia.org/w/api.php?action=query&titles=$titleParam&prop=imageinfo&iiprop=url|size&format=json"
    $info = Invoke-RestMethod -Uri $infoApi -TimeoutSec 10 -UserAgent "CommonsDL/1.0"

    foreach ($page in $info.query.pages.PSObject.Properties) {
      $imgInfo = $page.Value.imageinfo
      if ($imgInfo -and $imgInfo[0].url) {
        $url = $imgInfo[0].url
        $w = $imgInfo[0].width
        $h = $imgInfo[0].height
        # Skip tiny images
        if ($w -lt 300 -or $h -lt 200) { continue }
        Invoke-WebRequest -Uri $url -OutFile $outPath -TimeoutSec 25 -UserAgent "CommonsDL/1.0"
        $sz = (Get-Item $outPath).Length
        if ($sz -gt 5000) { return $true }
        Remove-Item $outPath -Force
      }
    }
  } catch { }
  return $false
}

$tasks = @(
  # Korean
  @{path="$outDir\seokguram.jpg"; terms=@("Seokguram Grotto", "석굴암", "Seokguram Buddha")},
  @{path="$outDir\tripitaka_koreana.jpg"; terms=@("Tripitaka Koreana", "팔만대장경", "Haeinsa Tripitaka")},
  @{path="$outDir\celadon_vase.jpg"; terms=@("Goryeo celadon vase", "고려청자", "Korean celadon")},
  @{path="$outDir\gyeongbokgung.jpg"; terms=@("Gyeongbokgung Palace", "경복궁", "Gyeongbok Palace")},
  @{path="$outDir\turtle_ship.jpg"; terms=@("Geobukseon turtle ship", "거북선", "Turtle ship Korea")},
  # Cambodia
  @{path="$outDir\bayon_faces.jpg"; terms=@("Bayon temple faces Angkor", "Bayon smiling faces")},
  # Africa
  @{path="$outDir\djenne_mosque.jpg"; terms=@("Great Mosque of Djenne", "Grande mosquee Djenne", "Djenne mosque Mali")},
  @{path="$outDir\nok_sculpture.jpg"; terms=@("Nok terracotta sculpture", "Nok culture head")},
  # Pacific
  @{path="$outDir\easter_island.jpg"; terms=@("Moai Easter Island", "Rapa Nui statues", "Moai Ahu Tongariki")},
  @{path="$outDir\maori_marae.jpg"; terms=@("Maori marae meeting house", "Wharenui carved house")},
  @{path="$outDir\waitangi.jpg"; terms=@("Waitangi Treaty Grounds", "Treaty of Waitangi signing")},
  # Japan
  @{path="$outDir\sensoji_asakusa.jpg"; terms=@("Sensoji Asakusa temple", "浅草寺 雷門", "Kaminarimon gate")},
  # People
  @{path="$peopleDir\nkrumah.png"; terms=@("Kwame Nkrumah portrait", "Nkrumah Ghana")},
  @{path="$peopleDir\suryavarman.png"; terms=@("Suryavarman II statue", "Suryavarman II bas relief")}
)

$total = $tasks.Count; $ok = 0; $i = 0

Write-Host "=== Searching Wikimedia Commons for $total images ===" -ForegroundColor Cyan
foreach ($t in $tasks) {
  $i++
  $currentSz = if (Test-Path $t.path) { (Get-Item $t.path).Length } else { 0 }
  if ($currentSz -gt 5000) {
    Write-Host "[$i/$total] $(Split-Path $t.path -Leaf) SKIP ($([math]::Round($currentSz/1024))KB)" -ForegroundColor DarkGray
    $ok++; continue
  }

  Write-Host "[$i/$total] $(Split-Path $t.path -Leaf)" -NoNewline
  $found = $false
  foreach ($term in $t.terms) {
    if (Search-And-Download $term $t.path) {
      $sz = [math]::Round((Get-Item $t.path).Length/1024)
      Write-Host " OK ${sz}KB [$term]" -ForegroundColor Green
      $found = $true; $ok++; break
    }
    Start-Sleep -Seconds 2
  }
  if (-not $found) { Write-Host " FAIL" -ForegroundColor Yellow }
}

Write-Host "`n=== DONE: $ok/$total ===" -ForegroundColor Cyan
