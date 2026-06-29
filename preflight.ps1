# preflight.ps1 — Dan 1 pre-flight (Windows / PowerShell)
# Preveri 8 stvari in izpiše PRE-FLIGHT GREEN (8/8), ko je naprava pripravljena.
# Posnetek zaslona zelenega izida daj v Discord. Glej 10-preflight-in-izhodna-vrata.md.
# Skripta samo BERE — ničesar ne namesti in ne spremeni.
# Zagon:  powershell -ExecutionPolicy Bypass -File .\preflight.ps1

$ErrorActionPreference = 'SilentlyContinue'

$script:Pass   = 0
$script:Failed = @()

function Ok([string]$m)            { Write-Host "  [OK] $m"   -ForegroundColor Green;  $script:Pass++ }
function Fail([string]$m,[string]$hint='') {
  Write-Host "  [X]  $m" -ForegroundColor Red
  if ($hint) { Write-Host "       -> $hint" -ForegroundColor DarkGray }
  $script:Failed += $m
}
function Has([string]$cmd) { [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }

Write-Host "Pre-flight — preverjam 8 stvari ..."
Write-Host ""

# 1) OS
$os = [System.Environment]::OSVersion.Version
Ok ("OS: Windows {0}.{1}" -f $os.Major, $os.Build)

# 2) git
if (Has 'git') { Ok ("git: " + ((git --version) -replace 'git version ','')) }
else { Fail "git ni nameščen" "Namesti z: winget install --id Git.Git  (ali https://git-scm.com)." }

# 3) Node >= 20
if (Has 'node') {
  $nodeRaw = (node -v)                       # npr. v22.3.0
  $nodeMajor = [int](($nodeRaw -replace '^v','') -split '\.')[0]
  if ($nodeMajor -ge 20) { Ok "Node $nodeRaw (>= 20)" }
  else { Fail "Node $nodeRaw je prestar (potrebno >= 20)" "Glej 02-claude-code-node.md." }
} else { Fail "Node ni nameščen" "Glej 02-claude-code-node.md." }

# 4) bun
if (Has 'bun') { Ok ("bun: " + (bun --version)) }
else { Fail "bun ni nameščen" "Namesti: powershell -c `"irm bun.sh/install.ps1 | iex`"  (glej 02-claude-code-node.md)." }

# 5) gh auth
if (Has 'gh') {
  gh auth status *> $null
  if ($LASTEXITCODE -eq 0) { Ok "gh auth: prijavljen" }
  else { Fail "gh: nameščen, a NI prijavljen" "Zaženi: gh auth login  (glej 03-github.md)." }
} else { Fail "GitHub CLI (gh) ni nameščen" "Namesti: winget install --id GitHub.cli  (glej 03-github.md)." }

# 6) Claude Code
if (Has 'claude') {
  $cv = (claude --version | Select-Object -First 1)
  Ok ("Claude Code: " + $(if ($cv) { $cv } else { "nameščen" }))
  Write-Host "       (po potrebi poženi 'claude doctor' za podrobno diagnostiko)" -ForegroundColor DarkGray
} else { Fail "Claude Code (claude) ni na PATH" "Glej 02-claude-code-node.md." }

# 7) omrežje do ključnih storitev
$hosts = 'github.com','vercel.com','supabase.com','openrouter.ai','api.telegram.org'
$netBad = @()
foreach ($h in $hosts) {
  try {
    Invoke-WebRequest -Uri "https://$h" -Method Head -TimeoutSec 6 -UseBasicParsing *> $null
  } catch {
    # 4xx/redirect še vedno pomeni dosegljiv strežnik; štejemo le pravo napako povezave
    if ($_.Exception.Response -eq $null) { $netBad += $h }
  }
}
if ($netBad.Count -eq 0) { Ok "omrežje: dostop do vseh 5 storitev" }
else { Fail ("omrežje: ni dostopa do " + ($netBad -join ', ')) "Preveri internet / VPN / požarni zid." }

# 8) disk + RAM
$sys      = Get-CimInstance Win32_OperatingSystem
$ramGb    = [math]::Round($sys.TotalVisibleMemorySize / 1MB)
$drive    = Get-PSDrive -Name ($env:SystemDrive.TrimEnd(':'))
$freeGb   = [math]::Round($drive.Free / 1GB)
if ($freeGb -ge 5) { Ok "disk/RAM: $freeGb GB prostora · $ramGb GB RAM" }
else { Fail "premalo prostora na disku ($freeGb GB, potrebno >= 5 GB)" "Sprosti prostor in poženi znova." }

Write-Host ""
if ($script:Pass -eq 8) {
  Write-Host "PRE-FLIGHT GREEN (8/8)" -ForegroundColor Green
  Write-Host "Naprava je pripravljena. Posnetek zaslona daj v Discord." -ForegroundColor Green
  exit 0
} else {
  Write-Host ("PRE-FLIGHT: {0}/8 — manjka: {1}" -f $script:Pass, ($script:Failed -join ', ')) -ForegroundColor Red
  Write-Host "Popravi rdeče točke zgoraj (vsaka ima namig), nato poženi znova." -ForegroundColor DarkGray
  Write-Host "Če se zatakneš za > 10 min, glej rezervno lestev v 10-preflight-in-izhodna-vrata.md." -ForegroundColor DarkGray
  exit 1
}
