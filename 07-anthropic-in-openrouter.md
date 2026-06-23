<!-- Summary: station 6 (security-critical) — Claude Pro + Anthropic cap + OpenRouter key with a HARD LIMIT. -->
# 07 · 🔒 Claude Pro + OpenRouter — AI dostop in spend cap

> **Agent:** to je **varnostno najobčutljivejša postaja**. Ne preskoči **hard limita** na OpenRouter ključu, tudi če uporabnik hiti. Pokaži „spend-cap model" (`diagrami.md` §3).

## Zakaj
- **Claude Pro** poganja **Claude Code** (tvojo delovno mizo). Brez njega se Claude Code ne prijavi.
- **OpenRouter** je en račun, en ključ, dostop do mnogih modelov. Uporablja ga tvoj **agent (Hermes, Dan 4)** in **AI v tvoji aplikaciji (Dan 2–3)**.

## Kako je povezano
Claude Pro ≠ OpenRouter: Pro je za Claude Code (nespremenjeno), OpenRouter je ločen, merjen dostop do modelov za agenta in aplikacijo. **Isti** capped OpenRouter ključ pozneje uporabita oba.

## Koraki
1. **Claude Pro** (claude.ai, ~€18 + DDV/mesec) — običajno že iz predpriprave; `claude` se prijavi s tem računom.
2. **Anthropic spend cap:** v Anthropic konzoli nastavi **mesečno omejitev porabe** (privzeto npr. €50).
3. **OpenRouter ključ + HARD LIMIT** (kritičen korak):
   - openrouter.ai → **Keys → Create Key**, poimenuj `hermes-workshop`.
   - **Ključu nastavi `hard limit`** (npr. €10–20). *To je bistvo: omejen ključ ne more preseči zneska — tudi ob napaki ali zlorabi.*
   - Do **srede** naloži za **€10–20** kredita (potreben v četrtek zjutraj).
   - Ključ shrani v `~/.hermes/.env` — **nikoli v klepet, nikoli v git, nikoli v bazo znanja.**
4. Privzeti model je na facilitatorjevem slajdu (določen ob pripeti verziji Hermesa). Hermes potrebuje model z **≥ 64k** konteksta.

## Varnost
- **`hard limit` = trda zgornja meja.** Brez njega ključ lahko troši brez konca — zato ga **ne preskočimo**.
- OpenRouter ključ je **server-only**; nikoli v brskalnik, nikoli s predpono `NEXT_PUBLIC_`.
- Porabo spremljaš na OpenRouter nadzorni plošči (Activity); tipična delavniška raba so centi na pogovor. Nenavadnosti → kanal `#cost-and-safety`.

## Končano, ko
`claude` prijavljen · Anthropic mesečni cap postavljen · OpenRouter **ključ obstaja in ima `hard limit`** (kredit lahko dopolniš do srede).

## Če se zatakne
- **OpenRouter ključ mrtev / brez kredita** → dopolni kredit; vmes facilitator ponudi *capped loaner* ključ (vrneš isti dan).
- **Model zavrnjen ob zagonu** → premajhen kontekst; preklopi na delavniški privzeti model.
