CREATE TABLE login (
    id        SERIAL PRIMARY KEY NOT NULL,
    username  VARCHAR(50) NOT NULL,
    password  VARCHAR(255) NOT NULL
);
