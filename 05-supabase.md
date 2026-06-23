<!-- Summary: station 4 — Supabase: sign up with GitHub, auth+DB+RLS, the two key kinds. -->
# 05 · Supabase — prijava + baza

> **Agent:** danes le ustvarimo/povežemo račun (prek GitHuba). Sam projekt, RLS in izklop email-potrditve so del torkove predloge — danes razloži *koncept*, ne ustvarjaj projekta.

## Zakaj
Supabase ti da **prijavo uporabnikov** in **bazo podatkov**, ne da bi ju gradil sam. Njegovo srce je **RLS (row-level security)**: *baza sama zavrne, da bi uporabniku A pokazala vrstice uporabnika B — tudi če je v aplikaciji napaka.* Kot bančni trezor: pravilo je v trezorju, ne pri okencu.

## Kako je povezano
Prijaviš se **prek GitHuba**. Tvoja aplikacija (Dan 2) jo uporablja za prijavo; **Resend** je priklopljen, da prijavni maili pridejo (`06-...`).

## Koraki
1. Pojdi na supabase.com → **Continue with GitHub** → odpre se nadzorna plošča.
2. **Projekta še ne ustvarjaj** — to naredimo v torek z predlogo (takrat tudi izklopimo email-potrditev in naložimo shemo z RLS).

## Varnost — dve vrsti ključev (pomembno)
- **`anon` (javni) ključ:** sme v brskalnik; varujejo ga **RLS** pravila.
- **`service-role` (skrivni) ključ:** **samo na strežniku**, nikoli v brskalnik, nikoli s predpono `NEXT_PUBLIC_`. Obide RLS, zato ga uporabljamo le za nadzorovane skrbniške operacije.

## Končano, ko
Supabase nadzorna plošča se odpre in si **prijavljen prek GitHuba**. (Projekt ustvariš v torek.)

## Če se zatakne
- *(Dan 2)* **prijavni / magic-link mail ne pride** → preveri spam → nato `env` vrednosti v Vercel → Supabase auth dnevnik.
