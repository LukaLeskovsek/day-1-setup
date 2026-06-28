<!-- Summary: station 7 — Telegram: Day-1 part is just installing the app; the bot + pairing bridge is Day-4, safety-gated. -->
# 08 · Telegram — kako boš dosegel agenta (priprava)

> **Agent:** danes le namestitev Telegrama. **Mostu ne postavljamo** — to je četrtkova naloga, šele po varnostnem okviru. Povej, *zakaj* je most občutljiv.

## Zakaj
V četrtek (Dan 4) bo tvoj agent (Hermes) **dosegljiv s telefona** prek Telegrama: napišeš mu, on prebere, premisli in odgovori — ali **predlaga** dejanje, ki ga odobriš. Danes le namestimo aplikacijo.

## Kako je povezano
Most je le **kanal** do agenta. Agent dobi modele prek OpenRouterja (`07-...`) in znanje iz baze (Dan 5). Most postavimo **po** varnostnem okviru (`01-...`), nikoli prej.

## Koraki
1. Namesti **Telegram** (telefon in/ali računalnik).
2. To je vse za danes. V četrtek (po varnostnem okviru) ustvarimo bota prek **@BotFather**, ga povežemo z `hermes gateway setup` in odobrimo **samo tvoje** parjenje (`hermes pairing approve`).

## Varnost (velja v četrtek)
- **Odobriš samo sebe** (`hermes pairing approve`) — nikogar drugega. Ne sodelavec, ne „ekipa", ne skupina. En agent, en lastnik.
- **Dohodna sporočila so nezaupanja vreden vhod** — lahko poskušajo agenta pretentati (prompt injection). Most sme sprožiti **branje in predlog, nikoli neodobrenega zapisa**.
- Prek mostu nikoli ne pošiljaš gesel ali ključev. **Bot token** (iz @BotFather) je geslo — nikoli v klepet ali v kodo.

## Končano, ko
Telegram je nameščen. *(Bota in parjenje postavimo v četrtek.)*

## Če se zatakne
- *(Dan 4)* Telegram blokiran na omrežju prizorišča → telefonski hotspot (facilitator ima pripravljeno rezervo).
