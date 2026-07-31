create table if not exists public.rsvps (
  id uuid primary key default gen_random_uuid(),
  guest_id text,
  name text not null,
  attendance text not null check (attendance in ('hadir', 'tidak_hadir')),
  guest_count int not null default 1 check (guest_count >= 0),
  message text,
  created_at timestamptz not null default now()
);

alter table public.rsvps enable row level security;

create policy "Public can insert rsvps"
  on public.rsvps for insert
  to anon
  with check (true);

create policy "Public can read rsvps"
  on public.rsvps for select
  to anon
  using (true);
