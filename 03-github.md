<!-- Summary: station 2 — GitHub as code home + history; Use-this-template → own private repo; first commit; three safe verbs. -->
# 03 · GitHub — dom in zgodovina tvoje kode

> **Agent:** to je varnostna mreža celega tedna. Razloži „commit = shranjevalna točka", potem skupaj naredita prvi commit. Pokaži diagram cevovoda (`diagrami.md` §2).

## Zakaj
GitHub je dvoje hkrati: **dom tvoje kode** (en repo = celotna aplikacija) in **njena zgodovina** — vsak `commit` je posnetek, na katerega se lahko **vrneš**. Prav to naredi varno, da agent piše in popravlja kodo: če kaj pokvari, greš nazaj na zadnjo dobro točko.

## Kako je povezano
V **Vercel** in **Supabase** se prijaviš *prek* GitHuba. Vercel pozneje **gleda tvoj repo** in ob vsakem `push` objavi aplikacijo (`04-...`, `diagrami.md` §2).

## Koraki
1. Preveri prijavo na github.com (uporabniško ime = podjetje ali tvoje ime, z malimi črkami).
2. Če `gh auth status` še ni urejen, zaženi `gh auth login` (GitHub.com → HTTPS → brskalnik).
3. **Naredi svoj repo — „Use this template".** Na github.com odpri predlogo → **„Use this template" → Create a new repository** → nastavi **Private** → poimenuj. To je *tvoja* kopija (ne naša), vanjo lahko pošiljaš spremembe.
4. Kloniraj **svoj** repo in naredi **prvi commit** (npr. majhna sprememba v `README`), nato `push`. Agent ti pokaže ukaze; ti potrdiš.
5. Na github.com odpri **zavihek Commits** in si oglej svoj commit — to je tvoja zgodovina.

## Trije varni glagoli
- **commit** = shranjevalna točka.
- **branch + preview** = varno preizkusi tvegano spremembo (dobiš zasebni testni naslov).
- **revert** = vrni se na zadnjo dobro točko.

Združitev veje v `main` naredi **Claude lokalno — brez „pull requesta"** (solo poteka; PR je timska stvar za pozneje). Branje stare kode na github.com → zavihek **Commits**.

## Varnost
- Repo je **zaseben**. Skrivnosti (`.env`) **nikoli** ne gredo vanj — `.gitignore` to že preprečuje.
- **NIKOLI** `git reset --hard` ali `git push --force` — za razveljavitev uporabiš **`revert`** (vedno varno).

## Končano, ko
Pod tvojim računom obstaja **zaseben repo**, vanj je **pushan vsaj en commit**, in znaš odpreti zavihek Commits.

## Če se zatakne
- **`push` zavrnjen / „authentication failed"** → naprava še ni prijavljena: `gh auth login` (ali HTTPS token), nato znova `push`.
- Več podrobnosti o varnih glagolih: handout `day-1-github-basics.md`.
