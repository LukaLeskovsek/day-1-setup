<!-- Summary: station 5 — Resend (transactional email) + Sentry (errors); both keys are secrets. -->
# 06 · Resend (pošta) + Sentry (napake)

> **Agent:** dve hitri postaji skupaj. Obe sta „kupi, ne gradi" storitvi varnostne mreže. Oba ključa sta skrivnosti.

## Zakaj
- **Resend** pošilja **prijavne maile** tvoje aplikacije (npr. potrditveno povezavo). Lastnega poštnega strežnika nikoli ne postavljaš.
- **Sentry** ti pove, **da je aplikacija crknila — preden ti pove stranka**, in s podrobnostmi napake.

## Kako je povezano
Resend je priklopljen v Supabase prijavo (`05-...`). Sentry beleži napake iz aplikacije, ko teče na Vercelu (`04-...`).

## Koraki
1. **Resend:** resend.com → registracija z emailom → odpre se stran **API Keys**. **Domene ne preverjaj** — delavnica uporablja *test sender*, ki dostavi **le na tvoj lastni email** (dovolj, ker aplikacija piše prijavljenemu uporabniku).
2. **Sentry:** sentry.io → registracija z emailom → brezplačni **Developer** plan → platforma **Next.js** (čarovnika **ne dokončaj** — predloga to uredi). Nastane organizacija.

## Varnost
Resend **API key** in Sentry **DSN** sta skrivnosti → živita v `.env` / Vercel nastavitvah, **nikoli v kodi** ali v tem klepetu.

## Končano, ko
Resend **API Keys** stran je odprta · Sentry **organizacija** je ustvarjena (platforma Next.js izbrana).

## Če se zatakne
- **Resend ključ neveljaven** → ustvari novega v Resend nadzorni plošči (workshop = test sender, domena ni potrebna).
- *(Dan 2)* **Sentry prazen** → manjka DSN `env` v Vercel; sproži testno napako po ponovnem deployu.
