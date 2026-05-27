create extension if not exists "pgcrypto";

create table if not exists public.inspirations (
  id text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
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

-- Ensure user_id exists for older tables that were created before this column.
alter table public.inspirations add column if not exists user_id uuid references auth.users(id) on delete cascade;

-- Account-scoped policies: each signed-in user can access only their own rows.
drop policy if exists inspirations_anon_all on public.inspirations;
drop policy if exists inspirations_select_own on public.inspirations;
drop policy if exists inspirations_insert_own on public.inspirations;
drop policy if exists inspirations_update_own on public.inspirations;
drop policy if exists inspirations_delete_own on public.inspirations;

create policy inspirations_select_own
on public.inspirations
for select
to authenticated
using (auth.uid() = user_id);

create policy inspirations_insert_own
on public.inspirations
for insert
to authenticated
with check (auth.uid() = user_id);

create policy inspirations_update_own
on public.inspirations
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy inspirations_delete_own
on public.inspirations
for delete
to authenticated
using (auth.uid() = user_id);
