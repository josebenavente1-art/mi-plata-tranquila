-- Mi Plata Tranquila: tabla de datos
-- Pega todo esto en Supabase → SQL Editor → New query → Run.

create table if not exists public.app_docs (
  user_id    uuid        not null references auth.users(id) on delete cascade default auth.uid(),
  doc_id     text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, doc_id)
);

-- Cada persona solo puede ver y cambiar sus propios datos
alter table public.app_docs enable row level security;

drop policy if exists "leer lo propio"      on public.app_docs;
drop policy if exists "crear lo propio"     on public.app_docs;
drop policy if exists "modificar lo propio" on public.app_docs;
drop policy if exists "borrar lo propio"    on public.app_docs;

create policy "leer lo propio"      on public.app_docs for select using (auth.uid() = user_id);
create policy "crear lo propio"     on public.app_docs for insert with check (auth.uid() = user_id);
create policy "modificar lo propio" on public.app_docs for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "borrar lo propio"    on public.app_docs for delete using (auth.uid() = user_id);

-- Sincronización en vivo entre el celular y el computador
do $$ begin
  alter publication supabase_realtime add table public.app_docs;
exception when duplicate_object then null; end $$;
