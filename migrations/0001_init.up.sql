CREATE SCHEMA realm_data;

-- A realm is a tenant of the system: a population of identities, the
-- mechanisms they authenticate with, and the claims their tokens carry. Every
-- realm but the root descends from another.
CREATE TABLE realm_data.realm (
    id        UUID    PRIMARY KEY,
    parent_id UUID    REFERENCES realm_data.realm (id) ON DELETE RESTRICT,
    name      TEXT    NOT NULL,
    active    BOOLEAN NOT NULL
);

-- One realm has no parent, and which one is decided by whichever creation
-- commits first.
CREATE UNIQUE INDEX realm_root ON realm_data.realm ((parent_id IS NULL)) WHERE parent_id IS NULL;

CREATE INDEX realm_parent_id ON realm_data.realm (parent_id);
