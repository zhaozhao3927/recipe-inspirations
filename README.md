# recipe-inspirations
Personal recipe inspiration book

## Cloud setup (Supabase)

1. Create a Supabase project.
2. In Supabase SQL editor, run `supabase-schema.sql` from this repo.
3. Copy:
   - Project URL (`https://<project>.supabase.co`)
   - Project anon key
4. In the app: `Settings` -> `Cloud Sync (Supabase)`:
   - Paste URL + anon key
   - Click `Save Cloud Settings`
   - Click `Test Connection`
   - Click `Sync Local -> Cloud` (one-time migration of existing local entries)

After this, new saves/deletes sync to cloud and can be shared across devices.
