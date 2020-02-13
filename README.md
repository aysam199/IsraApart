# IsraApart
Search and book apartments all over the country with this easy to use web.
P.S the data is a dummy data, no real data was used in implementing this application.

# Used technologies and languages:
JS vanilla
HTML5
CSS3
Node.js
Postgresql
Heroku


# Testing:
If you want to run the tests you need to set up a testing database.
Requirements:(Available also as devdependencies in package.json)
have the following node packages installed:
-psql or pgcli
-tape
-supertest
-jest

1. Create testing db.
   - In your terminal start psql or pgcli.

In terminal,Enter the following:
- CREATE DATABASE testapartmentdb;
You can create a user or skip and use existing user.
- CREATE USER [user_name] WITH SUPERUSER PASSWORD ['password'];

- ALTER DATABASE testapartmentdb OWNER TO [user_name];

2. In your .env file add this :
   `TEST_DB_URL = postgres://[user_name]:[password]@localhost:5432/[db_name]`
   replace the [] entries with the ones you setup.
