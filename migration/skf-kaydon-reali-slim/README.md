# SKF Kaydon Reali-Slim&reg; Ball Bearings — HubSpot Migration Package

## What this is

| Field | Value |
|-------|-------|
| Source | `https://www.applied.com/skf-kaydon-reali-slim-ball-bearings` |
| Target template | AIH Applied LP — 7-section spec (`.claude/skills/page-migration/references/applied-lp-template-spec.md`) |
| Page slug | `skf-kaydon-reali-slim` |
| Wrapper | `<main id="applied-lp">` |
| Build mode | Reorganization only — no copy edits to source text |

## Install (3 steps)

1. **Paste `HEAD.html`** into HubSpot → Page Settings → Advanced Options → Head HTML.
2. **Paste `FOOTER.html`** into the same panel → Footer HTML.
3. **Paste `SOURCE.html`** into the page body.

Brand tokens, font (DIN 2014), and button styles are loaded globally — `HEAD.html` does not redeclare them.

## Bracketed placeholders to fill in

The scraper did not capture CTA destinations or image URLs, and the source page has no headlines for sections 3, 4, and 7. Replace every `[bracketed value]` before publishing. Find/replace cheat-sheet:

### HEAD.html
- `[Hero Background Image URL]`
- `[Dark CTA Background Image URL]`
- `[Meta description, ≤155 chars]` (×2 — one per og:description / description)
- `[Hero Image URL]` (og:image)

### SOURCE.html — by section
- **Section 1 (hero)**: `[Hero Primary CTA URL]`, `[Hero Primary CTA Label]`, `[Hero Secondary CTA URL]`, `[Hero Secondary CTA Label]`
- **Section 2 (trust strip)**: `[Brand Logo URL]` — SKF Kaydon logo. Defaults already set: "Authorized Distributor" + "Available Online".
- **Section 3 (image left)**: `[Section 3 Image URL]`, `[Section 3 Image Alt Text]`, `[Section 3 Headline]`, `[Section 3 CTA URL]`, `[Section 3 CTA Label]`
- **Section 4 ("Why SKF Kaydon?")**: `[Why SKF Kaydon? — Section 4 Headline]`, `[Section 4 Image URL]`, `[Section 4 Image Alt Text]`, `[Why-block bullet 1–3]`
- **Section 5 (tiles)**: no placeholders — fully filled from source content.
- **Section 6 (disclaimer)**: no placeholders — verbatim from source.
- **Section 7 (dark CTA)**: `[Dark CTA Headline]`, `[Dark CTA supporting copy]`, `[Dark CTA URL]`, `[Dark CTA Label]`

## Source-to-template mapping (no copy edits, reorganization only)

The source page returned 4 modules from the scraper. Mapped onto the 7-section template like this — see `01-source-inventory.md` for the full mapping table.

| Source | Template section |
|--------|------------------|
| Module 1 ¶1 | Section 1 — Hero subhead |
| Module 1 ¶2 | Section 3 — body |
| Module 1 ¶3 + ¶4 | Section 4 — body / Section 5 Tile 2 body |
| Module 2 — Features | Section 5 — Tile 1 (teal) |
| Module 3 — Applications | Section 5 — Tile 2 (grey) |
| Module 4 — Disclaimer | Section 6 |

## Open items

- All bracketed placeholders above (CTAs, image URLs, missing headlines).
- Source typo `instantly provide` was not present in this page (it was on a different SKF page). No copy issues flagged here.
- The scraper output was missing CTA destinations and image asset URLs — see the scraper-prompt update in chat for the fix.

## File tree

```
migration/skf-kaydon-reali-slim/
├── README.md
├── HEAD.html
├── FOOTER.html
├── SOURCE.html
└── 01-source-inventory.md
```
