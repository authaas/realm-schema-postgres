-- name: GetRealm :one
SELECT *
  FROM realm_data.realm
 WHERE id = $1;
