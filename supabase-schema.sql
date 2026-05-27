create extension if not exists "pgcrypto";

create table if not exists public.inspirations (
  id text primary key,
  title text not null,
  where_text text default '',
  category text default '✨ Other',
  notes text default '',
  tags text[] default '{}',
  image_data text,
  ai_result jsonb,
  created_at timestamptz default now()
);

alter table public.inspirations enable row level security;

-- Personal app quick-start policy:
-- allows anon key read/write for this table.
-- For stronger security, add Supabase Auth and user-scoped policies.
drop policy if exists inspirations_anon_all on public.inspirations;
create policy inspirations_anon_all
on public.inspirations
for all
to anon
using (true)
with check (true);
