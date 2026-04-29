# HubSpot Output Format

This is the required shape of every page-migration deliverable. Match it exactly so installs into HubSpot are mechanical.

## Folder layout

```
migration/<page-slug>/
├── README.md
├── HEAD.html
├── FOOTER.html
├── modules/
│   ├── module-01-<name>.html
│   ├── module-02-<name>.html
│   └── module-NN-<name>.html
└── assets/
    ├── image-inventory.md
    ├── copy-deck.md
    └── qa-checklist.md
```

`<page-slug>` is kebab-case derived from the source page H1 or URL slug. Examples: `dodge-mta`, `optify-monitoring`, `skf-bearing-monitor`.

## File rules

### `HEAD.html`
- Pure HTML/CSS only. No `<html>`, `<head>`, or `<body>` wrappers — this gets pasted into HubSpot's HEAD HTML field.
- Order: font imports → CSS variables → base reset → component styles → utilities.
- All custom properties live on the project wrapper class, not `:root`. This keeps the rebuild from leaking onto the HubSpot template:
  ```css
  .aih-lp { --aih-primary: #00838F; --aih-secondary: #E84E0F; }
  ```
- Replace `aih` with the project's namespace if a different one is used in the HubSpot reference.

### `FOOTER.html`
- Pure JS, wrapped in `<script>` tags. No third-party CDNs unless the source page already requires them.
- Pasted into HubSpot's FOOTER HTML field — runs after all modules render.
- Must not throw if a target module is absent (modules are independently insertable).

### `modules/module-NN-<name>.html`
- One module per file. Two-digit zero-padded prefix preserves order.
- Wrap every module in the project namespace:
  ```html
  <div class="aih-lp">
    <section class="aih-<module-name>">
      ...
    </section>
  </div>
  ```
- Editable hooks on every text block a marketer would touch:
  - `editable-text` on headings, eyebrows, button labels, single-line text.
  - `editable-rich` on paragraphs and any block that may contain inline `<strong>`, `<em>`, lists.
- Top of file: short HTML comment block with module name, source-page section, and one-line description.
- Images use the HubSpot CDN base path observed in the reference. If final asset is unknown, use `image-placeholder-<role>.jpg` and add a row to the image inventory.

### Module naming

Use the catalog names in `module-rebuild-rules.md`. If you must introduce a new module, name it after its function, not its content (`module-04-comparison.html`, not `module-04-mta-vs-din.html`).

## Asset documents

### `assets/image-inventory.md`

Markdown table, one row per image:

| # | Module | Role | Source URL | Target CDN URL | Alt text | Dimensions | Notes |
|---|--------|------|------------|----------------|----------|-----------|-------|
| 1 | hero | background | https://… | https://<portal>.fs1.hubspotusercontent-na1.net/hubfs/<portal-id>/hero-bg.jpg | "" (decorative) | 1920x1080 | TODO: re-export at 2x |

Rules:
- One row per image, including SVGs and video posters.
- `Alt text` must be empty string `""` for purely decorative images, otherwise descriptive.
- `Notes` flags missing assets, licensing concerns, or re-export needs.

### `assets/copy-deck.md`

Markdown table, one row per copy block:

| # | Module | Role | Copy |
|---|--------|------|------|
| 1 | hero | eyebrow | AGMA-Rated Performance |
| 2 | hero | h1 | Motorized Torque-Arm |
| 3 | hero | h2 | Shaft-Mount Reducer |
| 4 | hero | body | The most reliable direct-drive solution… |
| 5 | hero | cta-primary | Shop Now |

Rules:
- Verbatim from source. If the user requested an edit, make a second column `Edited Copy` and keep the original.
- `Role` is one of: `eyebrow`, `h1`, `h2`, `h3`, `h4`, `body`, `caption`, `list-item`, `cta-primary`, `cta-secondary`, `form-label`, `legal`.
- One row per block; do not combine multiple paragraphs into one cell.

### `assets/qa-checklist.md`

Copy of `references/qa-checklist.md` with each item marked `[x]` if verified, `[ ]` if open, and a one-line note when an item fails. Do not delete unchecked items — leave them visible so the user can see what's still open.

## README.md

Keep it short. Sections:

1. **What this is** — one line: source URL, HubSpot reference URL, page-slug.
2. **Install** — three steps: paste HEAD.html, paste FOOTER.html, paste modules in order.
3. **CDN swap** — where placeholder image URLs live and how to replace them.
4. **Open items** — copy of the unchecked QA items.

No marketing prose. No history. No license boilerplate.
