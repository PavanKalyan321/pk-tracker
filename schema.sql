-- TFM Line Registry v4 — Supabase Schema
-- Run this in Supabase SQL Editor: https://supabase.com/dashboard/project/vxgczsordoackfzoudud/sql

-- Modules table
CREATE TABLE IF NOT EXISTS tfm_modules (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  icon        TEXT DEFAULT '💰',
  color       TEXT DEFAULT '#4C9EFF',
  description TEXT DEFAULT '',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Platforms table
CREATE TABLE IF NOT EXISTS tfm_platforms (
  id     TEXT NOT NULL,
  module TEXT NOT NULL,
  icon   TEXT DEFAULT '⭐',
  color  TEXT DEFAULT '#4C9EFF',
  PRIMARY KEY (id, module)
);

-- Lines table
CREATE TABLE IF NOT EXISTS tfm_lines (
  id          TEXT PRIMARY KEY,
  platform    TEXT NOT NULL,
  module      TEXT NOT NULL,
  label       TEXT DEFAULT 'Line 1',
  status      TEXT DEFAULT 'initialized',
  balance     FLOAT8 DEFAULT 0,
  deposit     FLOAT8 DEFAULT 0,
  currency    TEXT DEFAULT 'INR',
  last_active TIMESTAMPTZ,
  notes       TEXT DEFAULT '',
  history     JSONB DEFAULT '[]',
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Logs table
CREATE TABLE IF NOT EXISTS tfm_logs (
  id   BIGSERIAL PRIMARY KEY,
  time TIMESTAMPTZ DEFAULT NOW(),
  msg  TEXT
);

-- Enable RLS
ALTER TABLE tfm_modules   ENABLE ROW LEVEL SECURITY;
ALTER TABLE tfm_platforms ENABLE ROW LEVEL SECURITY;
ALTER TABLE tfm_lines     ENABLE ROW LEVEL SECURITY;
ALTER TABLE tfm_logs      ENABLE ROW LEVEL SECURITY;

-- Allow anon full access (personal app — no auth needed)
CREATE POLICY "anon_all" ON tfm_modules   FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all" ON tfm_platforms FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all" ON tfm_lines     FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all" ON tfm_logs      FOR ALL TO anon USING (true) WITH CHECK (true);
