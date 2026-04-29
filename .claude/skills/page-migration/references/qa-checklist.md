# Page Migration QA Checklist

Copy this file into each migration's `assets/qa-checklist.md` and tick items off in Phase 4. Leave unchecked items visible so the user knows what's still open.

## Copy accuracy

- [ ] Every heading from the source page appears in the rebuild, in document order.
- [ ] Every paragraph from the source appears verbatim (or as the user-approved edit).
- [ ] Every list item from the source appears, with the same bullet/number style.
- [ ] Eyebrows / kickers / pre-headings preserved.
- [ ] Captions and image overlays preserved.
- [ ] Legal copy and disclaimers preserved.
- [ ] No paraphrasing introduced unless explicitly requested.

## Images

- [ ] Every source image has a row in `image-inventory.md`.
- [ ] Every image in the rebuild resolves (placeholder or final CDN URL).
- [ ] Every image has an `alt` attribute. Decorative images use `alt=""`.
- [ ] Hero / background imagery preserved or explicitly replaced.
- [ ] Logos and brand marks use approved versions, not screenshots.
- [ ] Aspect ratios match the source within reason; no obvious squashing.
- [ ] Video posters present for any `<video>` element.
- [ ] SVGs inlined or hosted on the same CDN as raster assets.

## Links and CTAs

- [ ] Every CTA in the source has a matching CTA in the rebuild.
- [ ] CTA labels match the source (or user-approved edits).
- [ ] CTA `href` values match the source unless explicitly redirected.
- [ ] External links carry `target="_blank"` and `rel="noopener"` where appropriate.
- [ ] `mailto:` and `tel:` links open correctly.
- [ ] No leftover anchor links pointing to source-page section IDs that don't exist in the rebuild.
- [ ] Tracking parameters preserved on links that had them.

## Forms

- [ ] Form placement matches source intent (above the fold / inline / final).
- [ ] All fields present, in the same order.
- [ ] Submit button label matches.
- [ ] Form embed type decided: HubSpot form, Marketo, custom — and consistent with HubSpot reference.
- [ ] Confirmation/redirect behavior documented.

## Layout and structure

- [ ] Module order matches source section order.
- [ ] Sections that exist in source are not collapsed or merged silently.
- [ ] HubSpot reference's wrapper class (e.g. `.aih-lp`) is on every module.
- [ ] No raw `<style>` blocks inside modules; styling lives in HEAD.html.
- [ ] No `<script>` tags inside modules; scripts live in FOOTER.html.
- [ ] Editable hooks (`editable-text`, `editable-rich`) on text blocks marketers will edit.

## Head and footer payload

- [ ] Page `<title>` and meta description set (or noted in README as TODO for HubSpot page settings).
- [ ] Open Graph / Twitter tags preserved (or noted as TODO).
- [ ] Analytics / pixels: kept, dropped, or replaced — decision recorded here.
- [ ] Schema.org JSON-LD preserved if source had it.
- [ ] Third-party scripts (chat, A/B test, etc.): kept, dropped, or replaced — decision recorded here.
- [ ] Custom fonts loaded once in HEAD.html, not per module.

## Mobile and responsive

- [ ] Hero text remains readable at 375px width.
- [ ] No horizontal scroll on mobile breakpoints.
- [ ] Multi-column grids stack to single column at ≤768px.
- [ ] Tables either become cards on mobile or are flagged as a known risk.
- [ ] Touch targets on CTAs are at least 44×44px on mobile.
- [ ] Background videos have a poster image fallback.

## HubSpot-specific

- [ ] Wrapper namespace matches the HubSpot reference.
- [ ] CSS variables scoped under wrapper class, not `:root`.
- [ ] Image CDN paths use the HubSpot portal's `hubfs/<portal-id>/` base.
- [ ] Modules are independently insertable — removing one does not break siblings.
- [ ] FOOTER.html does not throw if a module is absent.
- [ ] No HubL tokens left unfilled (e.g. `{{ }}` placeholders).

## Performance and accessibility (sanity pass)

- [ ] No image larger than ~500KB without justification.
- [ ] Lazy loading on below-the-fold images (`loading="lazy"`).
- [ ] Heading hierarchy is not skipped (no H4 without an H3 above it).
- [ ] Color contrast on body copy passes a quick eyeball check against WCAG AA.
- [ ] Buttons are `<a>` or `<button>`, not styled `<div>`s.

## Sign-off

- [ ] Rebuild reviewed by user.
- [ ] All open items above resolved or explicitly accepted.
- [ ] Final HubSpot CDN URLs swapped in (no `image-placeholder-*` left).
