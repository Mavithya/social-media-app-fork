-- Add unique constraint for username field if it doesn't exist
-- Email unique constraint should already exist from User entity annotation

-- Add unique constraint to username field only if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'users_username_unique'
    ) THEN
        ALTER TABLE users ADD CONSTRAINT users_username_unique UNIQUE (username);
    END IF;
END $$;
