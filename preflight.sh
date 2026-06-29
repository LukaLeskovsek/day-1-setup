#!/usr/bin/env bash
# preflight.sh — Dan 1 pre-flight (macOS / Linux)
# Preveri 8 stvari in izpiše PRE-FLIGHT GREEN (8/8), ko je naprava pripravljena.
# Posnetek zaslona zelenega izida daj v Discord. Glej 10-preflight-in-izhodna-vrata.md.
# Skripta samo BERE — ničesar ne namesti in ne spremeni.

set -u

green() { printf '\033[0;32m%s\033[0m\n' "$1"; }
red()   { printf '\033[0;31m%s\033[0m\n' "$1"; }
dim()   { printf '\033[0;90m%s\033[0m\n' "$1"; }

PASS=0
FAILED=()

ok()   { green "  ✅ $1"; PASS=$((PASS+1)); }
fail() { red   "  ❌ $1"; [ -n "${2:-}" ] && dim "     → $2"; FAILED+=("$1"); }

echo "Pre-flight — preverjam 8 stvari ..."
echo

# 1) OS
OS="$(uname -s)"
case "$OS" in
  Darwin) ok "OS: macOS ($(sw_vers -productVersion 2>/dev/null || echo '?'))" ;;
  Linux)  ok "OS: Linux ($(uname -r))" ;;
  *)      fail "OS: nepodprt ($OS)" "Uporabi macOS ali Linux; za Windows zaženi preflight.ps1." ;;
esac

# 2) git
if command -v git >/dev/null 2>&1; then
  ok "git: $(git --version | awk '{print $3}')"
else
  fail "git ni nameščen" "macOS: 'xcode-select --install'. Linux: namesti prek upravitelja paketov."
fi

# 3) Node >= 20
if command -v node >/dev/null 2>&1; then
  NODE_RAW="$(node -v 2>/dev/null)"            # npr. v22.3.0
  NODE_MAJOR="$(printf '%s' "$NODE_RAW" | sed -E 's/^v?([0-9]+).*/\1/')"
  if [ "${NODE_MAJOR:-0}" -ge 20 ] 2>/dev/null; then
    ok "Node $NODE_RAW (≥ 20)"
  else
    fail "Node $NODE_RAW je prestar (potrebno ≥ 20)" "Glej 02-claude-code-node.md za posodobitev."
  fi
else
  fail "Node ni nameščen" "Glej 02-claude-code-node.md."
fi

# 4) bun
if command -v bun >/dev/null 2>&1; then
  ok "bun: $(bun --version 2>/dev/null)"
else
  fail "bun ni nameščen" "Zaženi: curl -fsSL https://bun.sh/install | bash  (glej 02-claude-code-node.md)."
fi

# 5) gh auth
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    ok "gh auth: prijavljen"
  else
    fail "gh: nameščen, a NI prijavljen" "Zaženi: gh auth login  (glej 03-github.md)."
  fi
else
  fail "GitHub CLI (gh) ni nameščen" "Glej 03-github.md."
fi

# 6) Claude Code
if command -v claude >/dev/null 2>&1; then
  CLAUDE_VER="$(claude --version 2>/dev/null | head -n1)"
  ok "Claude Code: ${CLAUDE_VER:-nameščen}"
  dim "     (po potrebi poženi 'claude doctor' za podrobno diagnostiko)"
else
  fail "Claude Code (claude) ni na PATH" "Glej 02-claude-code-node.md."
fi

# 7) omrežje do ključnih storitev
NET_HOSTS="github.com vercel.com supabase.com openrouter.ai api.telegram.org"
NET_BAD=()
for h in $NET_HOSTS; do
  if ! curl -fsS --max-time 6 -o /dev/null "https://$h" 2>/dev/null; then
    NET_BAD+=("$h")
  fi
done
if [ "${#NET_BAD[@]}" -eq 0 ]; then
  ok "omrežje: dostop do vseh 5 storitev"
else
  fail "omrežje: ni dostopa do ${NET_BAD[*]}" "Preveri internet / VPN / požarni zid."
fi

# 8) disk + RAM
DISK_OK=1
DISK_FREE_KB="$(df -Pk "$HOME" 2>/dev/null | awk 'NR==2{print $4}')"
DISK_FREE_GB=$(( ${DISK_FREE_KB:-0} / 1024 / 1024 ))
if [ "$OS" = "Darwin" ]; then
  RAM_GB=$(( $(sysctl -n hw.memsize 2>/dev/null || echo 0) / 1024 / 1024 / 1024 ))
else
  RAM_KB="$(awk '/MemTotal/{print $2}' /proc/meminfo 2>/dev/null || echo 0)"
  RAM_GB=$(( RAM_KB / 1024 / 1024 ))
fi
if [ "$DISK_FREE_GB" -ge 5 ]; then
  ok "disk/RAM: ${DISK_FREE_GB} GB prostora · ${RAM_GB} GB RAM"
else
  fail "premalo prostora na disku (${DISK_FREE_GB} GB, potrebno ≥ 5 GB)" "Sprosti prostor in poženi znova."
fi

echo
if [ "$PASS" -eq 8 ]; then
  green "PRE-FLIGHT GREEN (8/8)"
  green "Naprava je pripravljena. Posnetek zaslona daj v Discord."
  exit 0
else
  red "PRE-FLIGHT: $PASS/8 — manjka: ${FAILED[*]}"
  dim "Popravi rdeče točke zgoraj (vsaka ima namig), nato poženi znova."
  dim "Če se zatakneš za > 10 min, glej rezervno lestev v 10-preflight-in-izhodna-vrata.md."
  exit 1
fi
