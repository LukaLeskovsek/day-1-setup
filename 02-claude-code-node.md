<!-- Summary: station 1 — install/verify the local toolchain (Claude Code + Node + GitHub CLI). -->
# 02 · Claude Code + Node + GitHub CLI — tvoja delovna miza

> **Agent:** to je orodje, s katerim bomo delali ves teden. Najprej razloži, *kaj* je vsako, nato preveri, da je nameščeno. Večina je narejena že v predpripravi — danes **preverimo in dopolnimo**.

## Zakaj
- **Claude Code** je agent v terminalu, ki piše kodo namesto tebe. Ti ga vodiš z besedami.
- **Node** je „motor", ki poganja kodo (in Claude Code) na tvoji napravi.
- **GitHub CLI (`gh`)** poveže tvojo napravo s tvojim GitHub računom.

## Kako je povezano
**Claude Pro** poganja Claude Code (`07-...`). `gh` te prijavi v GitHub (`03-...`), kar pozneje uporabita tudi Vercel in Supabase.

## Koraki

### macOS
```bash
xcode-select --install                 # razvojna orodja (če že so: "already installed" je v redu)
# Node ≥ 20: prenesi LTS z https://nodejs.org in zaženi namestitev, nato:
node --version                         # pričakuj v20+ ali v22+
npm install -g @anthropic-ai/claude-code
claude --version && claude doctor      # ob prijavi izberi svoj Claude Pro račun
brew install gh                        # ali namestitev z https://cli.github.com
gh auth login                          # izberi GitHub.com → HTTPS → prijava prek brskalnika
curl -fsSL https://bun.sh/install | bash   # bun (za bazo znanja, Dan 5)
```
*Če `npm install` pade zaradi dovoljenj:* `curl -fsSL https://claude.ai/install.sh | bash`

### Windows (prek WSL2)
```powershell
wsl --install        # v PowerShell kot skrbnik; nato ponovni zagon + nastavi Ubuntu uporabnika
```
```bash
# nato znotraj Ubuntu (WSL) terminala:
sudo apt update && sudo apt install -y curl git
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt install -y nodejs
npm install -g @anthropic-ai/claude-code && claude --version && claude doctor
sudo apt install -y gh && gh auth login
curl -fsSL https://bun.sh/install | bash
```

## Varnost
Claude Code teče **lokalno** na tvoji napravi in ničesar ne objavi brez tebe. `gh auth login` shrani prijavo varno v sistem — gesla ne tipkaš v kodo.

## Končano, ko
`node --version` kaže ≥ 20 · `claude --version` deluje in `claude doctor` je čist · `gh auth status` je v redu.

## Če se zatakne
- **`claude` ni najden** po namestitvi → ponovno zaženi terminal (na Windows: WSL terminal).
- **Službena naprava** (MDM / brez skrbniških pravic) blokira namestitev → javi v Discordu **pred ponedeljkom**; rezerva je Codespaces ali nadomestni prenosnik.
- **Prijava ni Claude Pro** → Claude Code se ne zažene; potreben je Pro (`07-...`).
- Velja **pravilo 10 minut** — glej `10-...` za rezervno lestev.
