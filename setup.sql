--- You should run this query using psql < setup_db.sql`

DO
$do$
BEGIN
   IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE  rolname = 'todo_user') THEN
      RAISE NOTICE 'Role "my_user" already exists. Skipping.';
   ELSE
      CREATE USER todo_user WITH PASSWORD 'todo_password';
   END IF;
END
$do$;

GRANT ALL PRIVILEGES ON DATABASE todo_db TO todo_user;
GRANT ALL ON SCHEMA public TO todo_user;