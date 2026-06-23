<!-- Summary: station 3 — Vercel: sign up with GitHub, the push=deploy link, deployment-protection note (Day 2). -->
# 04 · Vercel — kako gre aplikacija na splet

> **Agent:** danes le ustvarimo/povežemo račun. Sam uvoz repa in objava prideta v torek, ko imaš repo. Razloži „push = objava".

## Zakaj
Vercel vzame tvojo kodo iz GitHuba in jo **postavi na javni naslov** — s certifikatom, domeno in vsem. **Ne objavljaš ročno: `push` na GitHub *je* objava.**

## Kako je povezano
Vercel se **prijavi prek GitHuba** in **gleda tvoj repo**: vsak `push` v vejo `main` samodejno posodobi živo stran (`diagrami.md` §2).

## Koraki
1. Pojdi na vercel.com → **Continue with GitHub** → izberi **Hobby (brezplačno)**.
2. Počakaj, da se odpre nadzorna plošča (dashboard).
3. *(Torek, Dan 2)* uvoz repa: **Add New → Project** → izbereš svoj repo → prilepiš `env` vrednosti → **Deploy**.

## Varnost
- **Skrivnosti (`env`)** vneseš v **Vercel nastavitve**, nikoli v kodo.
- **Dve ločeni nastavitvi:** tvoj **repo je zaseben**, tvoja **spletna stran je javna**. Po prvem deployu (Dan 2) v *Settings → Deployment Protection* **izklopiš „Vercel Authentication"**, da naslov lahko odpre tudi par — to je najpogostejša „tiha napaka", če ostane vklopljeno.

## Končano, ko
Vercel nadzorna plošča se odpre in si **prijavljen prek GitHuba**.

## Če se zatakne
- *(Dan 2)* **Build pade** (rdeč ✗) → prilepi Vercel build log Claudu; loge bere bolje od človeka.
- Stran se na živo vede drugače kot lokalno → manjka `env` vrednost v Vercel nastavitvah (primerjaj z `.env.example`).
