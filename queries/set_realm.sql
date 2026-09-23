-- name: SetRealm :execrows
UPDATE realm_data.realm
   SET name = $2,
       active = $3
 WHERE id = $1;
