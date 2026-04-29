# QA Checklist — SKF QuickCollect™

Phase 4 verification. `[x]` = verified in this rebuild. `[ ]` = open / requires user verification post-import.

## Copy accuracy

- [x] Every heading from the source page appears in the rebuild, in document order.
- [x] Every paragraph from the source appears verbatim.
- [x] Every list item from the source appears, with the same bullet/number style.
- [x] Eyebrows / kickers / pre-headings preserved (hero eyebrow = source title prefix).
- [x] Captions and image overlays preserved — sensor LED labels rebuilt as accessible HTML in module-04.
- [ ] Legal copy and disclaimers preserved. **Note:** none observed in supplied copy. Confirm none on the live source page.
- [x] No paraphrasing introduced unless explicitly requested — *exception:* product-intro H2 added ("A smart vibration tool, made simple") and trust-badge eyebrow added ("Featured Manufacturer"). Both flagged in `copy-deck.md`.

## Images

- [x] Every source image has a row in `image-inventory.md`.
- [x] Every image in the rebuild resolves to a placeholder CDN URL.
- [x] Every image has an `alt` attribute.
- [ ] Hero / background imagery preserved. **Open:** user uploads final asset and swaps placeholder URL.
- [ ] Logos and brand marks use approved versions. **Open:** swap `skf-logo.svg` placeholder for the official SKF SVG.
- [x] Aspect ratios match the source within reason.
- [x] Video posters present for any `<video>` element (n/a — no video).
- [ ] SVGs inlined or hosted on the same CDN as raster assets. **Open:** depends on user's HubSpot Files org.

## Links and CTAs

- [x] Every CTA in the source has a matching CTA in the rebuild (Buy Now, SKF Home).
- [x] CTA labels match the source.
- [x] CTA `href` values match the source.
- [ ] External links carry `target="_blank"` and `rel="noopener"` where appropriate. **Note:** both CTAs go to applied.com (same domain), so target="_blank" not added by default. Add if marketing wants new-tab behavior.
- [x] No `mailto:` / `tel:` links in source.
- [x] No leftover anchor links pointing to source-page section IDs.
- [x] Tracking parameters preserved on links that had them — none in source.

## Forms

- [x] No form on the source page (n/a).

## Layout and structure

- [x] Module order matches source section order: hero → trust badge → product intro → features.
- [x] Sections that exist in source are not collapsed or merged silently.
- [x] Wrapper class `.applied-lp` is on every module.
- [x] No raw `<style>` blocks inside modules; all styling lives in `HEAD.html`.
- [x] No `<script>` tags inside modules; FOOTER.html holds the optional reveal script.
- [x] Editable hooks (`editable-text`, `editable-rich`) on every text block a marketer would touch.

## Head and footer payload

- [ ] Page `<title>` and meta description set. **Open:** set in HubSpot Page Settings — suggested title: "SKF QuickCollect™ — Machine Monitoring Sensor | Applied". Suggested description: "Monitor machine health with SKF QuickCollect™, a portable vibration sensor that pairs with a free mobile app for live readings. Available from Applied®."
- [ ] Open Graph / Twitter tags. **Open:** set in HubSpot Page Settings; use the hero image as og:image.
- [ ] Analytics / pixels. **Decision:** none added in HEAD.html — Applied's HubSpot template should already include site-wide tracking.
- [ ] Schema.org JSON-LD. **Open:** if Applied wants Product schema for SEO, add to HEAD.html.
- [ ] Third-party scripts. **Decision:** none — source page had nothing the rebuild requires.
- [x] Custom fonts loaded once in HEAD.html (Inter via Google Fonts).

## Mobile and responsive

- [x] Hero text remains readable at 375px width (h1 down-shifts to 2.125rem).
- [x] No horizontal scroll on mobile breakpoints.
- [x] Multi-column grids stack to single column at ≤768px (`.applied-split` collapses).
- [x] No tables in the rebuild.
- [x] Touch targets on CTAs are ≥44×44px (padding 0.875rem 1.75rem with line-height 1.2 yields ~46px).
- [x] No background videos.

## HubSpot-specific

- [x] Wrapper namespace `.applied-lp` consistent across modules and HEAD.
- [x] CSS variables scoped under wrapper class, not `:root`.
- [ ] Image CDN paths use the HubSpot portal's `hubfs/<portal-id>/` base. **Open:** placeholder `YOUR-PORTAL` / `YOUR-PORTAL-ID` must be find/replaced after import.
- [x] Modules are independently insertable — removing one does not break siblings.
- [x] FOOTER.html does not throw if a module is absent (early return on empty querySelector).
- [x] No HubL tokens left unfilled.

## Performance and accessibility (sanity pass)

- [ ] No image larger than ~500KB without justification. **Open:** verify after upload.
- [x] Lazy loading on below-the-fold images (`loading="lazy"` on modules 02–04; hero is `eager`).
- [x] Heading hierarchy: H1 (hero) → H2 (product intro, features) → H3 (LED labels). Not skipped.
- [x] Color contrast: white on `#c8102e` ≈ 5.9:1 (AA pass for body, AAA for large text). Body `#1a1a1a` on white = 19:1.
- [x] Buttons are `<a>` elements (CTA links), not styled `<div>`s.

## Sign-off

- [ ] Rebuild reviewed by user.
- [ ] All open items above resolved or explicitly accepted.
- [ ] Final HubSpot CDN URLs swapped in (no `YOUR-PORTAL` / `YOUR-PORTAL-ID` left).
- [ ] DeWalt-template visual specs reconciled with assumed defaults (font, primary color, button radius).
