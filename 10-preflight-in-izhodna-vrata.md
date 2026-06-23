<!-- Summary: station 9 — run the preflight script; the Day-1 exit gate checklist; the 10-minute fallback ladder. -->
# 10 · Pre-flight + izhodna vrata Dneva 1

> **Agent:** zadnja postaja. Zaženi `preflight`, nato z uporabnikom preveri izhodna vrata. Če kaj manjka, povej *kaj* in *kam* po pomoč — ne pusti rdeče točke brez načrta.

## Zakaj
Ena skripta v eni minuti pove, ali je naprava pripravljena. **Izhodna vrata** so kontrolni seznam, ki ga vsak izpolni, preden odide — da v torek zjutraj ni več nastavitev.

## Koraki
```bash
./preflight.sh        # zaženi iz mape s skripto (preflight.sh / preflight.ps1)
```
Skripta preveri **8 stvari**: OS, `git`, Node ≥ 20, `bun`, `gh auth`, Claude Code + `claude doctor`, omrežje do github.com / vercel.com / supabase.com / openrouter.ai / api.telegram.org, ter disk/RAM. Zeleni izid je vrstica `PRE-FLIGHT GREEN (8/8)`. **Posnetek zaslona daj v Discord.** Sledi še **ročni seznam** (računi, OpenRouter ključ z omejitvijo, Claude Pro, Telegram `@username`, Obsidian, identitetne datoteke, izbrani primeri).

## Izhodna vrata Dneva 1 (preveri vse)
- ✅ zelena `preflight` skripta
- ✅ **svoj zaseben GitHub repo z vsaj enim pushanim commitom**
- ✅ vsi računi preverjeni in povezani (GitHub · Vercel · Supabase · Resend · Sentry · OpenRouter · Telegram · Claude Pro)
- ✅ **spend capi postavljeni** (OpenRouter `hard limit` + Anthropic mesečni cap)
- ✅ dopolnjene **identitetne datoteke** (vse tri)
- ✅ določen **par** za teden

## Če se zatakne — pravilo 10 minut
Če lokalne težave ne rešiš v **10 minutah**, ne razhroščuj v nedogled — preklopi po **rezervni lestvi**:
1. ponovno zaženi terminal, znova zaženi `preflight`,
2. začasno se spari z delujočim sosedom (njegova naprava, tvoji računi),
3. **GitHub Codespaces** (Claude Code + Node že nameščena; za Dan 1–3 dovolj),
4. **nadomestni prenosnik** (preflight zelen; ti se prijaviš s **svojimi** računi),
5. rdeča namestitev → ostani **popoldne na 1:1**; v torek zjutraj ni več prostora za nastavitve.

> Polno rezervno lestev hrani facilitatorjev paket (`fallback-troubleshooting.md`).
