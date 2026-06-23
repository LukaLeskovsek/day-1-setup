<!-- Summary: all Day-1 diagrams and flows in one place — architecture, GitHub→Vercel pipeline, secrets/spend-cap model, agent loop, station flow. -->
# Diagrami in tokovi

> **Agent:** pokaži ustrezni diagram ob razlagi. Vsi so preprosti — namen je razumevanje, ne popolnost.

## 1. Arhitektura — kako se vse poveže

```mermaid
flowchart LR
  U["ti + Claude Code<br/>(terminal)"] --> R["tvoj GitHub repo<br/>(koda + zgodovina)"]
  R -->|push| V["Vercel<br/>(javni naslov)"]
  V --> APP["tvoja aplikacija (v živo)"]
  APP --> S["Supabase<br/>prijava + baza"]
  APP --> RE["Resend<br/>pošta"]
  APP --> SE["Sentry<br/>napake"]
  APP --> OR["OpenRouter → Claude<br/>AI v aplikaciji"]
  CP["Claude Pro"] -. poganja .-> U
```

## 2. Cevovod GitHub → Vercel (push = objava)

```mermaid
flowchart LR
  T["„Use this template"<br/>→ tvoj zaseben repo"] --> C["commit<br/>= shranjevalna točka"]
  C --> P["push"]
  P --> D["Vercel objavi<br/>(~1 min)"]
  C -. "revert ←" .-> H["zgodovina"]
  R2["veja"] -. "→ preview naslov" .-> PV["zasebni testni naslov"]
```

Produkcija je vedno veja `main`. Tvegano spremembo narediš na **veji** (dobiš testni `preview` naslov), nato jo Claude združi v `main`. Razveljaviš z **`revert`** — nikoli `reset --hard` ali force-push.

## 3. Varnostni / spend-cap model

```mermaid
flowchart TB
  K["API ključ / skrivnost"] --> ENV[".env (lokalno) + nastavitve storitve"]
  K -. NIKOLI .-> CODE["koda · git · klepet · skupni dokument"]
  SPEND["ključ, ki troši<br/>OpenRouter · Anthropic"] --> CAP["spend cap<br/>trda zgornja meja"]
  style CODE fill:#fff4f4,stroke:#d32f2f,color:#111
  style CAP fill:#fff8ee,stroke:#f57c00,color:#111
```

## 4. Krog agenta (velja za Claude Code in Hermes)

```mermaid
flowchart LR
  RD["READ"] --> PL["PLAN"] --> AC["ACT"] --> OB["OBSERVE"] --> IT["ITERATE"] --> RD
```

`context` (kaj ve) · `boundaries` (kaj sme) · `caps` (kako daleč). Načini: `HITL → Supervised → Autonomous` (ta teden ostajamo levo).

## 5. Postaje Dneva 1 (vrstni red)

```mermaid
flowchart LR
  A["Claude Code<br/>+ Node + gh"] --> B["GitHub"] --> C["Vercel"] --> D["Supabase"] --> E["Resend + Sentry"] --> F["Claude Pro<br/>+ OpenRouter (cap!)"] --> G["Telegram"] --> H["identitetne<br/>datoteke"] --> I["preflight ✅"]
```

Odvisnosti: v **Vercel** in **Supabase** se prijaviš *prek* **GitHuba**; **Claude Pro** poganja **Claude Code**; **OpenRouter** dobi `spend cap` takoj.
