# Module Rebuild Rules

How to slice a source page into HubSpot modules, name them, and order them.

## Rule 1 — Modules are functional, not topical

Name modules after what they do, not what they're about. `module-04-comparison.html`, not `module-04-mta-vs-din.html`. Different products can reuse the same module file across migrations.

## Rule 2 — Prefer the catalog over inventing

Map source sections onto these catalog modules first. Only create a new module when no catalog entry fits.

| Catalog module | Use when the source has… |
|---|---|
| `hero` | A top section with H1, supporting copy, primary CTA, and a hero image or video. |
| `eyebrow-intro` | A short intro paragraph block under the hero, often with a kicker. |
| `product-intro` | A 1–2 column block introducing the product/offering with an image and body copy. |
| `key-features` | A grid of 3–8 feature cards with icon, title, and short description. |
| `value-propositions` | 4–6 short benefit statements, often icon + headline + 1-line body. |
| `comparison` | Side-by-side or chart-driven comparison vs. competitor / standard / status quo. |
| `benefits-checklist` | A bulleted/checkmark list of benefits, optionally paired with an image. |
| `gallery` | A grid of clickable product/configuration cards with images and CTAs. |
| `availability` | "Available now / In stock / Fast lead times" badges and supporting copy. |
| `safety-compliance` | Compliance callouts (OSHA, MSHA, AGMA, ISO) with supporting body copy. |
| `tools-technology` | Companion tools or platforms (selectors, monitoring apps) — usually split layout. |
| `testimonials` | Quote(s) with attribution. |
| `stats-band` | A horizontal row of numeric stats with labels. |
| `faq` | Accordion or definition list of Q&A pairs. |
| `final-cta` | Bottom-of-page CTA section, often with multiple destinations. |
| `sticky-cta` | Persistent floating CTA bar (use sparingly; only if reference uses it). |
| `final-contact` | Contact form or contact details block at the page end. |

If a source section doesn't fit, create a new module file with a functional name and document it in the migration's `README.md` so it can be promoted into the catalog later.

## Rule 3 — One section in source = one module in rebuild

Default to a 1:1 mapping. Don't merge two source sections into one module just because they look similar — marketers may want to reorder or remove one independently. Don't split one source section into two modules unless the HubSpot reference clearly does so.

## Rule 4 — Order matches the source page

Number modules in the order they appear on the source page, top to bottom. The two-digit prefix (`module-01-`, `module-02-`, …) preserves order in directory listings and in HubSpot's editor when files are pasted in sequence.

If the user explicitly requests a re-ordering, follow the requested order and note the deviation in the migration's `README.md`.

## Rule 5 — Each module is self-contained

A module file must:

- Wrap its content in the project namespace (e.g. `<div class="aih-lp">`).
- Render correctly if any sibling module is removed.
- Avoid hard dependencies on IDs in other modules (no anchor links pointing into a module that may be deleted).
- Carry no `<style>` block — global styling lives in `HEAD.html`.
- Carry no `<script>` block — global behavior lives in `FOOTER.html`.

## Rule 6 — Editable hooks on every marketer-facing string

- `editable-text` for headings, eyebrows, button labels, single-line strings.
- `editable-rich` for paragraphs and any block that may contain inline `<strong>`, `<em>`, links, or lists.

If a string is genuinely never going to be edited (a legal mark, a hard-coded brand name in a logo lockup), leave it without a hook.

## Rule 7 — Image placeholders are explicit

When a final asset is not yet available, use `image-placeholder-<role>.jpg` as the `src` and add a row to `image-inventory.md` with the role and intended CDN target. Never silently use a stock URL or an unrelated source image.

## Rule 8 — Forms are decided once

In Phase 2, decide whether forms are HubSpot embed, Marketo embed, or custom HTML, based on the HubSpot reference. Apply the same decision to every form module in the rebuild. Don't mix embed types within one page.

## Rule 9 — Don't invent components

If the source page does not have a testimonial, do not add a testimonial module. The rebuild matches the source's content surface; the HubSpot reference defines its visual language. The two are not blended into something net-new unless the user explicitly asks.

## Rule 10 — Promote new modules sparingly

If you create a new module type during a migration, document it in the migration's `README.md` under "New modules introduced". Do not silently add it to this catalog — the user decides what gets promoted into the shared catalog.
