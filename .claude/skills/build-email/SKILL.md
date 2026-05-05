---
name: build-email
description: Build branded modular HTML email templates for clients/companies. Use when the user asks to build, create, or generate an email for a brand or product. Handles B2B industrial, promotional, newsletter, and transactional email types. Produces a folder of 10 self-contained module HTML files compatible with all major email clients.
---

# Build Email Skill

Create production-ready modular HTML email templates for client brands. Each email is a folder of self-contained modules that paste directly into HubSpot's email builder.

## Standard structure

Default to a 10-module folder. Skip a module only if the email type genuinely doesn't need it.

```
<client>-<topic>-email/
├── HEAD.html                       ← module-order guide (NOT pasted; email has no HEAD field)
├── module-01-header.html           ← logo bar + shared <style> block + preview text
├── module-02-hero-image.html       ← optional full-width hero photo
├── module-03-hero-headline.html    ← brand-color headline bar with H1 + subhead
├── module-04-intro.html            ← opening hook + brand divider
├── module-05-<topic>.html          ← featured product / topic section
├── module-06-<topic>.html          ← featured product / topic section
├── module-07-<topic>.html          ← featured product / topic section
├── module-08-mini-cards.html       ← 2-up or 3-up secondary cards
├── module-09-cta-banner.html       ← brand banner with dual CTAs
└── module-10-footer.html           ← dark footer with legal
```

**Email has no HEAD HTML field.** All shared styles + preview text live in `module-01-header.html`. The `HEAD.html` file is just a paste-order reference comment.

## Required deliverables

Every email build produces:

1. **All module HTML files** in `<client>-<topic>-email/`
2. **Subject line** — 3 options, recommend one
3. **Preview text** — 3 options (~100 chars), embed the chosen one in module-01
4. **Hero headline** — 3 options for the H1 in module-03
5. **Summary** — file tree, branch pushed, CTAs/links used, brand color used, assumptions made

## Workflow

Make a todo list and work through each step in order.

### 1. Gather Requirements

Use `AskUserQuestion` for anything missing. Capture:

- **Client / brand name**
- **Email type** — promotional/spotlight (default), newsletter, transactional
- **Featured products/topics** — names, copy, links, image URLs, video URLs
- **Brand colors** — primary hex
- **Logo URL**
- **Sender context** — direct from brand, or distributor sending on their behalf (Applied is the common case — see `references/applied-defaults.md`)

### 2. Plan & Pick Templates

Default to the 10-module promotional layout. Open `references/module-templates.md` and copy the skeletons for each module + any reusable patterns (CTA button, video callout, 2-up tiles, 3-up mini-cards).

### 3. Write the Module Files

Fill in the templates. Each module must:
- Be a complete `<table role="presentation">` snippet
- Use inline styles only (plus the one `<style>` block in module-01)
- Display correctly even if a sibling module is removed

Save each as `<client>-<topic>-email/module-NN-<name>.html`.

### 4. Validate

Walk through `references/email-validation.md` before reporting done. Don't skip — this is where preview text, alt text, and mobile stack issues get caught.

### 5. Commit and Push

```bash
git add <client>-<topic>-email/
git commit -m "Add <Client> <topic> email modules"
git push -u origin <branch>
```

## Hard rules for email HTML

- 600px max-width container, `width="600"` + `style="max-width:600px"`
- Layout via `<table role="presentation">` only — no divs for layout
- Inline styles on every element, plus one `<style>` block in module-01 (resets + media queries)
- No JavaScript, no external CSS, no `<link>` tags
- Images: `display:block`, explicit `width`, `max-width` matching `width`, descriptive `alt`
- Buttons: `<td bgcolor="...">` wrapping `<a>` — never CSS-only buttons
- Preheader: hidden `<div>` in module-01, ~100 chars

## Reference files

- `references/module-templates.md` — copy-paste HTML for every module type and reusable pattern
- `references/applied-defaults.md` — Applied Industrial Technologies sender info, footer, image CDN, links
- `references/email-validation.md` — pre-flight QA checklist

Read these when you start a build. They are short and authoritative.

## Wrap up

Provide the user a summary:
- File tree of `<client>-<topic>-email/`
- Subject line (recommended + 2 alternates)
- Preview text (recommended + 2 alternates) — confirm which is embedded
- Hero headline (recommended + 2 alternates)
- Branch + repo
- CTAs and where they link
- Brand color used
- Any assumptions made
