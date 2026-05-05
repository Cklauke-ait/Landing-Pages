# Applied Industrial Technologies — Email Defaults

Use these for any email Applied is sending on behalf of a client brand. Drop these values straight into the module templates without asking the user to confirm.

---

## Sender Attribution

In the footer (Module 10):

```
This email was sent by Applied Industrial Technologies on behalf of {BRAND}.
1 Applied Plaza • Cleveland, OH 44115
```

---

## Address

```
1 Applied Plaza
Cleveland, OH 44115
```

---

## Image CDN Base Path

All hosted assets for Applied campaigns live at:

```
https://6847819.fs1.hubspotusercontent-na1.net/hubfs/6847819/
```

When the user provides image URLs starting with this path, they're already correct. When they describe an image without a URL, ask for the upload before building.

---

## Footer Links

| Purpose       | URL                                                                |
|---------------|--------------------------------------------------------------------|
| Unsubscribe   | `#` (placeholder — HubSpot replaces with a real token at send time) |
| Privacy Policy| `https://www.applied.com/content/applied/en-us/privacy-policy.html`|
| Site          | `https://www.applied.com`                                          |

Display label for the site link in the footer: `applied.com`

---

## Standard CTAs

These show up across most Applied-sent emails. Use them in the CTA banner (Module 09) and elsewhere.

| Label                           | URL Pattern                                                    |
|---------------------------------|----------------------------------------------------------------|
| Shop All {Brand} Products       | `https://www.applied.com/brands/{brand-slug}/c/Brand-{ID}`     |
| Find a Service Center           | `https://www.applied.com/store-finder`                         |
| Browse Brand Catalog            | `https://www.applied.com/brands/{brand-slug}/c/Brand-{ID}`     |

Always confirm the exact brand-page URL with the user — IDs and slugs vary per brand.

---

## Legal Line

```
© {YEAR} Applied Industrial Technologies. All rights reserved.
```

Replace `{YEAR}` with the current year.

---

## Known Client Brand Pages

As we build emails, we collect verified Applied.com brand-page URLs here. Add to this list whenever a new client is built.

| Brand   | Brand Page URL                                                                  | Primary Color |
|---------|--------------------------------------------------------------------------------|---------------|
| SKF     | `https://www.applied.com/brands/skf-corp/c/Brand-261`                           | `#005B9A` (blue) |
| Timken  | `https://www.applied.com/brands/timken-company/timken-co-/c/Brand-2051`         | `#00838F` (teal — Applied palette) |

---

## Footer block — Module 10 — Applied-ready

Copy-paste version with Applied defaults filled in. Just swap `{BRAND}` and `{LOGO_URL}`.

```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" class="email-container" style="max-width:600px;">
  <tr>
    <td bgcolor="#1a1a1a" style="padding:28px 40px; text-align:center;">
      <img src="{LOGO_URL}" alt="{BRAND}" width="80" style="max-width:80px; margin-bottom:14px; opacity:0.6; display:block; margin-left:auto; margin-right:auto;">
      <p style="margin:0 0 10px 0; font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#999999; line-height:1.6;">
        This email was sent by Applied Industrial Technologies on behalf of {BRAND}.<br>
        1 Applied Plaza &bull; Cleveland, OH 44115
      </p>
      <p style="margin:0 0 10px 0; font-family:Arial,Helvetica,sans-serif; font-size:12px; color:#999999;">
        <a href="#" style="color:#aaaaaa; text-decoration:underline;">Unsubscribe</a>&nbsp;&bull;&nbsp;
        <a href="https://www.applied.com/content/applied/en-us/privacy-policy.html" target="_blank" style="color:#aaaaaa; text-decoration:underline;">Privacy Policy</a>&nbsp;&bull;&nbsp;
        <a href="https://www.applied.com" target="_blank" style="color:#aaaaaa; text-decoration:underline;">applied.com</a>
      </p>
      <p style="margin:0; font-family:Arial,Helvetica,sans-serif; font-size:11px; color:#555555;">&copy; 2026 Applied Industrial Technologies. All rights reserved.</p>
    </td>
  </tr>
</table>
```
