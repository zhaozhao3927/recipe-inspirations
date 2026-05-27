# KitchenKopyKat
Personal kitchen copycat recipe book

## Cloud setup (Supabase)

1. Create a Supabase project.
2. In Supabase SQL editor, run `supabase-schema.sql` from this repo.
3. In Supabase:
   - Authentication -> Providers -> enable Google
   - Add your site URL as an allowed redirect URL (for example `https://zhaozhao3927.github.io/KitchenKopyKat/`)
4. Copy:
   - Project URL (`https://<project>.supabase.co`)
   - Project anon key
5. In the app: `Settings` -> `Cloud Sync (Supabase)`:
   - Paste URL + anon key
   - Click `Save Cloud Settings`
   - Click `Sign in with Google`
   - Click `Test Connection`
   - Click `Sync Local -> Cloud` (one-time migration of existing local entries)

After this, each account syncs its own entries across devices.
