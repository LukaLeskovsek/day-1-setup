<!-- Summary: agent-guided, security-first, step-by-step Day-1 setup walkthrough (Slovenian) for cohort founders. -->
# Dan 1 — vodeni zagon s pomočjo agenta

Ta mapa je **vodič po korakih za prvi dan**: agent (Claude Code) te po vrsti popelje skozi namestitev in nastavitev vseh orodij in računov — **varno**, z razlago, *zakaj* vsak korak obstaja in *kako se povezuje* z ostalimi.

**Za koga:** netehnične ustanoviteljice in ustanovitelji v kohorti SPS AI Accelerator. Ničesar ti ni treba znati na pamet — agent vodi, ti razumeš, odločaš in potrjuješ.

---

## Kako ga uporabiš

1. Odpri to mapo v **Claude Code** (v terminalu zaženeš `claude` znotraj te mape).
2. Reci agentu: **„Začniva Dan 1."** Agent prebere `CLAUDE.md` in te pelje postajo za postajo.
3. Na vsaki postaji agent **razloži zakaj**, **predlaga ukaze**, jih po tvoji potrditvi **zažene** in **preveri**, da je res končano — šele nato gremo naprej.

> Datoteke so napisane tudi za samostojno branje — če nimaš agenta pri roki, jih lahko prebereš sam po vrsti.

---

## Pot (vrstni red postaj)

| # | Datoteka | Postaja |
|---|---|---|
| – | [`00-pregled.md`](00-pregled.md) | Velika slika: kaj postavljamo danes in kako se vse poveže |
| 🔒 | [`01-varnost-najprej.md`](01-varnost-najprej.md) | Varnostni model — preberi najprej, velja povsod |
| 1 | [`02-claude-code-node.md`](02-claude-code-node.md) | Claude Code + Node + GitHub CLI (tvoja delovna miza) |
| 2 | [`03-github.md`](03-github.md) | GitHub — dom in zgodovina tvoje kode |
| 3 | [`04-vercel.md`](04-vercel.md) | Vercel — kako gre aplikacija na splet |
| 4 | [`05-supabase.md`](05-supabase.md) | Supabase — prijava + baza |
| 5 | [`06-resend-in-sentry.md`](06-resend-in-sentry.md) | Resend (pošta) + Sentry (napake) |
| 6 | [`07-anthropic-in-openrouter.md`](07-anthropic-in-openrouter.md) | Claude Pro + OpenRouter — AI dostop in **spend cap** |
| 7 | [`08-telegram.md`](08-telegram.md) | Telegram — kako boš dosegel agenta (priprava) |
| 8 | [`09-identitetne-datoteke.md`](09-identitetne-datoteke.md) | `PERSON.md` / `COMPANY.md` / `BRAND.md` |
| ✅ | [`10-preflight-in-izhodna-vrata.md`](10-preflight-in-izhodna-vrata.md) | Pre-flight skripta + izhodna vrata Dneva 1 |
| 🖼 | [`diagrami.md`](diagrami.md) | Vsi diagrami in tokovi na enem mestu |

---

## Zlato varnostno pravilo (velja na vsaki postaji)

- **Skrivnosti (API ključi, gesla) nikoli ne gredo v kodo, v klepet ali v skupni dokument.** Živijo samo v `.env` datotekah na tvoji napravi in v nastavitvah storitev. → [`01-varnost-najprej.md`](01-varnost-najprej.md)
- **Vsak ključ, ki lahko troši denar (OpenRouter, Anthropic), dobi `spend cap`.** Omejen ključ ne more presenetiti računa.
- **Vsi računi so tvoji lastni.** Program ne uporablja skupnih.

---

## Cilj Dneva 1

Ob koncu imaš:
- zeleno `preflight` skripto (naprava pripravljena),
- svoj **zaseben GitHub repo s prvim commitom** (in znaš prebrati svojo zgodovino),
- vse račune preverjene in povezane, s **spend capi** tam, kjer se troši,
- dopolnjene **identitetne datoteke**,
- določenega para — pripravljen na torkovo gradnjo.

> **Jezik:** slovenščina + uveljavljeni angleški strokovni izrazi (Claude Code, GitHub, repo, commit, push, deploy, spend cap, API key, RLS, service account …). Besedilo je delovni osnutek; pred uporabo priporočamo pregled domačega govorca.
