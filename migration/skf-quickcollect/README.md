# SKF QuickCollect™ — HubSpot Migration Package

## What this is

| Field | Value |
|-------|-------|
| Source | SKF QuickCollect™ landing page on Applied.com (copy supplied by user) |
| HubSpot reference | `https://content.applied.com/dewalt-atomic-20v-max` *(unreachable from build env; visual specs assumed — see "Open visual TODOs" below)* |
| Page slug | `skf-quickcollect` |
| Wrapper namespace | `.applied-lp` |
| Modules built | hero, trust-badge, product-intro, features (4 of 6 requested; videos skipped — none in source; service-center to be inserted by user) |

## Install (3 steps)

1. **Paste `HEAD.html`** into the HubSpot page → Settings → Advanced Options → Head HTML.
2. **Paste `FOOTER.html`** into the same panel → Footer HTML.
3. **Paste each `modules/module-NN-*.html` file** into the page builder in numeric order (01 → 04). Each module is independently insertable; you can drop the user-supplied service-center module between 04 and the page bottom (or wherever it belongs).

## CDN swap

Every image `src` in this package uses the placeholder base path:

```
https://YOUR-PORTAL.fs1.hubspotusercontent-na1.net/hubfs/YOUR-PORTAL-ID/skf-quickcollect/
```

After uploading the four images to HubSpot Files, find/replace:

| Find | Replace with |
|------|--------------|
| `YOUR-PORTAL` | your HubSpot CDN subdomain (e.g. `12345.fs1`) |
| `YOUR-PORTAL-ID` | your HubSpot portal ID |

Files expected at `/skf-quickcollect/`:
- `skf-quickcollect-hero.jpg`
- `skf-logo.svg`
- `skf-quickcollect-in-use.jpg`
- `skf-quickcollect-sensor-callout.png` *(use the plain sensor photo without overlay numbers — the LED labels are now real HTML)*

## Open visual TODOs

The DeWalt reference page was unreachable from the build environment, so visual specs were assumed. Reconcile these against the live DeWalt template before publishing:

- `--applied-primary` (Applied red) — currently `#c8102e`. Override in `HEAD.html` if DeWalt template uses a different red or a different primary.
- `--applied-font-heading` / `--applied-font-body` — currently Inter via Google Fonts. Override if the DeWalt template uses a system stack or another foundry.
- Button radius (currently 4px) and padding — match the DeWalt CTA exactly if it differs.
- Section vertical padding (currently 4rem desktop / 2.5rem mobile).
- The trust-badge eyebrow text "Featured Manufacturer" was added (not in source). Replace or remove to match the DeWalt convention.

## Open content items

See `assets/qa-checklist.md` "Sign-off" section. Highlights:

- Source typo "instantly **provide** you with live readings" was kept verbatim. Decide whether to silently fix to "provides".
- Page `<title>`, meta description, OG image — set in HubSpot Page Settings.
- Final SKF logo SVG — supply approved version.

## New modules introduced

None — `hero`, `trust-badge`, `product-intro`, and `features` all map to existing catalog entries in `references/module-rebuild-rules.md`.

## File tree

```
migration/skf-quickcollect/
├── README.md
├── HEAD.html
├── FOOTER.html
├── 01-source-inventory.md
├── 02-target-conventions.md
├── modules/
│   ├── module-01-hero.html
│   ├── module-02-trust-badge.html
│   ├── module-03-product-intro.html
│   └── module-04-features.html
└── assets/
    ├── image-inventory.md
    ├── copy-deck.md
    └── qa-checklist.md
```
