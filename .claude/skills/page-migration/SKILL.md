---
name: page-migration
description: Migrates a public landing page into a HubSpot-ready rebuild package. Use whenever the user provides (a) a source page URL (Applied/SmartEdit/legacy CMS) and (b) a HubSpot reference page or template URL, and asks to rebuild, port, recreate, or migrate the source into HubSpot. Produces a structured migration package with HEAD HTML, FOOTER HTML, modular HubSpot-friendly source code, image inventory, copy deck, and QA checklist.
---

# Page Migration Skill

You are migrating a landing page from a source URL into a HubSpot-ready rebuild that visually and structurally matches a HubSpot reference template.

The user will provide two inputs:

- **Source URL** (Link 1): the page being migrated. Often Applied.com, a SmartEdit/legacy CMS page, or any public marketing page.
- **HubSpot reference URL** (Link 2): an existing HubSpot page or template that defines the target look, modules, spacing, typography, and code conventions.

Do not "just copy the page." Always produce the structured migration package described below.

---

## Workflow

Run the four phases in order. Do not skip phases. After each phase, write the artifacts to disk before moving on so the work survives any interruption.

### Phase 1 — Extract source page (Link 1)

Fetch Link 1 and inventory everything a rebuild would need. Use `WebFetch` first; if the page is JS-rendered or blocks fetch, ask the user for an HTML export or screenshot rather than guessing.

Capture:

- **Metadata** — `<title>`, meta description, canonical URL, OG/Twitter tags, favicon.
- **Headings** — every H1–H6 in document order, with hierarchy preserved.
- **Body copy** — all visible paragraph, list, and caption text. Verbatim. Do not paraphrase.
- **Images** — `src`, `alt`, intrinsic dimensions, role (hero, product, icon, background), and the section they live in.
- **Links and CTAs** — visible label, `href`, `target`, `rel`, and the section they live in. Flag mailto/tel links separately.
- **Forms** — location, fields, submit label, action URL, embed type (HubSpot, Marketo, custom).
- **Buttons** — label, destination, visual style (primary/secondary/ghost).
- **Section / module structure** — break the page into logical modules in the order they appear (hero, intro, features, comparison, gallery, CTA, etc.).
- **Inline styles worth preserving** — brand colors, custom fonts, unusual spacing, gradients.
- **Head / footer payload** — analytics, fonts, third-party scripts, schema.org JSON-LD, chat widgets, pixels.

Write Phase 1 output to `migration/<page-slug>/01-source-inventory.md`.

### Phase 2 — Analyze HubSpot reference (Link 2)

Fetch Link 2 and identify the conventions the rebuild must follow.

Capture:

- **Module catalog** — what modules exist (hero, split, gallery, stat-row, checklist, CTA band, accordion, etc.) and what each one is good for.
- **Wrapper / namespace** — the top-level wrapper class (e.g. `aih-lp`) and any required class prefix.
- **Editable hooks** — class names that mark editor-friendly text (e.g. `editable-text`, `editable-rich`).
- **Typography** — font stack, heading sizes, weights, letter-spacing, button casing.
- **Color tokens** — CSS custom properties or repeated hex values; brand primary / secondary / accent / neutrals.
- **Spacing scale** — common padding/margin steps and section rhythm.
- **Button styles** — primary / secondary / ghost variants, hover treatment, border radius.
- **Image treatments** — aspect ratios, rounded corners, shadows, video backgrounds, gradient overlays.
- **HEAD payload** — fonts, CSS variables, base reset, scroll/animation defaults.
- **FOOTER payload** — JS for scroll animations, tabs, accordions, sticky CTAs.
- **HubSpot-specific patterns** — file CDN domain (e.g. `hubfs/<portal-id>/`), HubL tokens if visible, form embed format.

Write Phase 2 output to `migration/<page-slug>/02-target-conventions.md`.

Read `references/module-rebuild-rules.md` before continuing — it explains how to map source sections onto HubSpot modules and how to name the resulting files.

### Phase 3 — Rebuild as HubSpot-ready output

Produce the migration package. File layout, naming, wrapper class, and editable hooks are defined in `references/hubspot-output-format.md` — follow it exactly.

Required deliverables, written into `migration/<page-slug>/`:

1. **`HEAD.html`** — global CSS, CSS variables, font imports, meta payload that belongs in `<head>`. One file, copy-paste ready into HubSpot's HEAD HTML field.
2. **`FOOTER.html`** — JS for animations and interactions. Copy-paste ready into HubSpot's FOOTER HTML field.
3. **`modules/module-NN-<name>.html`** — one self-contained HTML file per module, in source-page order. Each module wraps its content in the project wrapper class and uses editable-text hooks. Modules must be independently insertable into HubSpot's rich text / page builder.
4. **`assets/image-inventory.md`** — table of every image: filename, source URL, intended HubSpot CDN path, alt text, dimensions, role, module it belongs to.
5. **`assets/copy-deck.md`** — table of every block of copy: module, role (eyebrow/H1/H2/body/CTA label/caption), final copy. Verbatim from the source unless the user has requested edits.
6. **`assets/qa-checklist.md`** — page-specific checklist generated from `references/qa-checklist.md`, with items pre-checked off where you have already verified them.
7. **`README.md`** — short rebuild summary: what this is, how to install in HubSpot (HEAD → FOOTER → modules), where to swap CDN URLs, and known TODOs.

Only write CSS or JS that the rebuild actually needs. Do not invent components the source page does not contain.

### Phase 4 — Compare source vs rebuild

Before reporting done, audit the rebuild against the source. Walk through `references/qa-checklist.md` and record findings in `assets/qa-checklist.md`. At minimum verify:

- Every heading from Phase 1 appears in the rebuild, in order.
- Every body copy block from the copy deck appears once in the rebuild.
- Every image in the image inventory has a placeholder or final URL in the rebuild and a non-empty `alt`.
- Every CTA in the source has a matching CTA in the rebuild with the correct `href`.
- Form placement matches source intent (above the fold / mid-page / final CTA).
- Module order matches the source page's section order unless the user asked for a re-ordering.
- Mobile layout risks (tables, fixed-width images, multi-column grids) are flagged.
- Head/footer payload (analytics, schema, fonts) is preserved or explicitly noted as dropped.

Report any miss as an open item in the checklist with a concrete fix-it line.

---

## How to respond to the user

1. Confirm you have both URLs. If either is missing, ask for it before doing anything else.
2. Confirm the project slug and the directory you'll write into (default: `migration/<page-slug>/` from repo root).
3. Run Phase 1 → 4. Stream brief progress: "extracted N headings, M images, K CTAs", "identified X reusable modules", "wrote module-03-features.html", "QA: 2 open items".
4. End with a summary: file tree of the package, count of modules, count of images, count of open QA items, and a one-line "to install" pointer.

---

## Best practice

- Treat copy as sacred. Never paraphrase source copy unless the user explicitly asks for a rewrite.
- Treat the HubSpot reference's class names, wrapper, and CSS variables as the source of truth for styling. Don't invent new tokens.
- Prefer the existing module catalog over net-new modules. Only create a new module type when the source has a section the catalog cannot express.
- Keep modules independently insertable. A module must render correctly even if a sibling module is removed.
- Use `editable-text` / `editable-rich` hooks on every text block a marketer would reasonably want to edit in HubSpot's WYSIWYG.
- All images go through a consistent CDN base path. Use the path observed in the HubSpot reference (e.g. `https://<portal>.fs1.hubspotusercontent-na1.net/hubfs/<portal-id>/`); leave a clear placeholder if the final asset has not been uploaded yet.
- When a third-party script appears in the source, decide explicitly: keep, drop, or replace with the HubSpot-native equivalent. Note the decision in the QA checklist.

---

## Reference files

- `references/hubspot-output-format.md` — required folder layout, file naming, wrapper class, editable hooks, image and copy deck table formats.
- `references/module-rebuild-rules.md` — mapping rules from common source sections to HubSpot modules; module naming and ordering.
- `references/qa-checklist.md` — full QA checklist used in Phase 4. Copy into each migration's `assets/qa-checklist.md` and tick off as you verify.

Read these references when starting a migration. They are short and authoritative.
