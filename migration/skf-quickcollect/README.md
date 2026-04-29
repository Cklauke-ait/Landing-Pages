# SKF QuickCollect™ — HubSpot Migration Package

## What this is

| Field | Value |
|-------|-------|
| Source | SKF QuickCollect™ landing page on Applied.com (copy + images supplied by user) |
| Target template | DeWalt Atomic 20V Max landing page (`https://content.applied.com/dewalt-atomic-20v-max`) |
| Styleguide | AIH landing-page styleguide (teal `#007b85` + navy `#201c52`, DIN 2014, 4px radius / 50px pills) |
| Page slug | `skf-quickcollect` |
| Wrapper namespace | `.aih-lp` |
| Modules built | hero, trust-badge, product-intro, features (4 of 6 requested; videos skipped — none in source; service-center to be inserted by user) |

## Install (3 steps)

1. **Paste `HEAD.html`** into the HubSpot page → Settings → Advanced Options → Head HTML.
2. **Paste `FOOTER.html`** into the same panel → Footer HTML.
3. **Paste each `modules/module-NN-*.html` file** into the page builder in numeric order (01 → 04). Each module is independently insertable; drop your service-center module wherever it belongs.

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

## Font note

`HEAD.html` declares `font-family: 'DIN 2014', sans-serif` but does not import the webfont — the parent HubSpot template is expected to load it site-wide. If the rebuild renders in the system fallback, add a webfont link or `@font-face` block at the top of `HEAD.html`.

## Open content items

See `assets/qa-checklist.md` "Sign-off" section. Highlights:

- Source typo "instantly **provide** you with live readings" was kept verbatim. Decide whether to silently fix to "provides".
- Page `<title>`, meta description, OG image — set in HubSpot Page Settings.
- Final SKF logo SVG — supply approved version.
- Two added strings flagged in `assets/copy-deck.md`: trust-badge eyebrow "Featured Manufacturer" and product-intro H2 "A smart vibration tool, made simple".

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
