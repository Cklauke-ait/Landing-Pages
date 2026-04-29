# Phase 2 — Target Conventions

The DeWalt reference page (`https://content.applied.com/dewalt-atomic-20v-max`) was unreachable from this environment (sandbox `host_not_allowed`). Per user direction, the rebuild uses **sensible Applied® landing-page defaults** wired to CSS custom properties so visual specs can be tuned in HubSpot without touching module markup.

Anything in this file is an **assumption to be validated** when the user pulls the package into HubSpot side-by-side with the DeWalt reference.

## Wrapper / namespace

- Top-level wrapper class: **`.applied-lp`**
- All custom properties scoped under `.applied-lp` (not `:root`) so the rebuild does not leak onto the rest of the HubSpot template.

## Color tokens (assumed)

| Token | Value | Use |
|-------|-------|-----|
| `--applied-primary` | `#c8102e` | Applied red — primary CTA bg, accent rules |
| `--applied-primary-hover` | `#9c0c23` | Primary CTA hover |
| `--applied-text` | `#1a1a1a` | Body and heading color |
| `--applied-text-muted` | `#5a5a5a` | Secondary text, captions |
| `--applied-bg` | `#ffffff` | Default section bg |
| `--applied-bg-alt` | `#f4f4f4` | Alt section bg (trust badge, features) |
| `--applied-border` | `#e0e0e0` | Hairline rules |
| `--applied-skf-blue` | `#0073cf` | SKF brand accent — used on LED indicator dots in the sensor callout |

## Typography (assumed)

| Use | Family | Size | Weight | Line-height |
|-----|--------|------|--------|-------------|
| H1 | `'Inter', 'Helvetica Neue', Arial, sans-serif` | 2.75rem (44px) | 700 | 1.1 |
| H2 | same | 2rem (32px) | 700 | 1.2 |
| H3 | same | 1.375rem (22px) | 600 | 1.3 |
| Body | same | 1.0625rem (17px) | 400 | 1.6 |
| Eyebrow | same | 0.8125rem (13px) | 600, uppercase, +1px letter-spacing | 1.2 |

Font is loaded once in `HEAD.html` from Google Fonts (Inter). Swap to the DeWalt template's actual font family by overriding `--applied-font-heading` / `--applied-font-body`.

## Buttons (assumed)

- **Primary**: solid `--applied-primary` bg, white text, 4px radius, padding `0.875rem 1.75rem`, weight 600, sentence case.
- **Secondary**: transparent bg, 2px `--applied-primary` border, `--applied-primary` text, same padding/radius.

## Spacing

- Page container max-width: `1200px`, side padding `1.5rem`.
- Section vertical padding: `4rem` desktop, `2.5rem` mobile.

## Editable hooks

- `editable-text` on every heading, eyebrow, button label, single-line string.
- `editable-rich` on paragraphs and any block that may contain `<strong>`, `<em>`, lists, links.

## Image CDN base

Final HubSpot CDN base path is unknown. All `src` attributes use the placeholder:

```
https://YOUR-PORTAL.fs1.hubspotusercontent-na1.net/hubfs/YOUR-PORTAL-ID/skf-quickcollect/<file>
```

Find-and-replace this string after the HubSpot upload. See `README.md` "CDN swap".

## Module catalog used

- `hero` (module-01)
- `trust-badge` (module-02) — band with "Featured manufacturer" eyebrow + single SKF logo
- `product-intro` (module-03) — split layout, copy left, lifestyle image right, 3-bullet benefits
- `features` (module-04) — sensor controls callout: photo + 4 LED labels rebuilt as accessible HTML

Skipped per user instruction: `videos` (not in source), service-center module (user will input).

## Forms

None — source page has no form, and user did not request one.
