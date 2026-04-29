# Phase 2 — Target Conventions

Authoritative source: AIH landing-page styleguide supplied by user (2026-04-29). The DeWalt reference page (`https://content.applied.com/dewalt-atomic-20v-max`) is unreachable from this build environment, but the styleguide tokens below are confirmed and not assumptions.

## Wrapper / namespace

- Top-level wrapper class: **`.aih-lp`**
- Component class prefix: `aih-` (e.g. `aih-section`, `aih-hero`, `aih-btn`).
- All custom properties scoped under `.aih-lp` (not `:root`) so the rebuild does not leak onto the rest of the HubSpot template.

## Color tokens (confirmed)

| Token | Value | Use |
|-------|-------|-----|
| `--aih-primary` | `#007b85` | Teal — primary CTA bg, link color, bullet dots, feature accents |
| `--aih-primary-hover` | `#005c63` | Primary CTA hover (per AIH button spec) |
| `--aih-dark` | `#201c52` | Navy/purple — eyebrow text, secondary accents |
| `--aih-heading-color` | `#000000` | All H1/H2/H3 |

Brand accent palette is **only** these two colors (teal + navy). No orange, yellow, gold, or any other accent. The earlier draft's SKF blue (`#0073cf`) and Applied red (`#c8102e`) have been removed.

| Neutral | Value | Use |
|---------|-------|-----|
| `--aih-text` | `#1a1a1a` | Body copy |
| `--aih-text-muted` | `#5a5a5a` | Captions, secondary text |
| `--aih-bg` | `#ffffff` | Default section bg |
| `--aih-bg-alt` | `#f4f4f4` | Alt section bg (trust badge, features) |
| `--aih-border` | `#e0e0e0` | Hairline rules |

## Typography (confirmed)

- Font family: **DIN 2014, sans-serif** (`--aih-font-family`).
- HEAD.html does **not** import the font — the parent HubSpot template should already load it. Add an `@font-face` or webfont link only if the host template does not.
- Headings: color `#000000`, weight 700.
- Body: 17px / 1.6.

| Element | Size | Weight | Line-height |
|---------|------|--------|-------------|
| H1 | 2.75rem (44px) | 700 | 1.1 |
| H2 | 2rem (32px) | 700 | 1.2 |
| H3 | 1.375rem (22px) | 700 | 1.3 |
| Body | 17px | 400 | 1.6 |
| Eyebrow | 13px | 700, uppercase, +0.5px letter-spacing | 1.2 |

Note: the uppercase + letter-spacing treatment applies to **eyebrows** only. Buttons are Title Case with no letter-spacing — see Buttons section below.

## Buttons (confirmed — exact CSS supplied by user)

Class structure: every button gets `aih-btn` (base) plus a variant — `aih-btn-primary`, `aih-btn-secondary`, `aih-btn-hero-primary`, or `aih-btn-hero-secondary`. **Hyphenated**, not BEM `--`.

Shared base (`.aih-btn`):
- Padding `0.875rem 2rem`, font-size `1rem`, weight 700, line-height `1.5`.
- `text-transform: none` — Title Case in HTML, never uppercase.
- `letter-spacing: 0` — no tracking.
- `border-radius: 4px`, `border: 2px solid transparent`.
- `transition: background-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease`.

Variants:
- **Primary** — teal fill, 2px teal border, soft glow `0 2px 8px rgba(0, 123, 133, 0.25)`. Hover: bg `#005c63`, `translateY(-1px)`, shadow off.
- **Secondary** — white fill, teal text, 1px `rgba(0, 123, 133, 0.5)` border. Hover: fills solid teal, white text.
- **Hero primary** — same as primary but heavier glow `0 4px 14px rgba(0, 123, 133, 0.45)`, for use on dark hero backgrounds.
- **Hero secondary** — like secondary but `1rem 2rem` padding and `1.125rem` font-size.

Hover always declares `color: #ffffff` explicitly (defends against HubSpot global CSS rewriting button text to teal). Hover never declares a glow — `box-shadow: none`.

## Spacing scale (confirmed)

| Token | Value |
|-------|-------|
| `--aih-space-xs` | 8px |
| `--aih-space-sm` | 16px |
| `--aih-space-md` | 32px |
| `--aih-space-lg` | 48px |
| `--aih-space-xl` | 64px |

- Section vertical padding: `xl` desktop, `lg` mobile.
- Section side padding: `md` desktop, `sm` mobile.
- Split-column gap: `lg`.

## Border radius (confirmed)

- Standard: `4px` (`--aih-radius`) — buttons, images, cards.
- Pill: `50px` (`--aih-radius-pill`) — feature numbered indicators, badges.

## Shadows (confirmed — three levels)

- `--aih-shadow-sm`, `--aih-shadow-md`, `--aih-shadow-lg`.
- Hero image uses `md`. Other modules can opt in as needed.

## Motion (confirmed)

- `--aih-transition: 0.3s ease` for color / border-color / background changes.
- Keyframes: `aih-fadeIn`, `aih-fadeInUp`, `aih-fadeInDown`, `aih-growUp`.
- Reveal-on-scroll: add class `aih-reveal` to any element; FOOTER.html toggles `is-visible` when it scrolls into view.
- `prefers-reduced-motion` zeroes out animations and transitions.

## Breakpoints (confirmed)

- Tablet ≤ 768px — split layouts collapse to single column.
- Mobile ≤ 480px — heading sizes shrink, button padding tightens, button group goes full-width.

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
- `trust-badge` (module-02) — band with "Featured Manufacturer" eyebrow + single SKF logo
- `product-intro` (module-03) — split layout, copy left, lifestyle image right, 3-bullet benefits
- `features` (module-04) — sensor controls callout: photo + 4 LED labels rebuilt as accessible HTML

Skipped per user instruction: `videos` (not in source), service-center module (user will input).

## Forms

None — source page has no form, and user did not request one.
