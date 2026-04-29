# Applied LP Template Spec

Authoritative output spec for every Applied Industrial Technologies landing page rebuild. Supersedes `hubspot-output-format.md` for any AIH migration.

## Global rules

- All page content wrapped in `<main id="applied-lp">`.
- Never include `<html>`, `<body>`, `<header>`, `<footer>`, or global nav.
- All custom CSS scoped to `#applied-lp` to avoid bleeding into other pages.
- The global site already loads DIN 2014, the teal/navy color tokens, and the button styles. **Do not redeclare** any of them.
- Output exactly **three** deliverables: `HEAD.html`, `FOOTER.html`, `SOURCE.html`.

## Brand tokens (already global, reference only — do not redeclare)

```
--primary-color:   #007b85   /* teal */
--primary-darker:  #01545b
--secondary-color: #201c52   /* navy */
--tertiary-color:  #030121   /* near-black */
--lt-gray-color:   #F8F8F8
--dark-gray-color: #3A3A3A
font-family:       DIN2014, sans-serif
```

## Button styles (already global — just use the classes)

| Class | Use | Look |
|-------|-----|------|
| `.btn_style1` | Primary CTA | Solid teal, white text |
| `.btn_style2` | Secondary CTA | Solid navy, white text |
| `.btn_style3` | Tertiary / on-dark CTA | Outlined teal on white |

All buttons share: `padding: 16px 24px; border-radius: 3px; font-weight: 700; text-transform: capitalize;`

---

## Sections (in fixed order)

Every Applied LP outputs these seven sections in this order. If a section has no source content, fill it with bracketed placeholders (`[Section 4 headline]`, `[Why-block body]`, etc.) — do not silently drop the section.

### Section 1 — Hero (full-bleed)

Brand intro with background image, dark overlay, headline, subhead, two CTAs.

- Full-bleed background image; `background-attachment: fixed` desktop, `scroll` mobile.
- Dark overlay: `rgba(0,0,0,0.4)` via `:before` pseudo.
- Padding: `180px 0 140px` desktop, `120px 0 100px` mobile.
- Content container: `max-width: 940px`, left-aligned.
- H1: white, **62px desktop / ~50px tablet / ~46px mobile**, weight 900.
- Subtext: white paragraph.
- Two buttons in a flex row: primary (`btn_style1`) + outlined (`btn_style3`).
- Optional breadcrumb above headline (white, `/` separators).

### Section 2 — Trust Strip (full-bleed, thin)

Quick-trust bar directly under the hero.

- White bg, `border-bottom: 1px solid #EEEEEE`.
- Single row, centered, `min-height: 50px`, gap between items `2rem`.
- Three items separated by 1px vertical dividers (24px tall, `#E0E0E0`).
  - Item 1 — brand/supplier logo (left).
  - Item 2 — icon + "Authorized Distributor" (teal shield icon).
  - Item 3 — icon + "Available Online" (teal checkmark icon).
- Mobile: stack vertically, hide dividers.
- Use scoped wrapper class `.applied-trust-strip` inside `#applied-lp`.

### Section 3 — Image + Text, Floating Card (image LEFT)

First product overview block.

- Container `max-width: 1200px`, centered.
- Two columns desktop: image (60%) + text card (40%).
- Image: `border-radius: 8px`, `object-fit: cover`.
- Text card: white bg, `border-radius: 8px`, `padding: 40px`, `box-shadow: 0 0 20px rgba(0,0,0,0.10)`.
- Card overlaps image by `-5%` on the left edge (floating effect).
- Headline: H3, dark.
- Body: paragraph + optional bullet list.
- Optional CTA at bottom (`btn_style1`).
- Mobile: stack; card 90% width; `margin-top: -5%`; `padding: 24px`.

### Section 4 — Image + Text, Floating Card (image RIGHT)

Second product detail block — "Why [Brand]?".

- Same structure as Section 3, mirrored.
- Optional card bg tint: `rgba(217,217,217,0.8)` light grey.
- Headline color: teal `#007b85`.
- Bulleted feature list inside the card.

### Section 5 — Two-Column Tile Repeater with Vertical Sidebar Heading

Features & Applications side-by-side.

- Outer grid: `grid-template-columns: 80px 1fr; gap: 40px;`.
- Left column (80px) — sticky vertical heading:
  - Rotated `-90deg`, `transform-origin: top left`.
  - `font-size: 24px; font-weight: 700; white-space: nowrap;`.
  - Left border accent: `border-left: 10px solid #007b85;` (becomes top after rotation).
- Right column — two tiles side-by-side: `grid-template-columns: 1fr 1fr; gap: 24px;`.
  - Tile 1 — teal-tinted bg `rgba(0,123,133,0.5)` or solid teal.
  - Tile 2 — light grey `#F6F6F6`.
  - Each tile: `border-radius: 8px; padding: 32px;` H3 title on top, bulleted content below.
  - Image height (if used): `200px`, `object-fit: cover`.
- Mobile: vertical heading hides or moves above; tiles stack.

### Section 6 — Disclaimer Block

Legal disclaimer for supplier-provided content.

- Container `max-width: 1200px`.
- `font-size: 12px; color: #282b2d;`.
- Left-aligned paragraph, no formatting flourishes.

### Section 7 — Dark CTA Banner (full-bleed)

Final conversion push.

- Full-bleed bg image with dark overlay `rgba(0,0,0,0.6)`.
- Padding: `60px 0`.
- Container: `max-width: 920px`, centered text.
- H2: white, `36px`, weight 700, `text-transform: capitalize;`.
- Body: white paragraph.
- Single CTA: `btn_style3` (outlined white-on-dark variant).

---

## Required deliverables on every build

### `HEAD.html`
- One `<style>` block with all custom CSS scoped under `#applied-lp`.
- Suggested `<title>`, meta description (≤155 chars), Open Graph tags.
- **No font imports** — DIN 2014 is already global.

### `FOOTER.html`
- Any small JS for animations, smooth scroll, or scroll-triggered reveals.
- IntersectionObserver for `.animated.visible` class toggles if used.
- **No analytics** — handled globally.

### `SOURCE.html`
- One `<main id="applied-lp">` wrapper containing all seven sections in order.
- Use HubSpot-safe bracketed placeholders for missing content: `[Product Name]`, `[Hero Image URL]`, `[CTA URL]`, `[Brand Logo URL]`, `[Section 4 Headline]`, etc.
- Form placeholder when relevant: `<!-- HUBSPOT FORM EMBED HERE -->`.
- Single H1 per page, in the hero section.

---

## Content rules

- Tone: professional, industrial, conversion-focused.
- Audience: maintenance, operations, engineering, procurement leaders.
- **Never invent** stats, certifications, lead times, pricing, or guarantees.
- Use bracketed placeholders when content is missing — do not paraphrase to fill gaps.
- Never rewrite source copy. Reorganize across sections is fine; rewriting is not.
