# Email Build Validation Checklist

Walk through every item before reporting an email build complete. Each item gets a `[x]` (verified) or `[ ]` (open). Don't skip — preview text, alt text, and mobile stack issues are caught here.

---

## HTML Structure

- [ ] All layout uses `<table role="presentation">` — no divs for layout
- [ ] Container width is 600px (`width="600"` + `style="max-width:600px"`)
- [ ] Inline styles only on every element
- [ ] Exactly one `<style>` block in the entire email — and it lives in module-01
- [ ] No JavaScript anywhere
- [ ] No external CSS, no `<link>` tags
- [ ] No `<html>`, `<head>`, or `<body>` tags inside any module file

## Module Files

- [ ] Folder is named `<client>-<topic>-email/`
- [ ] All required modules present (default 10; rationale documented for any skipped)
- [ ] Each module is independently insertable (renders correctly if a neighbor is removed)
- [ ] Module-01 contains the `<style>` block (resets + media queries)
- [ ] Module-01 contains the preview text hidden `<div>`
- [ ] `HEAD.html` exists and is a paste-order comment (NOT actual styles)
- [ ] Module file names use kebab-case and the `module-NN-<name>.html` pattern

## Images

- [ ] Every `<img>` has `display:block`
- [ ] Every `<img>` has an explicit `width` attribute
- [ ] Every `<img>` has `max-width` matching its `width`
- [ ] Every `<img>` has descriptive `alt` text (or `alt=""` if purely decorative)
- [ ] All image URLs are absolute (no relative paths)
- [ ] Hero / full-width images have `class="fluid"` for mobile scaling

## Links & CTAs

- [ ] Every CTA button is `<td bgcolor="...">` wrapping `<a>` — never CSS-only
- [ ] Every external `<a>` has `target="_blank"`
- [ ] Every link has a real `href` (only the unsubscribe link uses `#` placeholder)
- [ ] CTA labels lead with action verbs (Shop, Watch, Download, Find, Explore)
- [ ] Brand-page CTA URLs are verified against the user's input or `applied-defaults.md`

## Mobile / Responsive

- [ ] Side-by-side `<td>` elements have `class="stack-column"`
- [ ] Decorative spacer cells have `class="hide-sm"`
- [ ] Mini-card grids use `class="mini-card"` for stacking
- [ ] Hero/full-width images use `class="fluid"`
- [ ] Tested mentally: at 480px wide, columns stack vertically and nothing overflows

## Brand

- [ ] All brand colors match approved palette / user input
- [ ] Section labels: `font-size:11px; font-weight:bold; text-transform:uppercase; letter-spacing:1.5px; color:<brand>`
- [ ] Heavy dividers (`2px solid <brand>`) used between major sections
- [ ] Light dividers (`1px solid #dddddd`) used between minor sections
- [ ] Buttons: white text on brand bg, OR brand text on white bg — consistent across email

## Required Deliverables

- [ ] Subject line — 3 options provided, one recommended
- [ ] Preview text — 3 options provided, one chosen and embedded in module-01
- [ ] Hero headline — 3 options provided, one chosen and placed in module-03
- [ ] Summary written: file tree, branch, CTAs/links, brand color, assumptions

## Sender Context

- [ ] Footer states who actually sent the email (Applied Industrial Technologies vs brand direct)
- [ ] Address is correct (`1 Applied Plaza • Cleveland, OH 44115` for Applied)
- [ ] Unsubscribe / Privacy / Site links present and correct
- [ ] Legal line includes correct year

## Final Push

- [ ] Files committed to a feature branch
- [ ] Branch pushed to remote
- [ ] User given direct file paths (not just repo root)
