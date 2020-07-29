#!/bin/bash

init_user_sql() {
psql -v ON_ERROR_STOP=1 <<-EOSQL
CREATE USER $USER_NAME PASSWORD '$USER_PASSWD';
EOSQL
}

init_casepro_sql() {
psql -v ON_ERROR_STOP=1 <<-EOSQL
CREATE DATABASE $DB_NAME OWNER $USER_NAME TEMPLATE template0;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to $USER_NAME;
CREATE EXTENSION hstore;
ALTER USER $USER_NAME WITH superuser;
EOSQL
}

# Create user and database
init_user_sql;
init_casepro_sql;

