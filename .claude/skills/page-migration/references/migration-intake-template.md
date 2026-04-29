# Migration Intake Template

Drop a filled copy of this template (Word doc, Markdown, or pasted text) at the start of a migration. If every field is filled, no clarifying questions are needed and the rebuild can run end-to-end.

The scraper agent should output content in this exact shape so it can be handed off without manual reformatting.

---

## 1. Project metadata

- **Page slug** (kebab-case): `___`
- **Source URL**: `___`
- **Target template**: AIH Applied LP — 7-section spec (`references/applied-lp-template-spec.md`)
- **Brand to preserve**: `___` (e.g. SKF, Dodge, Boston Gear)
- **Hero background**: light / dark
- **Page title** (`<title>`): `___` (≤ 60 chars)
- **Meta description**: `___` (≤ 155 chars)
- **OG image**: image #`__` from inventory below

## 2. Copy (in source order, by section)

Use the literal labels below. The skill maps these onto the 7-section template; sections without source content get bracketed placeholders.

```
## Section 1 — Hero
Eyebrow:        (optional)
H1:             ___
Subhead:        ___
CTA primary:    ___ → https://___
CTA secondary:  ___ → https://___
Image:          #__

## Section 2 — Trust strip
Brand logo:     #__ (links to https://___ or "no link")
Item 2 label:   Authorized Distributor   (or override)
Item 3 label:   Available Online         (or override)

## Section 3 — Image+text LEFT (first product overview)
H3:             ___
Body:           ___
Bullets (optional):
  • ___
  • ___
CTA (optional): ___ → https://___
Image:          #__

## Section 4 — Image+text RIGHT ("Why [Brand]?")
H3:             Why ___?
Body:           ___
Bullets:
  • ___
Image:          #__

## Section 5 — Tile repeater (Features & Applications)
Sidebar heading:  Features & Applications   (or override)
Tile 1 (teal) — Features
  H3:           ___
  Bullets:
    • ___
Tile 2 (grey) — Applications
  H3:           ___
  Bullets:
    • ___

## Section 6 — Disclaimer
Body:           ___ (or "use Applied default supplier disclaimer")

## Section 7 — Dark CTA banner
H2:             ___
Body:           ___
CTA:            ___ → https://___
Background:     #__
```

## 3. Images

| # | Source URL | Alt text | Role | Section | Notes |
|---|-----------|----------|------|---------|-------|
| 1 | https://… | "…" | hero bg | 1 | full-bleed |
| 2 | https://… | "…" | brand logo | 2 | SVG preferred |
| 3 | https://… | "…" | product LEFT | 3 | |
| 4 | https://… | "…" | product RIGHT | 4 | |
| 5 | https://… | "…" | dark CTA bg | 7 | needs dark overlay |

If a source image's URL is unknown, leave the cell as `[unknown]` — the rebuild will use a bracketed placeholder.

## 4. Forms

`None.` — or:

```
Form embed:    HubSpot
Form ID:       ___
Fields:        ___, ___, ___
Submit label:  ___
Redirect:      https://___
Placement:     Section __  (or "above the fold" / "final CTA")
```

## 5. Notes / decisions

- Preserve source typos verbatim? `Yes / No`
- Add `target="_blank"` to external CTAs? `Yes / No`
- Sections without source content: `bracketed placeholders` (default) / `skip silently`
- Anything else: `___`
