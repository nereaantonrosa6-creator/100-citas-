-- Ejecuta este archivo en Supabase → SQL Editor → New query
create table if not exists public.couple_state (
  id bigint primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.couple_state enable row level security;
drop policy if exists "Authenticated users can read shared couple state" on public.couple_state;
drop policy if exists "Authenticated users can insert shared couple state" on public.couple_state;
drop policy if exists "Authenticated users can update shared couple state" on public.couple_state;
create policy "Authenticated users can read shared couple state" on public.couple_state for select to authenticated using (true);
create policy "Authenticated users can insert shared couple state" on public.couple_state for insert to authenticated with check (true);
create policy "Authenticated users can update shared couple state" on public.couple_state for update to authenticated using (true) with check (true);
grant select, insert, update on public.couple_state to authenticated;
