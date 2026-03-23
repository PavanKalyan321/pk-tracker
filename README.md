# pk-tracker

A personal investment portfolio tracker — **TFM Line Registry v4** — built as a mobile-first PWA for managing multiple investment lines across platforms and modules.

---

## What It Does

pk-tracker lets you organize investment accounts ("lines") into platforms and modules, then log all financial activity against them. It gives you a live dashboard view of your portfolio health, P&L, and ROI across currencies.

**Core concepts:**
- **Module** — a top-level investment category (e.g. Betting, Crypto, Stocks)
- **Platform** — a broker or exchange within a module (e.g. WazirX, Zerodha)
- **Line** — an individual account or position on a platform

---

## Features

### Line Management
- Create, edit, and delete modules, platforms, and lines
- Line lifecycle: `INIT → FUNDED → ACTIVE → PAUSED → LOCKED`
- Multi-currency support: INR, USD, USDT, SOL, ETH, BTC, and more

### Financial Tracking
- **Fund** lines with quick-entry buttons (100 / 500 / 1K / 2K / 5K INR)
- **Withdraw** amounts from active lines
- **Record losses** with preset quick amounts
- **Add profits** manually
- **Transfer funds** between lines

### Dashboard & Analytics
- Portfolio summary: total balance, P&L, ROI by currency
- Period profit tracking: today / this week / this month / all-time
- Per-module breakdown with health bars
- Top performers ranked by ROI
- Recent activity log (withdrawals, transfers, losses)
- Mini sparkline charts (last 12 balance snapshots per line)

### Data & Backup
- Export full data to JSON
- Import from JSON backups
- Reset all line balances (with auto-export prompt)
- Full data reset

### PWA / Mobile
- Installable on iOS and Android
- Works offline via Service Worker cache
- Touch-optimized, notch-aware layout

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Vanilla HTML/CSS/JavaScript (no framework) |
| Persistence | `localStorage` (client-side, offline-first) |
| PWA | Service Worker + Web App Manifest |
| Hosting | GitHub Pages (auto-deploy via GitHub Actions) |
| Optional DB | Supabase (PostgreSQL schema included, currently unused) |

---

## Project Structure

```
pk-tracker/
├── index.html          # Entire app — HTML, CSS, and JavaScript
├── sw.js               # Service Worker (offline caching)
├── manifest.json       # PWA manifest
├── icon.svg            # App icon
├── schema.sql          # Supabase DB schema (optional)
├── setup-db.mjs        # Script to initialize Supabase tables
├── package.json        # Node deps (@supabase/supabase-js)
└── .github/
    └── workflows/
        └── deploy.yml  # Auto-deploy to GitHub Pages on push to main
```

All application logic lives in `index.html`. There is no build step.

---

## Running Locally

```bash
# Clone
git clone https://github.com/PavanKalyan321/pk-tracker.git
cd pk-tracker

# Serve (any static server works)
python3 -m http.server 8000
# or: npx serve .
```

Open `http://localhost:8000` in your browser.

---

## Deployment

Pushing to `main` automatically deploys to GitHub Pages via the workflow in [.github/workflows/deploy.yml](.github/workflows/deploy.yml). No build process required — the output is the static `index.html`.

---

## Data Storage

All data is stored in `localStorage` under the `tfm4-*` keys:

| Key | Contents |
|---|---|
| `tfm4-modules` | Module list |
| `tfm4-platforms` | Platform list |
| `tfm4-lines` | Line records |
| `tfm4-log` | Activity log |

Use the **Export** button to back up data before resetting or switching devices.

---

## Optional: Supabase Setup

A full PostgreSQL schema (`schema.sql`) and setup script (`setup-db.mjs`) are included if you want cloud persistence. Currently disabled in favor of the simpler localStorage approach.

```bash
SUPABASE_SERVICE_KEY=your_key node setup-db.mjs
```
