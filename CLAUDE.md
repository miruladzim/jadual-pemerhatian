# Jadual Pemerhatian Praktikum (Prof. Teh Ling)

## What this is
A single-page web app where teacher trainees under supervisor **Prof. Teh Ling** record their teaching-practicum observation schedule (date, time, video/RPH/Google Meet link, note), replacing manual posts in a WhatsApp group. The supervisor and all trainees see the same list, updated live. Users have **no accounts** (no Claude, no login), so the site must work for anyone with the link.

Owner: Amirul (one of the trainees). Primary UI language: Bahasa Melayu, with a BM | EN toggle.

## Stack
- `index.html`: the whole app (HTML + CSS + vanilla JS, no build step).
- Firebase Cloud Firestore (compat SDK 10.12.2 from gstatic) for shared, realtime data.
- `firebase-config.js`: Firebase web config (placeholders `ISI_...` until filled in).
- `firestore.rules`: security rules (open read/write for the group, with field/size validation).
- Hosting: GitHub Pages from `main` / root (`.nojekyll` present).

## Data model
Collection `sesi`, doc id = `<slug-of-name>-p<observation>`:
`nama, pemerhatian (1|2), tarikh (YYYY-MM-DD), mula (HH:MM), tamat (HH:MM or ""), mod ("video"|"langsung"), pautan, catatan, dinilai (bool), dikemaskini (ms)`.
Doc `meta/seed` marks that the 16 original records (embedded as `SEED` in index.html) were loaded on first run. Do not add, invent or remove trainee data: only the names, dates, times and notes the owner supplied.

## Design decisions (keep these)
- Simple UX: one list, one "+ Tambah jadual saya" button, tap a card's pencil or name to edit/delete.
- Only **two** observations (tabs "Pemerhatian 1" / "Pemerhatian 2").
- Sections: "Akan datang" first; "Sudah berlalu" is a collapsible `<details>` (closed by default), past cards are fully readable, not faded.
- "Selesai" is an iOS-style switch (`role="switch"`); status is shared with everyone.
- Light "aero glass" theme, always light (ignores phone dark mode); compact, fluid scale for phones 320–430px; no live backdrop-filter on scrolling cards (performance).
- Form button labels: "Tutup" and "Simpan". Header shows "Penyelia: Prof. Teh Ling".
- Inputs stay 16px (prevents iOS zoom); link field is `type=text inputmode=url` (type=url blocked saving without https://).

## Next steps (what the owner asked for)
1. Create a new GitHub repository (suggested name: `jadual-pemerhatian`), commit these files, push to `main`.
2. Enable GitHub Pages (branch `main`, root) and report the public URL.
3. Help the owner create the Firebase project + Firestore (region asia-southeast1), publish `firestore.rules`, register a Web app and paste its config into `firebase-config.js`, then commit and push.
4. Open the live site once to trigger the one-time seed, and confirm all 16 records appear.

Ask before creating the repo public/private and before any destructive git operation.

## Releasing changes (owner wants updates live ASAP)
Every change to the site: bump `APP_VERSION` in index.html **and** `v` in `version.json` to the same new value, commit, push to `main`, then confirm the Pages build finished. Open pages poll `version.json` (every 2 min and when the tab becomes visible) and reload themselves onto the new version, skipping while the form dialog is open.
