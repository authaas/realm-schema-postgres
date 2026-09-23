-- name: CreateRealm :exec
INSERT INTO realm_data.realm (id, parent_id, name, active)
VALUES ($1, $2, $3, $4);
