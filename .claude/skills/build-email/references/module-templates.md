# Email Module Templates

Copy-paste HTML skeletons for the standard 10-module email. Replace `{TOKENS}` with actual values. All modules are complete `<table>` snippets that can be pasted into HubSpot's email builder in any order — they don't depend on each other except for the `<style>` block in module-01.

---

## Module 01 — Header

PLACE FIRST. Contains the shared `<style>` block, the hidden preview text, and the brand-color logo bar.

```html
<!-- Module 01: Header -->
<style>
  * { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
  table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse !important; }
  img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; display: block; }
  @media screen and (max-width: 600px) {
    .email-container { width: 100% !important; }
    .fluid { max-width: 100% !important; height: auto !important; }
    .stack-column { display: block !important; width: 100% !important; max-width: 100% !important; direction: ltr !important; }
    .stack-column img { margin: 0 auto 16px auto !important; }
    .mini-card { display: block !important; width: 100% !important; max-width: 100% !important; margin-bottom: 10px !important; }
    .hide-sm { display: none !important; }
  }
</style>

<div style="display:none; font-size:1px; color:#1a1a1a; line-height:1px; max-height:0; max-width:0; opacity:0; overflow:hidden;">
  {PREVIEW_TEXT}
</div>

<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px;">
  <tr>
    <td align="center" bgcolor="{HEADER_BG_COLOR}" style="padding:20px 30px;">
      <img src="{LOGO_URL}" alt="{BRAND}" width="140" style="max-width:140px; display:block;">
    </td>
  </tr>
</table>
```

`{HEADER_BG_COLOR}` is usually `#1a1a1a` (dark) or the brand primary.

---

## Module 02 — Hero Image (optional)

Full-width photo. Skip if you're using a text-only hero.

```html
<!-- Module 02: Hero Image -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px;">
  <tr>
    <td style="padding:0;">
      <img src="{HERO_IMAGE_URL}" alt="{HERO_ALT}" width="600" class="fluid"
           style="width:100%; max-width:600px; display:block;">
    </td>
  </tr>
</table>
```

---

## Module 03 — Hero Headline

Brand-color bar with eyebrow, H1, and subhead.

```html
<!-- Module 03: Hero Headline -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px;">
  <tr>
    <td bgcolor="{BRAND_COLOR}" style="padding:36px 40px; text-align:center;">
      <p style="margin:0 0 8px 0; font-family:Arial,Helvetica,sans-serif; font-size:11px; font-weight:bold; color:#ffffff; text-transform:uppercase; letter-spacing:2px;">
        {EYEBROW}
      </p>
      <h1 style="margin:0 0 12px 0; font-family:Arial,Helvetica,sans-serif; font-size:28px; font-weight:bold; color:#ffffff; line-height:1.2;">
        {HEADLINE}
      </h1>
      <p style="margin:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; color:{BRAND_LIGHT}; line-height:1.6;">
        {SUBHEAD}
      </p>
    </td>
  </tr>
</table>
```

`{BRAND_LIGHT}` is a tinted version of the brand color (e.g. `#b3d7ef` for SKF blue, `#e0f4f5` for teal). Falls back to `#cccccc` if uncertain.

---

## Module 04 — Intro

Opening paragraph + brand-color thick divider.

```html
<!-- Module 04: Intro -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px; background-color:#ffffff;">
  <tr>
    <td style="padding:30px 40px; font-family:Arial,Helvetica,sans-serif; font-size:15px; color:#333333; line-height:1.7;">
      <p style="margin:0 0 14px 0;">{INTRO_PARAGRAPH_1}</p>
      <p style="margin:0;">{INTRO_PARAGRAPH_2}</p>
    </td>
  </tr>
  <tr>
    <td style="padding:0 40px;">
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr><td style="border-top:2px solid {BRAND_COLOR}; font-size:0; line-height:0;">&nbsp;</td></tr>
      </table>
    </td>
  </tr>
</table>
```

---

## Module 05/06/07 — Featured Product Section

Two layouts: image-left or image-right. Alternate them across modules for visual rhythm.

### Image-Left layout

```html
<!-- Module 0X: {PRODUCT_NAME} -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px; background-color:#ffffff;">
  <tr>
    <td style="padding:28px 40px 0 40px;">
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
          <td width="36%" class="stack-column" valign="top" style="padding-right:20px;">
            <img src="{PRODUCT_IMAGE_URL}" alt="{PRODUCT_ALT}" width="185" class="fluid"
                 style="width:100%; max-width:185px; border-radius:3px; display:block;">
          </td>
          <td width="64%" class="stack-column" valign="top">
            <p style="margin:0 0 4px 0; font-family:Arial,Helvetica,sans-serif; font-size:11px; font-weight:bold; color:{BRAND_COLOR}; text-transform:uppercase; letter-spacing:1.5px;">{EYEBROW}</p>
            <h2 style="margin:0 0 12px 0; font-family:Arial,Helvetica,sans-serif; font-size:19px; font-weight:bold; color:#1a1a1a; line-height:1.25;">{PRODUCT_HEADLINE}</h2>
            <p style="margin:0 0 14px 0; font-family:Arial,Helvetica,sans-serif; font-size:14px; color:#444444; line-height:1.6;">{PRODUCT_DESCRIPTION}</p>
            {CTA_BUTTON}
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td style="padding:28px 40px 0 40px;">
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr><td style="border-top:1px solid #dddddd; font-size:0; line-height:0;">&nbsp;</td></tr>
      </table>
    </td>
  </tr>
</table>
```

### Image-Right layout

Swap the two `<td>` elements: text first, image second.

---

## Module 08 — Mini Cards (3-up)

Three secondary topics in a grid. Each card stacks on mobile via `class="mini-card"`.

```html
<!-- Module 08: Mini Cards -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px; background-color:#ffffff;">
  <tr>
    <td style="padding:28px 40px 0 40px;">
      <h2 style="margin:0 0 18px 0; font-family:Arial,Helvetica,sans-serif; font-size:17px; font-weight:bold; color:#1a1a1a;">{SECTION_HEADLINE}</h2>
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
          <td width="31%" class="mini-card" valign="top" style="background-color:{TINT_BG}; padding:18px; border-radius:4px; border-top:3px solid {BRAND_COLOR};">
            <p style="margin:0 0 4px 0; font-family:Arial,Helvetica,sans-serif; font-size:10px; font-weight:bold; color:{BRAND_COLOR}; text-transform:uppercase; letter-spacing:1px;">{EYEBROW_1}</p>
            <h3 style="margin:0 0 8px 0; font-family:Arial,Helvetica,sans-serif; font-size:14px; font-weight:bold; color:#1a1a1a; line-height:1.3;">{CARD_TITLE_1}</h3>
            <p style="margin:0 0 12px 0; font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#555555; line-height:1.5;">{CARD_BODY_1}</p>
            <a href="{CARD_LINK_1}" target="_blank" style="font-family:Arial,Helvetica,sans-serif; font-size:12px; color:{BRAND_COLOR}; font-weight:bold; text-decoration:none;">View Products &rarr;</a>
          </td>
          <td width="3%" class="hide-sm">&nbsp;</td>
          <td width="31%" class="mini-card" valign="top" style="background-color:{TINT_BG}; padding:18px; border-radius:4px; border-top:3px solid {BRAND_COLOR};">
            <!-- duplicate the structure above for card 2 -->
          </td>
          <td width="3%" class="hide-sm">&nbsp;</td>
          <td width="31%" class="mini-card" valign="top" style="background-color:{TINT_BG}; padding:18px; border-radius:4px; border-top:3px solid {BRAND_COLOR};">
            <!-- duplicate the structure above for card 3 -->
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
```

`{TINT_BG}` is a very light tint of the brand color, e.g. `#f0fafb` for teal, `#f0f6fb` for blue, `#fff9e6` for yellow. Or use neutral `#f5f5f5`.

---

## Module 09 — CTA Banner

Dark or brand-color box with primary + ghost buttons.

```html
<!-- Module 09: CTA Banner -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px; background-color:#ffffff;">
  <tr>
    <td style="padding:30px 40px;">
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="background-color:#1a1a1a; border-radius:6px;">
        <tr>
          <td style="padding:32px 30px; text-align:center;">
            <h2 style="margin:0 0 10px 0; font-family:Arial,Helvetica,sans-serif; font-size:20px; font-weight:bold; color:{BRAND_COLOR}; line-height:1.3;">{BANNER_HEADLINE}</h2>
            <p style="margin:0 0 22px 0; font-family:Arial,Helvetica,sans-serif; font-size:14px; color:#cccccc; line-height:1.6;">{BANNER_SUBTEXT}</p>
            <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center">
              <tr>
                <td bgcolor="{BRAND_COLOR}" style="border-radius:4px;">
                  <a href="{PRIMARY_CTA_URL}" target="_blank" style="display:inline-block; padding:13px 22px; font-family:Arial,Helvetica,sans-serif; font-size:14px; font-weight:bold; color:#ffffff; text-decoration:none; border-radius:4px;">{PRIMARY_CTA_LABEL}</a>
                </td>
                <td style="width:12px;">&nbsp;</td>
                <td style="border-radius:4px; border:2px solid {BRAND_COLOR};">
                  <a href="{SECONDARY_CTA_URL}" target="_blank" style="display:inline-block; padding:11px 22px; font-family:Arial,Helvetica,sans-serif; font-size:14px; font-weight:bold; color:{BRAND_COLOR}; text-decoration:none; border-radius:3px;">{SECONDARY_CTA_LABEL}</a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
```

---

## Module 10 — Footer

Dark footer with logo, sender attribution, address, legal links.

```html
<!-- Module 10: Footer -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px;">
  <tr>
    <td bgcolor="#1a1a1a" style="padding:28px 40px; text-align:center;">
      <img src="{LOGO_URL}" alt="{BRAND}" width="80" style="max-width:80px; margin-bottom:14px; opacity:0.6; display:block; margin-left:auto; margin-right:auto;">
      <p style="margin:0 0 10px 0; font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#999999; line-height:1.6;">
        {SENDER_LINE_1}<br>
        {ADDRESS}
      </p>
      <p style="margin:0 0 10px 0; font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#999999;">
        <a href="#" style="color:#aaaaaa; text-decoration:underline;">Unsubscribe</a>&nbsp;&bull;&nbsp;
        <a href="{PRIVACY_URL}" target="_blank" style="color:#aaaaaa; text-decoration:underline;">Privacy Policy</a>&nbsp;&bull;&nbsp;
        <a href="{SITE_URL}" target="_blank" style="color:#aaaaaa; text-decoration:underline;">{SITE_LABEL}</a>
      </p>
      <p style="margin:0; font-family:Arial,Helvetica,sans-serif; font-size:11px; color:#555555;">{LEGAL_LINE}</p>
    </td>
  </tr>
</table>
```

For Applied-sent emails, see `applied-defaults.md` for the standard footer values.

---

## Reusable Patterns

### CTA button (use inside any module)

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td bgcolor="{BRAND_COLOR}" style="border-radius:4px;">
      <a href="{URL}" target="_blank" style="display:inline-block; padding:13px 26px; font-family:Arial,Helvetica,sans-serif; font-size:14px; font-weight:bold; color:#ffffff; text-decoration:none; border-radius:4px;">
        {LABEL} &rarr;
      </a>
    </td>
  </tr>
</table>
```

### Video callout block

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="background-color:{TINT_BG}; border-left:4px solid {BRAND_COLOR}; border-radius:0 3px 3px 0;">
  <tr>
    <td style="padding:14px 16px; font-family:Arial,Helvetica,sans-serif; font-size:14px; color:#333333;">
      &#9654;&nbsp;
      <a href="{VIDEO_URL}" target="_blank" style="color:{BRAND_COLOR}; font-weight:bold; text-decoration:none;">Watch: {TITLE}</a>
      &nbsp;&#8212;&nbsp;{DESCRIPTION}
    </td>
  </tr>
</table>
```

### Feature bullet list

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr>
    <td style="padding:5px 0; font-family:Arial,Helvetica,sans-serif; font-size:14px; color:#444444; line-height:1.6;">
      <span style="color:{BRAND_COLOR}; font-weight:bold;">&#9632;</span>&nbsp;
      <strong>{BULLET_TITLE}</strong> &#8212; {BULLET_DESCRIPTION}
    </td>
  </tr>
  <!-- repeat <tr> for each bullet -->
</table>
```

### 2-up tile grid (inside a module)

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr>
    <td width="48%" class="stack-column" valign="top" style="background-color:{TINT_BG}; padding:16px; border-radius:4px;">
      <p style="margin:0 0 6px 0; font-family:Arial,Helvetica,sans-serif; font-size:13px; font-weight:bold; color:{BRAND_COLOR};">{TILE_TITLE}</p>
      <p style="margin:0; font-family:Arial,Helvetica,sans-serif; font-size:13px; color:#444444; line-height:1.5;">{TILE_BODY}</p>
    </td>
    <td width="4%" class="hide-sm">&nbsp;</td>
    <td width="48%" class="stack-column" valign="top" style="background-color:{TINT_BG}; padding:16px; border-radius:4px;">
      <!-- duplicate for tile 2 -->
    </td>
  </tr>
</table>
```

### Light divider (between sections)

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr><td style="border-top:1px solid #dddddd; font-size:0; line-height:0;">&nbsp;</td></tr>
</table>
```

### Brand divider (heavy, between major sections)

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr><td style="border-top:2px solid {BRAND_COLOR}; font-size:0; line-height:0;">&nbsp;</td></tr>
</table>
```

---

## HEAD.html (paste-order reference, not actual code)

Save this as `HEAD.html` in the email folder. It's a comment-only file telling the marketer which order to paste modules.

```html
<!-- {Client} {Topic} Email — Module Order

Paste modules into your email builder in this order:

  module-01-header.html          ← contains all shared styles — always place first
  module-02-hero-image.html
  module-03-hero-headline.html
  module-04-intro.html
  module-05-<topic>.html
  module-06-<topic>.html
  module-07-<topic>.html
  module-08-mini-cards.html
  module-09-cta-banner.html
  module-10-footer.html

No separate HEAD HTML field needed — styles are embedded in module-01.
-->
```
